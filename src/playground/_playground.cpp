#include <iostream>

#include <boost/python.hpp> // don't include like this in production code!

void say_hello() {
  std::cout << "Hello from the playground C++ extension!" << std::endl;
}

namespace bpy = boost::python;

BOOST_PYTHON_MODULE(_playground) { bpy::def("say_hello", &say_hello); }
