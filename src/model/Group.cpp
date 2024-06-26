
#include <algorithm>
#include <cassert>
#include <iostream>
#include "Group.h"
#include "FishType.h"

using namespace std;


Group::Group() : breeder(BREEDER) {
    this->parameters = Parameters::instance();

    breederAlive = true;
    cumHelpType0 = Parameters::NO_VALUE;
    cumHelpType1 = Parameters::NO_VALUE;
    fecundity = Parameters::NO_VALUE;
    realFecundity = Parameters::NO_VALUE;

    for (int i = 0; i < parameters->getInitNumHelpers(); ++i) {
        auto individual = Individual(HELPER);
        helpers.emplace_back(individual);
    }

    calculateGroupSize();
}

/* TOTAL NUMBER OF INDIVIDUALS PER GROUP*/

void Group::calculateGroupSize() {
    if (breederAlive) {
        groupSize = helpers.size() + 1;
    } else {
        groupSize = helpers.size();
    }
}

/*  DISPERSAL (STAY VS DISPERSE) */

vector<Individual> Group::disperse() {

    vector<Individual> newFloaters;

    for (int i = 0; i < helpers.size();) {
        Individual &helper = helpers[i];

        helper.calcDispersal();

        if (parameters->uniform(*parameters->getGenerator()) < helper.getDispersal()) {
            helper.setInherit(false); //the location of the individual is not the natal territory
            helper.setFishType(FLOATER);
            helper.calculateRank(); //calculate rank for floaters (=age)
            newFloaters.push_back(helper); //add the individual to the vector floaters in the last position
            helpers.removeIndividual(i);

        } else {
            helper.setFishType(HELPER); //individuals that stay or disperse to this group become helpers
            i++;
        }

    }
    return newFloaters;
}

std::vector<Individual> Group::reassignNoRelatedness(int index) {

    std::vector<Individual> noRelatedHelpers;

    for (int i = 0; i < helpers.size();) {
        Individual &helper = helpers[i];
        if (helper.getAge() == 1) { // all new offspring is assigned to new groups so no related to breeder

            helper.setInherit(false); //the location of the individual is not the natal territory
            noRelatedHelpers.push_back(helper); //add the individual to the vector in the last position
            helpers.removeIndividual(i); // removes the individual from the helpers vector

        } else {
            i++;
        }
        helper.setGroupIndex(index);
    }
    return noRelatedHelpers;
}


/*  CALCULATE CUMULATIVE LEVEL OF HELP */

void Group::calculateCumulativeHelp() //Calculate accumulative help of all individuals inside of each group.
{
    cumHelpType0 = 0;
    cumHelpType1 = 0;

    //Level of help for helpers
    for (Individual &helper: helpers) {
        assert(helper.getFishType() == HELPER);
        helper.calcHelp();
        helper.calcTaskSpecialization();
        helper.calculateRank();

        if (helper.getHelpType() == 0){
            cumHelpType0 += helper.getHelp();
        } else {
            cumHelpType1 += helper.getHelp();
        }
    }
}

/*  MORTALITY */

void Group::survivalGroup() {
    this->calculateGroupSize();
    //Calculate survival for the helpers
    for (Individual &helper: helpers) {
        helper.calculateSurvival(groupSize);
    }

    //Calculate the survival of the breeder
        this->breeder.calculateSurvival(groupSize);
}

void Group::mortalityGroup(int &deaths) {

    vector<Individual, std::allocator<Individual>>::iterator helperIt;
    helperIt = helpers.begin();
    int sizeVectorHelpers = helpers.size();
    int counting = 0;
    while (!helpers.empty() && sizeVectorHelpers > counting) {

        //Mortality helpers
        if (parameters->uniform(*parameters->getGenerator()) > helperIt->getSurvival()) {
            *helperIt = helpers[helpers.size() - 1];
            helpers.pop_back();
            counting++;
            deaths++;
        } else
            helperIt++, counting++; //go to next individual
    }

    //Mortality breeder
    if (breederAlive && parameters->uniform(*parameters->getGenerator()) > breeder.getSurvival()) {
        breederAlive = false;
        deaths++;
        if (parameters->isDirectBroodCareOnly()) {
            cumHelpType0 = 0; //removes help for new breeder
            cumHelpType1 = 0;
        }
    }
    this->calculateGroupSize(); //update group size after mortality
}


/* BECOME BREEDER */

