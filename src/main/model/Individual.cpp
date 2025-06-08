
#include <iostream>
#include <cassert>

#include "Individual.h"
#include "FishType.h"

//Constructor for reproduction of a Breeder
Individual::Individual(Individual &individual, FishType fishType, int &generation) {

    assert(individual.fishType == BREEDER);

    this->alpha = individual.alpha;
    this->alphaAge = individual.alphaAge;
    this->beta = individual.beta;
    this->betaAge = individual.betaAge;
    this->gamma = individual.gamma;
    this->gammaRank = individual.gammaRank;
    this->drift = individual.getDrift();

    this->dispersal = Parameters::NO_VALUE;
    this->help = Parameters::NO_VALUE;
    this->helpType = 0;
    this->task = Parameters::NO_VALUE;

    this->initializeIndividual(fishType);

    this->mutate(generation);
}

//Constructor for initial creation
Individual::Individual(FishType fishType, const std::shared_ptr<Parameters> &parameters) : parameters(parameters) {


    this->alpha = parameters->getInitAlpha();
    this->alphaAge = parameters->getInitAlphaAge();
    this->beta = parameters->getInitBeta();
    this->betaAge = parameters->getInitBetaAge();
    this->gamma = parameters->getInitGamma();
    this->gammaRank = parameters->getInitGammaRank();
    this->drift = parameters->driftUniform(*parameters->getGenerator());
    this->initializeIndividual(fishType);
}

void Individual::initializeIndividual(FishType type) {
    this->dispersal = Parameters::NO_VALUE;
    this->help = 0;
    this->helpType = 0;
    this->task = Parameters::NO_VALUE;
    this->survival = Parameters::NO_VALUE;
    this->fishType = type;
    this->inherit = true;
    this->age = 1;
    this->ageBecomeBreeder = Parameters::NO_VALUE;
    this->rank = Parameters::NO_VALUE;
    this->rankBecomeBreeder = Parameters::NO_VALUE;
}

/* BECOME FLOATER (STAY VS DISPERSE) */

void Individual::calcDispersal() {
    if (!parameters->isReactionNormDispersal()) {
        this->dispersal = beta;
    } else {
        this->dispersal = 1 / (1 + exp(betaAge * age - beta));
    }

    if (parameters->isNoGroupAugmentation() && parameters->isNoRelatedness() && age ==
                                                                                1) { //this removes further any effect of group augmentation vs group benefits since help does not increase recruitment
        this->dispersal = 1; //TODO: keep this? it also removes relatedness since all offspring disperse
    }
}

void Individual::setGroupIndex(int groupIndex) {
    Individual::groupIndex = groupIndex;
}

/*DISPLAY LEVEL OF HELP*/

void Individual::calcHelp() {
    if (fishType == HELPER) {
        if (!parameters->isReactionNormHelp()) {
            help = alpha;

        } else {
            help = alpha + alphaAge * age;
        }
        if (help < 0) { help = 0; }

    } else {
        help = Parameters::NO_VALUE;
        std::cout << "Error: floaters get a help value" << std::endl;
    }
}

/*CALCULATE TASK SPECIALIZATION*/

void Individual::calcTaskSpecialization() {
    if (fishType == HELPER) {
        if (!parameters->isReactionNormTask()) {
            task = gamma;
            if (task < 0) {
                task = 0;
            } else if (task > 1) { task = 1; }
        } else {
            task = 1 / (1 + exp(gammaRank * rank - gamma));
        }

        if (parameters->uniform(*parameters->getGenerator()) > task) {
            helpType = 0; // cost in rank
        } else {
            helpType = 1; // cost in survival
        }

    } else {
        task = Parameters::NO_VALUE;
        std::cout << "Error: floaters get a task value" << std::endl;
    }
}

