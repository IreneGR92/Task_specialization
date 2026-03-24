# Fitness drivers of division of labor in vertebrates

Simulation code, written in C++, to support the paper:

> García-Ruiz I, Rubenstein DR (2025) Fitness drivers of division of labor in vertebrates. *eLife*, 14:RP105501. https://doi.org/10.7554/eLife.105501

A stochastic individual-based model simulating the evolution of help, dispersal, and task specialization in cooperatively breeding vertebrates. 

---

## Getting Started

### Prerequisites

- Ubuntu Linux x86_64 or macOS (Windows may require additional steps)
- `cmake` (>= 3.5)
- `make`
- `g++` with C++17 support (e.g. `g++-9` or later)
- `git` (required for CMake to fetch `yaml-cpp` during the build)


On Ubuntu, you can install the required tools with:
```bash
sudo apt-get update
sudo apt-get install cmake make g++ git
```

---

### Compile the binary

```bash
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make
```

The binary `App` will be created inside the `build/` folder.

---

### Run

Run the simulation by passing the path to a YAML parameters file as the first argument:

```bash
./App ../parameters/example.yml
```

If no parameters file is provided, the simulation will use default values:

```bash
./App
```

---

### Output

The output is stored in two files in the same folder as the binary:

- `main_parameters_<name>.txt` — statistics printed every `SKIP` generations across all replicates
- `last_generation_parameters_<name>.txt` — detailed individual-level data from the final generation

where `<name>` is derived from the input YAML filename (e.g. `example` for `example.yml`).

---



## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
