
#ifndef GROUP_AUGMENTATION_GROUP_H
#define GROUP_AUGMENTATION_GROUP_H

#include <memory>
#include "Individual.h"
#include "../util/Parameters.h"
#include "container/IndividualVector.h"


class Group {

private:
    std::shared_ptr<Parameters> parameters;
    double cumHelpType0;
    double cumHelpType1;
    bool breederAlive;      // for the breeder: 1 alive, 0 dead
    int groupSize;
    double fecundity;
    int realFecundity;

    Individual breeder;

    IndividualVector helpers;

public:

    explicit Group(const std::shared_ptr<Parameters>& parameters);

    void calculateGroupSize();

    std::vector<Individual> disperse();

    void calculateCumulativeHelp();

    const IndividualVector &getHelpers() const;

    void survivalGroup();

    void mortalityGroup(int &deaths);

    void newBreeder(std::vector<Individual> &floaters, int &newBreederFloater, int &newBreederHelper, int &inheritance);

    void increaseAge();

    void reproduce(int generation);

    const Individual &getBreeder() const;

    int getGroupSize() const;

    bool isBreederAlive() const;

    double getCumHelpType0() const;

    double getCumHelpType1() const;

    bool hasHelpers() const;

    void addHelper(const Individual &helper);

    std::vector<double> get(Attribute attribute) const;

    std::vector<double> get(Attribute attribute, bool includeBreeder) const;

    std::vector<Individual> noRelatedHelpersToReassign(int index);

    int countHelpersAgeOne();

    int calculateHelpersToReassign();
};


#endif //GROUP_AUGMENTATION_GROUP_H