/* CALCULATE RANK */
void Individual::calculateRank() {

    int multiplier = 10; // increases the effective difference in rank to the likelihood to become breeder
    if (!parameters->isAgeNoInfluenceInheritance()) {
        //Gerontocratic context
        if (fishType == HELPER && helpType == 0) {
            rank = (age - parameters->getYh() * help);
            if (rank < 0.001) {
                rank = 0.001;
            }
        } else {
            rank = age;
        }
    } else {
        //Scramble context
        if (fishType == HELPER && helpType == 0) {
            rank = (parameters->getFixedIndQuality() - parameters->getYh() * help) * multiplier;
            if (age == parameters->getMinAgeBecomeBreeder()) {
                rank = 0.001;
            }
            if (rank < 0.001) {
                rank = 0.001;
            }
        } else {
            rank = parameters->getFixedIndQuality() * multiplier;
            if (age == parameters->getMinAgeBecomeBreeder()) {
                rank = 0.001;
            }
        }
    }
}


/*SURVIVAL*/

void Individual::calculateSurvival(const int &groupSize) {

    if (parameters->isNoGroupAugmentation()) {
        if (fishType == FLOATER) {
            this->survival = (1 - parameters->getM() * parameters->getN()) / (1 + exp(-parameters->getX0()));
        } else {
            if (fishType == HELPER && helpType == 1) {
                this->survival = (1 - parameters->getM()) /
                                 (1 +
                                  exp(-parameters->getX0() - parameters->getXsn() * parameters->getFixedGroupSize() +
                                      parameters->getXsh() * this->help));
            } else {
                this->survival = (1 - parameters->getM()) /
                                 (1 +
                                  exp(-parameters->getX0() - parameters->getXsn() * parameters->getFixedGroupSize()));
            }
        }

    } else {
        if (fishType == FLOATER) {
            this->survival = (1 - parameters->getM() * parameters->getN()) / (1 + exp(-parameters->getX0()));
        } else {
            if (fishType == HELPER && helpType == 1) {
                this->survival = (1 - parameters->getM()) /
                                 (1 + exp(-parameters->getX0() - parameters->getXsn() * groupSize +
                                          parameters->getXsh() * this->help));
            } else {
                this->survival = (1 - parameters->getM()) /
                                 (1 + exp(-parameters->getX0() - parameters->getXsn() * groupSize));
            }
        }
    }
}


/*MUTATION*/

void Individual::mutate(int generation) // mutate genome of offspring
{
    auto rng = *parameters->getGenerator();
    std::normal_distribution<double> NormalA(0, parameters->getStepAlpha()); //TODO: could be simplified
    std::normal_distribution<double> NormalB(0, parameters->getStepBeta());
    std::normal_distribution<double> NormalG(0, parameters->getStepGamma());
    std::normal_distribution<double> NormalD(0, parameters->getStepDrift());

    // Alpha
    double mutationAlpha;
    double mutationAlphaAge;

    if (parameters->isNoRelatedness() && parameters->isNoRelatednessRandomGroup()) {
        mutationAlpha = 0;
        mutationAlphaAge = 0;
    } else {
        mutationAlpha = parameters->getMutationAlpha();
        mutationAlphaAge = parameters->getMutationAlphaAge();
    }

    if (parameters->uniform(rng) < mutationAlpha) {
        alpha += NormalA(rng);
    }
    if (parameters->isReactionNormHelp()) {
        if (parameters->uniform(rng) < mutationAlphaAge) {
            alphaAge += NormalA(rng);
        }
    }

    // Beta
    if (parameters->uniform(rng) < parameters->getMutationBeta()) {
        beta += NormalB(rng);
        if (!parameters->isReactionNormDispersal()) {
            if (beta < 0) { beta = 0; }
            else if (beta > 1) { beta = 1; }
        }
    }
    if (parameters->isReactionNormDispersal()) {
        if (parameters->uniform(rng) < parameters->getMutationBetaAge()) {
            betaAge += NormalB(rng);
        }
    }

    // Gamma
    double mutationGamma;
    double mutationGammaRank;

    if (parameters->isEvolutionTaskAfterHelp() && generation < 25000) {
        mutationGamma = 0;
        mutationGammaRank = 0;
    } else {
        mutationGamma = parameters->getMutationGamma();
        mutationGammaRank = parameters->getMutationGammaRank();
    }

    if (parameters->uniform(rng) < mutationGamma) {
        gamma += NormalG(rng);
        if (!parameters->isReactionNormTask()) {
            if (gamma < 0) { gamma = 0; }
            else if (gamma > 1) { gamma = 1; }
        }
    }
    if (parameters->isReactionNormTask()) {
        if (parameters->uniform(rng) < mutationGammaRank) {
            gammaRank += NormalG(rng);
        }
    }

    // Drift
    if (parameters->uniform(rng) < parameters->getMutationDrift()) {
        drift += NormalD(rng);
    }
}


