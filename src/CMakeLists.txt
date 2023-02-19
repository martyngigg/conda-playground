# Required dependencies
find_package(Python REQUIRED COMPONENTS Interpreter Development)
find_package(Boost COMPONENTS python REQUIRED)

# Determine install location for extensions
set(_code
"import os.path as osp
import sys
import sysconfig as scfg

print(osp.relpath(scfg.get_path('purelib'), start=sys.prefix))
"
)
execute_process(COMMAND python -c ${_code}
  RESULT_VARIABLE _result
  OUTPUT_VARIABLE _output ERROR_VARIABLE _error
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
if(_result EQUAL 0)
  set(Python_SITELIB_RELPATH ${_output})
else()
  message(FATAL_ERROR "Error determining Python site packages location: ${_error}")
endif()

# Install pure python package elements
install(CODE "execute_process(COMMAND python -m pip install
                  ${CMAKE_CURRENT_SOURCE_DIR}
                  --disable-pip-version-check
                  --upgrade --no-deps --ignore-installed --no-cache-dir -vvv)"
        COMPONENT Runtime
)

add_subdirectory(playground)
