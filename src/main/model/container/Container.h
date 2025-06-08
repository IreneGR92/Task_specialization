#ifndef GROUP_AUGMENTATION_CONTAINER_H
#define GROUP_AUGMENTATION_CONTAINER_H


#include <vector>
#include <iostream>
#include <random>

template<class T>

class Container {
    explicit Container(std::default_random_engine *generator);

    std::default_random_engine generator;

protected:
    std::vector<T> vector;

public:
    [[nodiscard]] unsigned int size() const;

    [[nodiscard]] bool isEmpty() const;

    const T &accessElement(int index);

    //Modifiers
    void add(T element) const;

    void add(T element);

    void remove(int index);

    void removeLast();

    void merge(const Container<T> &container);

    T getRandomElement() const;

    typename std::vector<T>::const_iterator begin() const;

    typename std::vector<T>::const_iterator end() const;

    typename std::vector<T>::iterator begin();

    typename std::vector<T>::iterator end();


    void shuffle();
};


template<class T>
unsigned int Container<T>::size() const {
    return vector.size();
}

template<class T>
bool Container<T>::isEmpty() const {
    return vector.empty();
}

template<class T>
const T &Container<T>::accessElement(int index) {
    return vector.at(index);
}


template<class T>
void Container<T>::add(T element) const {
    vector.push_back(element);
}

template<class T>
void Container<T>::add(const T element) {
    vector.push_back(element);
}

template<class T>
void Container<T>::remove(int index) {
    vector.erase(vector.begin() + index);
}

template<class T>
void Container<T>::merge(const Container<T> &container) {
    vector.insert(vector.end(), container.vector.begin(), container.vector.end());
}


template<class T>
T Container<T>::getRandomElement() const {
    std::uniform_int_distribution<int> uniform(0, vector.size() - 1);
    int index = uniform(generator); // selects a random index the noRelatednessGroupsID vector
    return this->vector[index];
}

template<class T>
typename std::vector<T>::const_iterator Container<T>::begin() const {
    return vector.begin();
}

template<class T>
typename std::vector<T>::const_iterator Container<T>::end() const {
    return vector.end();
}

template<class T>
typename std::vector<T>::iterator Container<T>::begin() {
    return vector.begin();
}

template<class T>
typename std::vector<T>::iterator Container<T>::end() {
    return vector.end();
}

template<class T>
void Container<T>::removeLast() {
    vector.pop_back();
}

template<class T>
Container<T>::Container(std::default_random_engine *generator): generator(*generator) {
}

template<class T>
void Container<T>::shuffle() {
    std::cout << "shuffle not implemented yet!" << std::endl;
}


#endif //GROUP_AUGMENTATION_CONTAINER_H
