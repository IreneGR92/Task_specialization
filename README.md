# Division of Labor in Vertebrates

Simulation code, written in C++, to support the paper:
"Fitness drivers of division of labor in vertebrates"

## Getting Started

### Pre conditions

- The software was built and tested on Ubuntu Linux and macOS -> this guide only covers Ubuntu Linux x86_64 and macOS if you are using Windows you may need to adapt some steps.
- Cmake, make and gcc installed
- The project now uses the `FetchContent` CMake module to download and build the `yaml-cpp` library directly from its GitHub repository.

### Compile the binary

1. Make folder build and navigate into it `mkdir build` -> `cd build`
2. Generate make files with  `cmake .. -DCMAKE_BUILD_TYPE=Release`
3. Compile binary with `make`
4. The binary target App should be successfully built now.

### Run

Now you can normally run it by adding the relative path to the parameters yaml file as first run parameter:

`./App ../parameters/example.yml`

The output of the application is then stored in file `main_parameters_example.txt`
and `last_generation_parameters_example.txt` in the same folder as the binary.

You can modify the input parameters of the model by modifying the yml file. First lines allow you to choose between the
different models. 