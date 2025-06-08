#include <algorithm>
#include <yaml-cpp/yaml.h>
#include "Parameters.h"

#include "../util/Config.h"
#include "spdlog/spdlog.h"

using namespace std;



//default value if not provided
Parameters::Parameters(const int replica) : Parameters("../parameters/default.yml", replica) {
}

Parameters::Parameters(const string &filename, const int replica) : replica(replica) {
    std::string path = Config::GET_PARAMETERS_FOLDER() + "/" + filename;

    spdlog::debug("Loading parameters from file: {}", path);
    YAML::Node config;
    try {
        config = YAML::LoadFile(path);
    } catch (YAML::BadFile &e) {
        spdlog::error("Error loading parameters from file: {}", filename);
        throw e;
    }
    this->name = this->removeExtension(filename);
    this->REACTION_NORM_HELP = config["REACTION_NORM_HELP"].as<bool>();
    this->REACTION_NORM_DISPERSAL = config["REACTION_NORM_DISPERSAL"].as<bool>();
    this->EVOLUTION_TASK_AFTER_HELP = config["EVOLUTION_TASK_AFTER_HELP"].as<bool>();
    this->DIRECT_BROOD_CARE_ONLY = config["DIRECT_BROOD_CARE_ONLY"].as<bool>();
    this->NO_GROUP_AUGMENTATION = config["NO_GROUP_AUGMENTATION"].as<bool>();
    this->NO_RELATEDNESS = config["NO_RELATEDNESS"].as<bool>();
    this->NO_RELATEDNESS_RANDOM_GROUP = config["NO_RELATEDNESS_RANDOM_GROUP"].as<bool>();
    this->AGE_NO_INFLUENCE_INHERITANCE = config["AGE_NO_INFLUENCE_INHERITANCE"].as<bool>();
    this->REACTION_NORM_TASK = config["REACTION_NORM_TASK"].as<bool>();
    this->NEED_DIVISION_LABOUR = config["NEED_DIVISION_LABOUR"].as<bool>();
    this->MAX_COLONIES = config["MAX_COLONIES"].as<int>();
    this->NUM_GENERATIONS = config["NUM_GENERATIONS"].as<int>();
    this->MAX_NUM_REPLICATES = config["MAX_NUM_REPLICATES"].as<int>();
    this->SKIP = config["SKIP"].as<int>();
    this->INIT_NUM_HELPERS = config["INIT_NUM_HELPERS"].as<int>();
    this->BIAS_FLOAT_BREEDER = config["BIAS_FLOAT_BREEDER"].as<double>();
    this->MIN_AGE_BECOME_BREEDER = config["MIN_AGE_BECOME_BREEDER"].as<int>();
    this->FIXED_IND_QUALITY = config["FIXED_IND_QUALITY"].as<int>();
    this->FIXED_GROUP_SIZE = config["FIXED_GROUP_SIZE"].as<double>();
    this->REDUCED_RELATEDNESS = config["REDUCED_RELATEDNESS"].as<int>();
    this->m = config["m"].as<double>();
    this->n = config["n"].as<double>();
    this->X0 = config["X0"].as<double>();
    this->Xsh = config["Xsh"].as<double>();
    this->Xsn = config["Xsn"].as<double>();
    this->Yh = config["Yh"].as<double>();
    this->K0 = config["K0"].as<double>();
    this->Kh = config["Kh"].as<double>();
    this->Km = config["Km"].as<double>();
    this->INIT_ALPHA = config["INIT_ALPHA"].as<double>();
    this->INIT_ALPHA_AGE = config["INIT_ALPHA_AGE"].as<double>();
    this->MUTATION_ALPHA = config["MUTATION_ALPHA"].as<double>();
    this->MUTATION_ALPHA_AGE = config["MUTATION_ALPHA_AGE"].as<double>();
    this->STEP_ALPHA = config["STEP_ALPHA"].as<double>();
    this->INIT_BETA = config["INIT_BETA"].as<double>();
    this->INIT_BETA_AGE = config["INIT_BETA_AGE"].as<double>();
    this->MUTATION_BETA = config["MUTATION_BETA"].as<double>();
    this->MUTATION_BETA_AGE = config["MUTATION_BETA_AGE"].as<double>();
    this->STEP_BETA = config["STEP_BETA"].as<double>();
    this->INIT_GAMMA = config["INIT_GAMMA"].as<double>();
    this->INIT_GAMMA_RANK = config["INIT_GAMMA_RANK"].as<double>();
    this->MUTATION_GAMMA = config["MUTATION_GAMMA"].as<double>();
    this->MUTATION_GAMMA_RANK = config["MUTATION_GAMMA_RANK"].as<double>();
    this->STEP_GAMMA = config["STEP_GAMMA"].as<double>();
    this->MUTATION_DRIFT = config["MUTATION_DRIFT"].as<double>();
    this->STEP_DRIFT = config["STEP_DRIFT"].as<double>();

    this->driftUniform = uniform_real_distribution<double>(100, 200);
    this->uniform = uniform_real_distribution<double>(0, 1);


    const int seed = 1;
    this->generator = new std::default_random_engine(seed);
}

