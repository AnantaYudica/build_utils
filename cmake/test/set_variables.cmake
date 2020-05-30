
function(set_variables)
cmake_parse_arguments(set_variables "" 
    "CMAKE_BASE_SRC_DIR;INCLUDE_DIR;TEST_BASE_DIR;TEST_UTILS_DIR;TEST_SRC_DIR;
    TEST_NAME;TEST_CMAKE_BASE_SRC_DIR" "" ${ARGN}) 

unset(l_cmake_base_src_dir)
if("${EMPTY}${set_variables_CMAKE_BASE_SRC_DIR}" STREQUAL "${EMPTY}")
    get_filename_component(l_cmake_base_src_dir "${CMAKE_SOURCE_DIR}" ABSOLUTE)
else()    
    get_filename_component(l_cmake_base_src_dir "${set_variables_CMAKE_BASE_SRC_DIR}" ABSOLUTE)
endif()

if (IS_DIRECTORY "${l_cmake_base_src_dir}")
    set(CMAKE_BASE_SRC_DIR ${l_cmake_base_src_dir} CACHE PATH "base directory" FORCE)
elseif(NOT IS_DIRECTORY "${l_cmake_base_src_dir}")
    set(CMAKE_BASE_SRC_DIR ${CMAKE_SOURCE_DIR} CACHE PATH "base directory" FORCE)
else()
    message(FATAL_ERROR "variable \"CMAKE_BASE_SRC_DIR\"" )
endif()

unset(l_include_dir)
if("${EMPTY}${set_variables_INCLUDE_DIR}" STREQUAL "${EMPTY}")
    get_filename_component(l_include_dir "${CMAKE_BASE_SRC_DIR}/../include" ABSOLUTE)
else()
    get_filename_component(l_include_dir "${set_variables_INCLUDE_DIR}" ABSOLUTE)
endif()

if (IS_DIRECTORY "${l_include_dir}")
    set(INCLUDE_DIR ${l_include_dir} CACHE PATH "include directory" FORCE)
elseif(NOT IS_DIRECTORY "${l_include_dir}")
    get_filename_component(l_include_dir "${CMAKE_BASE_SRC_DIR}/../include" ABSOLUTE)
    set(INCLUDE_DIR "${l_include_dir}" CACHE PATH "include directory" FORCE)
else()
    message(FATAL_ERROR "variable \"INCLUDE_DIR\"" )
endif()

unset(l_test_base_dir)
if ("${EMPTY}${set_variables_TEST_BASE_DIR}" STREQUAL "${EMPTY}")
    get_filename_component(l_test_base_dir "${CMAKE_BASE_SRC_DIR}/test" ABSOLUTE)
else()
    get_filename_component(l_test_base_dir "${set_variables_TEST_BASE_DIR}" ABSOLUTE)
endif()

if (IS_DIRECTORY "${l_test_base_dir}")
    set(TEST_BASE_DIR ${l_test_base_dir} CACHE PATH "test directory" FORCE)
elseif(NOT IS_DIRECTORY "${l_test_base_dir}")
    get_filename_component(l_test_base_dir "${CMAKE_BASE_SRC_DIR}/test" ABSOLUTE)
    set(TEST_BASE_DIR "${l_test_base_dir}" CACHE PATH "test directory" FORCE)
else()
    message(FATAL_ERROR "variable \"TEST_BASE_DIR\"" )
endif()

unset(l_test_utils_dir)
if ("${EMPTY}${set_variables_TEST_UTILS_DIR}" STREQUAL "${EMPTY}")
    get_filename_component(l_test_utils_dir "${TEST_BASE_DIR}/utils" ABSOLUTE)
else()
    get_filename_component(l_test_utils_dir "${set_variables_TEST_UTILS_DIR}" ABSOLUTE)
endif()

if (IS_DIRECTORY "${l_test_utils_dir}")
    set(TEST_UTILS_DIR ${l_test_utils_dir} CACHE PATH "test utils directory" FORCE)
elseif(NOT IS_DIRECTORY "${l_test_utils_dir}")
    get_filename_component(l_test_utils_dir "${TEST_BASE_DIR}/utils" ABSOLUTE)
    set(TEST_UTILS_DIR "${l_test_utils_dir}" CACHE PATH "test utils directory" FORCE)
else()
    message(FATAL_ERROR "variable \"TEST_UTILS_DIR\"" )
endif()

unset(l_test_src_dir)
if("${EMPTY}${set_variables_TEST_SRC_DIR}" STREQUAL "${EMPTY}")
    get_filename_component(l_test_src_dir "${TEST_BASE_DIR}/build_utils" ABSOLUTE)
else()
    get_filename_component(l_test_src_dir "${set_variables_TEST_SRC_DIR}" ABSOLUTE)
endif()

if (IS_DIRECTORY "${l_test_src_dir}")
    set(TEST_SRC_DIR ${l_test_src_dir} CACHE PATH "test source directory" FORCE)
elseif(NOT IS_DIRECTORY "${l_test_src_dir}")
    get_filename_component(l_test_src_dir "${TEST_BASE_DIR}/src" ABSOLUTE)
    set(TEST_SRC_DIR "${l_test_src_dir}" CACHE PATH "test source directory" FORCE)
else()
    message(FATAL_ERROR "variable \"TEST_SRC_DIR\"" )
endif()

if("${EMPTY}${set_variables_TEST_NAME}" STREQUAL "${EMPTY}")
    set(TEST_NAME "Not Defined" CACHE STRING "test source name" FORCE)
else()
    set(TEST_NAME "${set_variables_TEST_NAME}" CACHE STRING "test source name" FORCE)
endif()

unset(l_test_cmake_base_src_dir)
if("${EMPTY}${set_variables_TEST_CMAKE_BASE_SRC_DIR}" STREQUAL "${EMPTY}")
    get_filename_component(l_test_src_dir "${TEST_BASE_DIR}/${TEST_NAME}" ABSOLUTE)
else()
    get_filename_component(l_test_cmake_base_src_dir 
        "${set_variables_TEST_CMAKE_BASE_SRC_DIR}" ABSOLUTE)
endif()

if (IS_DIRECTORY "${l_test_cmake_base_src_dir}")
    set(TEST_CMAKE_BASE_SRC_DIR ${l_test_cmake_base_src_dir} 
        CACHE PATH "test base source directory" FORCE)
else()
    message(FATAL_ERROR "variable \"TEST_CMAKE_BASE_SRC_DIR\"" )
endif()

endfunction(set_variables)
