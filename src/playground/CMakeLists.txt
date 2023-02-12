add_library(_playground MODULE _playground.cpp)
set_target_properties(_playground PROPERTIES PREFIX "")
target_link_libraries(_playground PRIVATE Boost::python Python::Module)

# installation
install(TARGETS _playground
        LIBRARY DESTINATION ${Python_SITELIB_RELPATH}/playground
        COMPONENT Runtime)