shared_ptr<Parameters> Parameters::cloneWithIncrementedReplica(int newReplica) {
    auto deepCopy = std::make_shared<Parameters>(*this); // Use copy constructor
    deepCopy->replica = newReplica; // Increment newReplica
    deepCopy->generator = new std::default_random_engine(SEED + newReplica);
    return deepCopy;
}

int Parameters::getSkip() const {
    return SKIP;
}

default_random_engine *Parameters::getGenerator() const {
    return generator;
}

int Parameters::getNumGenerations() const {
    return NUM_GENERATIONS;
}

int Parameters::getInitNumHelpers() const {
    return INIT_NUM_HELPERS;
}

double Parameters::getInitAlpha() const {
    return INIT_ALPHA;
}

double Parameters::getInitAlphaAge() const {
    return INIT_ALPHA_AGE;
}

double Parameters::getInitBeta() const {
    return INIT_BETA;
}

double Parameters::getInitBetaAge() const {
    return INIT_BETA_AGE;
}

double Parameters::getInitGamma() const {
    return INIT_GAMMA;
}

double Parameters::getInitGammaRank() const {
    return INIT_GAMMA_RANK;
}

bool Parameters::isReactionNormDispersal() const {
    return REACTION_NORM_DISPERSAL;
}

bool Parameters::isNoRelatedness() const {
    return NO_RELATEDNESS;
}

bool Parameters::isNoGroupAugmentation() const {
    return NO_GROUP_AUGMENTATION;
}

bool Parameters::isReactionNormHelp() const {
    return REACTION_NORM_HELP;
}

bool Parameters::isReactionNormTask() const {
    return REACTION_NORM_TASK;
}

bool Parameters::isAgeNoInfluenceInheritance() const {
    return AGE_NO_INFLUENCE_INHERITANCE;
}

double Parameters::getM() const {
    return m;
}

double Parameters::getN() const {
    return n;
}

double Parameters::getX0() const {
    return X0;
}

double Parameters::getXsh() const {
    return Xsh;
}

double Parameters::getXsn() const {
    return Xsn;
}

double Parameters::getYh() const {
    return Yh;
}

double Parameters::getK0() const {
    return K0;
}

double Parameters::getKh() const {
    return Kh;
}

double Parameters::getKm() const {
    return Km;
}

int Parameters::getFixedIndQuality() const {
    return FIXED_IND_QUALITY;
}

int Parameters::getMinAgeBecomeBreeder() const {
    return MIN_AGE_BECOME_BREEDER;
}

double Parameters::getFixedGroupSize() const {
    return FIXED_GROUP_SIZE;
}

double Parameters::getStepAlpha() const {
    return STEP_ALPHA;
}

double Parameters::getStepBeta() const {
    return STEP_BETA;
}

double Parameters::getStepGamma() const {
    return STEP_GAMMA;
}

double Parameters::getStepDrift() const {
    return STEP_DRIFT;
}

bool Parameters::isNoRelatednessRandomGroup() const {
    return NO_RELATEDNESS_RANDOM_GROUP;
}

double Parameters::getMutationAlpha() const {
    return MUTATION_ALPHA;
}

double Parameters::getMutationAlphaAge() const {
    return MUTATION_ALPHA_AGE;
}

double Parameters::getMutationBeta() const {
    return MUTATION_BETA;
}

double Parameters::getMutationBetaAge() const {
    return MUTATION_BETA_AGE;
}

double Parameters::getMutationGamma() const {
    return MUTATION_GAMMA;
}

double Parameters::getMutationGammaRank() const {
    return MUTATION_GAMMA_RANK;
}

double Parameters::getMutationDrift() const {
    return MUTATION_DRIFT;
}

bool Parameters::isEvolutionTaskAfterHelp() const {
    return EVOLUTION_TASK_AFTER_HELP;
}

int Parameters::getMaxColonies() const {
    return MAX_COLONIES;
}
