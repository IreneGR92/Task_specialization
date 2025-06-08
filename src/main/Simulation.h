#ifndef GROUP_AUGMENTATION_SIMULATION_H
#define GROUP_AUGMENTATION_SIMULATION_H



#include "model/Population.h"
#include "util/ResultCache.h"
#include "util/Parameters.h"

class ResultCache; // Forward declaration of the ResultCache class.

/**
 * The Simulation class represents a single simulation run.
 */
class Simulation {
    // A pointer to the Parameters singleton, which holds the parameters for the simulation.
    std::shared_ptr<Parameters> parameters;

    // The population of individuals in the simulation.
    Population population;

    // The current generation number in the simulation.
    int generation = 0;

public:
    /**
     * Constructor for the Simulation class.
     * @param parameters A shared pointer to the Parameters singleton.
     */
    explicit Simulation(std::shared_ptr<Parameters> parameters) : parameters(parameters), population(parameters) {
    }

    /**
     * Runs the simulation.
     * @return A unique pointer to the ResultCache containing the results of the simulation.
     */
    std::unique_ptr<ResultCache> run();

    /**
     * Returns the current generation number in the simulation.
     * @return The generation number.
     */
    [[nodiscard]] int getGeneration() const;
};


#endif //GROUP_AUGMENTATION_SIMULATION_H