/* INCREASE AGE */
//for breeders
void Individual::increaseAge(bool alive) {
    if (alive) {
        this->age++;
    } else {
        this->age = Parameters::NO_VALUE;
    }
}

//for helpers and floaters
void Individual::increaseAge() {
    this->increaseAge(true);
}


/* GETTERS AND SETTERS */

double Individual::getAlpha() const {
    return alpha;
}

double Individual::getAlphaAge() const {
    return alphaAge;
}

double Individual::getBeta() const {
    return beta;
}

double Individual::getBetaAge() const {
    return betaAge;
}

double Individual::getGamma() const {
    return gamma;
}

double Individual::getGammaRank() const {
    return gammaRank;
}

double Individual::getDrift() const {
    return drift;
}

double Individual::getDispersal() const {
    return dispersal;
}

double Individual::getHelp() const {
    return help;
}

bool Individual::getHelpType() const {
    return helpType;
}

double Individual::getTask() const {
    return task;
}

void Individual::setHelp(double help_) {
    Individual::help = help_;
}

double Individual::getSurvival() const {
    return survival;
}

FishType Individual::getFishType() const {
    return fishType;
}

void Individual::setFishType(FishType type) {
    Individual::fishType = type;
    if (type == BREEDER) {
        this->dispersal = Parameters::NO_VALUE;
        this->help = 0;
        this->task = Parameters::NO_VALUE;
    }
    if (type == FLOATER) {
        this->help = 0;
        this->task = Parameters::NO_VALUE;
    }
}

int Individual::getAge() const {
    return age;
}

void Individual::setAgeBecomeBreeder(int ageBecomeBreeder_) {
    Individual::ageBecomeBreeder = ageBecomeBreeder_;
}

void Individual::setRankBecomeBreeder(double rankBecomeBreeder_) {
    Individual::rankBecomeBreeder = rankBecomeBreeder_;
}

double Individual::getRank() const {
    return rank;
}

bool Individual::isInherit() const {
    return inherit;
}

void Individual::setInherit(bool inherit) {
    Individual::inherit = inherit;
}

double Individual::get(Attribute type) const {
    switch (type) {
        case ALPHA:
            return this->alpha;
        case ALPHA_AGE:
            return this->alphaAge;
        case BETA:
            return this->beta;
        case BETA_AGE:
            return this->betaAge;
        case GAMMA:
            return this->gamma;
        case GAMMA_RANK:
            return this->gammaRank;
        case HELP:
            return this->help;
        case HELP_TYPE:
            return this->helpType;
        case DISPERSAL:
            return this->dispersal;
        case TASK:
            return this->task;
        case SURVIVAL:
            return this->survival;
        case DRIFT:
            return this->drift;
        case AGE:
            return this->age;
        case AGE_BECOME_BREEDER:
            return this->ageBecomeBreeder;
        case RANK:
            return this->rank;
        case RANK_BECOME_BREEDER:
            return this->rankBecomeBreeder;
    }

    assert(false);
}

int Individual::getGroupIndex() const {
    return groupIndex;
}

bool Individual::isViableBreeder() {
    if (age > parameters->getMinAgeBecomeBreeder() - 1) {
        return true;
    } else {
        return false;
    }
}