void Group::newBreeder(vector<Individual> &floaters, int &newBreederFloater, int &newBreederHelper, int &inheritance) {
    //    Select a random sample from the floaters
    int i = 0;
    double sumRank = 0;
    double currentPosition = 0; //age of the previous ind taken from Candidates
    int floaterSampledID;
    double RandP = parameters->uniform(*parameters->getGenerator());
    int proportionFloaters;
    proportionFloaters = round(floaters.size() * parameters->getBiasFloatBreeder() / parameters->getMaxColonies());

    vector<Individual *> candidates;
    vector<double> position; //vector of age to choose with higher likelihood the ind with higher age
    vector<int> TemporaryCandidates; // to prevent taking the same ind several times in the sample

    if (!floaters.empty() && floaters.size() > proportionFloaters) {
        while (i < proportionFloaters) {
            uniform_int_distribution<int> UniformFloat(0, floaters.size() - 1); //random floater ID taken in the sample
            floaterSampledID = UniformFloat(*parameters->getGenerator());
            TemporaryCandidates.push_back(floaterSampledID); //add references of the floaters sampled to a vector
            sort(TemporaryCandidates.begin(), TemporaryCandidates.end()); //sort vector
            i++;
        }

        int temp = 0;
        vector<int, std::allocator<int>>::iterator itTempCandidates;
        for (itTempCandidates = TemporaryCandidates.begin();
             itTempCandidates < TemporaryCandidates.end(); ++itTempCandidates) {
            if (*itTempCandidates != temp) //to make sure the same ind is not taken more than ones
            {
                candidates.push_back(&floaters[floaterSampledID]);
                temp = *itTempCandidates;
            }
        }
    } else if (!floaters.empty() && floaters.size() <
                                    proportionFloaters) { //TODO:When less floaters available than the sample size, takes all of them. Change to a proportion?
        vector<Individual, std::allocator<Individual>>::iterator floaterIt;
        for (floaterIt = floaters.begin(); floaterIt < floaters.end(); ++floaterIt) {
            candidates.push_back(&(*floaterIt));
        }
    }

    //    Join the helpers in the group to the sample of floaters
    vector<Individual, std::allocator<Individual>>::iterator helperIt;
    for (helperIt = helpers.begin(); helperIt < helpers.end(); ++helperIt) {
        candidates.push_back(&(*helperIt));
    }

    //  Check if the candidates meet the age requirements, else remove them from the candidates vector
    vector<Individual *, std::allocator<Individual *>>::iterator candidateIt;
    candidateIt = candidates.begin();
    while (candidateIt != std::end(candidates)) {
        if ((*candidateIt)->isViableBreeder()) {
            ++candidateIt;
        } else {
            candidateIt = candidates.erase(candidateIt);
        }
    }
    //  Choose new breeder
        //    Choose breeder with higher likelihood for the highest rank
        for (candidateIt = candidates.begin(); candidateIt < candidates.end(); ++candidateIt) {
            sumRank += (*candidateIt)->getRank(); //add all the ranks from the vector candidates
        }

        for (candidateIt = candidates.begin(); candidateIt < candidates.end(); ++candidateIt) {
            position.push_back(static_cast<double>((*candidateIt)->getRank()) / static_cast<double>(sumRank) +
                               currentPosition); //creates a vector with proportional segments to the rank of each individual
            currentPosition = position[position.size() - 1];
        }

        candidateIt = candidates.begin();
        int counting = 0;
        while (counting < candidates.size()) {
            if (RandP < position[candidateIt - candidates.begin()]) //to access the same ind in the candidates vector
            {
                breeder = **candidateIt; //substitute the previous dead breeder
                breederAlive = true;
                breeder.setAgeBecomeBreeder(breeder.getAge());
                breeder.setRankBecomeBreeder(breeder.getRank());

                if ((*candidateIt)->getFishType() == FLOATER) //delete the ind from the vector floaters
                {
                    **candidateIt = floaters[floaters.size() - 1];
                    floaters.pop_back();
                    newBreederFloater++;
                } else {
                    **candidateIt = helpers[helpers.size() - 1]; //delete the ind from the vector helpers
                    helpers.pop_back();
                    newBreederHelper++;
                    if ((*candidateIt)->isInherit() == 1) {
                        inheritance++;                    //calculates how many individuals that become breeders are natal to the territory
                    }
                }

                breeder.setFishType(BREEDER); //modify the class
                counting = candidates.size();//end loop
            } else
                ++candidateIt, ++counting;
        }
}



/* INCREASE AGE OF ALL GROUP INDIVIDUALS*/
void Group::increaseAge() {
    for (Individual &helper: helpers) {
        helper.increaseAge();
    }
    if (breederAlive) {
        breeder.increaseAge(breederAlive);
    }
}


/* REPRODUCTION */

void Group::reproduce(int generation) { // populate offspring generation
    //Calculate fecundity

    double maxCumHelp = (cumHelpType0 + cumHelpType1) / 2 + parameters->getKm();
    double allowedCumHelp0 = cumHelpType0;
    double allowedCumHelp1 = cumHelpType1;

    if (parameters->isNeedDivisionLabour()){
        if (cumHelpType0 > maxCumHelp) {
            allowedCumHelp0 = maxCumHelp;
        }

        if (cumHelpType1 > maxCumHelp) {
            allowedCumHelp1 = maxCumHelp;
        }
    }

    double totalCumHelp = allowedCumHelp0 + allowedCumHelp1;


    fecundity = parameters->getK0() + parameters->getKh() * totalCumHelp / (1 + totalCumHelp);

    poisson_distribution<int> PoissonFecundity(fecundity);
    realFecundity = PoissonFecundity(*parameters->getGenerator()); //integer number

    //Reproduction
    if (breederAlive) {
        for (int i = 0; i < realFecundity; i++) { //number of offspring dependent on real fecundity
            Individual offspring = Individual(breeder, HELPER, generation);

            helpers.emplace_back(offspring); //create a new individual as helper in the group. Call construct to assign the mother genetic values to the offspring, construct calls Mutate function.
        }
    }
}

const Individual &Group::getBreeder() const {
    return breeder;
}

int Group::getGroupSize() const {
    return groupSize;
}

bool Group::isBreederAlive() const {
    return breederAlive;
}

double Group::getCumHelpType0() const {
    return cumHelpType0;
}

double Group::getCumHelpType1() const {
    return cumHelpType1;
}

std::vector<double> Group::get(Attribute attribute, bool includeBreeder) const {
    std::vector<double> result;
    if (includeBreeder && isBreederAlive()) {
        result.push_back(breeder.get(attribute));
    }
    for (const Individual &helper: helpers) {
        result.push_back(helper.get(attribute));
    }
    return result;
}

std::vector<double> Group::get(Attribute attribute) const {
    return this->get(attribute, true);
}


bool Group::hasHelpers() const {
    return !helpers.empty();
}

void Group::addHelper(const Individual &helper) {
    this->helpers.emplace_back(helper);
}

const IndividualVector &Group::getHelpers() const {
    return helpers;
}




