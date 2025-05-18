#ifndef CPP_PARAMETERS_H
#define CPP_PARAMETERS_H

#include <iomanip>
#include <string>
#include <fstream>
#include <random>

#include "stats/Statistics.h"

/**
 * @class Parameters
 *
 * This class maintains various parameters related to the simulation such as the number of generations, mutation rates, and other genetic parameters.
 * It provides methods to access these parameters.
 */
class Parameters {
public:
    /**
     * @brief Default constructor for the Parameters class.
     */
    explicit Parameters(int replica);

    /**
         * @brief Destructor for the Parameters class.
         */
    virtual ~Parameters();

    /**
     * @brief Constructor for the Parameters class that takes a URL.
     * @param filename The URL to load parameters from.
     */
    explicit Parameters(const std::string &filename, int replica);


    /**
     * makes a deep copy of Parameters while incrementing newReplica by 1 + initializes a new rng
     */
    std::shared_ptr<Parameters> cloneWithIncrementedReplica(int newReplica);

    int getReplica() const;

private:
    std::string name;
    int replica; ///< The replica number.

    // Run parameters
    const int SEED = 1; ///< The seed for the random number generator.
    bool REACTION_NORM_HELP;    //Apply reaction norm to age for dispersal?
    bool REACTION_NORM_DISPERSAL; // Apply reaction norm to age for dispersal?
    bool EVOLUTION_TASK_AFTER_HELP; // help evolves only after the evolution of dispersal?
    bool REACTION_NORM_TASK; // If true: help reduces the rank and likelihood to inherit breeding position, if false: help reduces survival
    bool NEED_DIVISION_LABOUR; //If true, individuals in a group must split the type of help provided to have an optimum increase on fecundity, as there is need of both defence and feeding
    bool DIRECT_BROOD_CARE_ONLY; // right after an individual becomes breeder, it does not receive help for the first breeding cycle
    bool NO_GROUP_AUGMENTATION;
    bool NO_RELATEDNESS;       //Apply implementation to remove the effect of relatedness?
    bool NO_RELATEDNESS_RANDOM_GROUP; // When applying no relatedness, helpers shuffled to random group instead of maintaining group size
    bool AGE_NO_INFLUENCE_INHERITANCE; // Age no influence of who inherits territory, randomly sampled from candidate (helpers + sample floaters)


    int MAX_COLONIES;     // max number of groups or colonies --> breeding spots.
    int NUM_GENERATIONS;
    int MAX_NUM_REPLICATES;
    int SKIP;   // interval between print-outs

//Fix values
    int INIT_NUM_HELPERS;     //initial number of helpers per group
    double BIAS_FLOAT_BREEDER; //mean of number of groups a floater can visit to try to become a breeder compared to 1 group for helpers
    int MIN_AGE_BECOME_BREEDER; //minimum age for individuals to be able to become breeders
    int FIXED_IND_QUALITY;      // in the "age no influence on inheritance", rank of all individuals before effect of help
    double FIXED_GROUP_SIZE;       //in the implementation of no group augmentation, virtual group size for survival for breeder and helpers
    int REDUCED_RELATEDNESS;     // proportion of philopatric offspring reallocated to reduce within group relatedness in an asexual population (ONLY VALUES 2 OR 3)

// Modifiers in survival.
    double m;      //base mortality
    double n;      //mortality linked to dispersal
    double X0;     //base survival without the effect of help or group size
    double Xsh;    // cost of help in survival
    double Xsn;    // benefit of group size in survival
    double Yh;     // cost of help on rank

//Modifiers in fecundity
    double K0;    // min fecundity, fecundity when no help provided.
    double Kh;    // benefit of cumHelp in the fecundity
    double Km;    // reduced the need for division of labour, the higher the value the less need for DOL

    // Genetic values

//For help
    double INIT_ALPHA;            // bigger values higher level of help
    double INIT_ALPHA_AGE;            //linear term for age, positive: higher help with age

    double MUTATION_ALPHA;            // mutation rate in alpha for level of help
    double MUTATION_ALPHA_AGE;
    double STEP_ALPHA;            // mutation step size in alpha for level of help


//For dispersal
    double INIT_BETA;            // bigger values higher dispersal
    double INIT_BETA_AGE;            // 0: age has no effect, positive: dispersal decreases with age

    double MUTATION_BETA;            // mutation rate for the propensity to disperse
    double MUTATION_BETA_AGE;
    double STEP_BETA;            // mutation step size for the propensity to disperse

//For task specialization
    double INIT_GAMMA;             // if 0 no task specialization, negative values lower rank, positive values lower survival
    double INIT_GAMMA_RANK;         // if 0 age has no effect, negative values more cost in survival with age, positive values more cost in rank with age

    double MUTATION_GAMMA;
    double MUTATION_GAMMA_RANK;
    double STEP_GAMMA;


//For relatedness
    double MUTATION_DRIFT;            // mutation rate in the neutral selected value to track level of relatedness
    double STEP_DRIFT; // mutation step size in the neutral genetic value to track level of relatedness

    std::default_random_engine *generator; ///< A pointer to the random number generator.

    std::string removeExtension(std::string url); ///< Helper function to get the name of the simulation from a URL.

    void print(std::ofstream &outputStream); ///< Helper function to print the parameters to an output stream.


    double idCounter = 0;
    Statistics *results;

public:
    std::uniform_real_distribution<double> driftUniform; ///< A uniform real distribution for drift.
    std::uniform_real_distribution<double> uniform; ///< A uniform real distribution.

    static const int NO_VALUE = -1; ///< A constant representing no value.

    std::default_random_engine *getGenerator() const;

    double nextId() {
        return idCounter++;
    }
};


#endif //CPP_PARAMETERS_H
