cmake_minimum_required(VERSION 3.10...3.24)
project(group_augmentation C CXX)
set(CMAKE_CXX_STANDARD 17)


# Include the FetchContent module
include(FetchContent)

# Declare the yaml-cpp library
FetchContent_Declare(
        yaml-cpp
        GIT_REPOSITORY https://github.com/jbeder/yaml-cpp.git
        GIT_TAG yaml-cpp-0.6.3  # replace with the desired version
)

# fetch the spdlog library
FetchContent_Declare(
        spdlog
        GIT_REPOSITORY https://github.com/gabime/spdlog.git
        GIT_TAG v1.9.2  # replace with the desired version
)
FetchContent_MakeAvailable(spdlog)
# Fetch the yaml-cpp library
FetchContent_GetProperties(yaml-cpp)
if (NOT yaml-cpp_POPULATED)
    FetchContent_Populate(yaml-cpp)
    add_subdirectory(${yaml-cpp_SOURCE_DIR} ${yaml-cpp_BINARY_DIR})
endif ()

# Define the output directory for the GitHash.h file
set(VERSION_HEADER_DIR ${CMAKE_BINARY_DIR}/generated)

# Add the generated directory to the include directories globally
include_directories(${VERSION_HEADER_DIR})


set(SOURCE_FILES
        src/main/util/Config.h
        src/main/util/Config.cpp
        src/main/util/Parameters.h
        src/main/util/Parameters.cpp
        src/main/loadbalancing/TaskQueue.h
        src/main/loadbalancing/TaskQueue.cpp
        src/main/loadbalancing/ThreadPool.h
        src/main/loadbalancing/ThreadPool.cpp
        src/main/stats/Statistics.h
        src/main/stats/Statistics.cpp
        src/main/stats/StatisticalFormulas.h
        src/main/stats/StatisticalFormulas.cpp
        src/main/main.cpp
        src/main/SimulationRunner.h
        src/main/SimulationRunner.cpp
        src/main/Simulation.cpp
        src/main/Simulation.h
        src/main/model/Attribute.h
        src/main/model/Individual.h
        src/main/model/Individual.cpp
        src/main/model/Group.h
        src/main/model/Group.cpp
        src/main/model/Population.cpp
        src/main/model/Population.h

        src/main/model/container/IndividualVector.h
        src/main/model/container/IndividualVector.cpp
        src/main/model/container/Container.h


        src/main/util/LastGenerationCacheElement.h
        src/main/util/MainCacheElement.h
        src/main/util/ResultCache.h
        src/main/util/ResultCache.cpp
        src/main/util/FilePrinter.h
        src/main/util/FilePrinter.cpp
)

# Define the script path
set(UPDATE_VERSION_SCRIPT ${CMAKE_SOURCE_DIR}/update_git_hash.sh)
set(VERSION_HEADER_FILE ${VERSION_HEADER_DIR}/GitHash.h)

# Add a custom command to run the script git hash script
add_custom_command(
        OUTPUT ${VERSION_HEADER_DIR}/GitHash.h
        COMMAND ${UPDATE_VERSION_SCRIPT} ${VERSION_HEADER_DIR}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        COMMENT "Updating version header with current git hash"
        VERBATIM
)

# Add a custom target that depends on the generated header file
add_custom_target(update_version ALL
        DEPENDS ${VERSION_HEADER_DIR}/GitHash.h
)


add_executable(App ${SOURCE_FILES} ${VERSION_HEADER_FILE})
target_link_libraries(App PUBLIC yaml-cpp spdlog::spdlog)
add_dependencies(App update_version)




