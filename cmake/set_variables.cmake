
function(set_variables)
    string(CONCAT one_options "PREFIX;INCLUDE_DIR;TEST_BASE_DIR"
        ";TEST_UTILS_DIR;TEST_SOURCE_DIR")
    cmake_parse_arguments(set_variables "" "${one_options}" "" ${ARGN}) 
    
    if (NOT DEFINED BUILD_UTILS_CMAKE_BASE_SRC_DIR 
        OR("${EMPTY}${BUILD_UTILS_CMAKE_BASE_SRC_DIR}" STREQUAL "${EMPTY}"))
        
        get_filename_component(l_cmake_base_src_dir "${CMAKE_SOURCE_DIR}" ABSOLUTE)
        set(BUILD_UTILS_CMAKE_BASE_SRC_DIR ${l_cmake_base_src_dir} 
            CACHE INTERNAL "build utils cmake base source directory" FORCE)
    endif()

    if (DEFINED BUILD_UTILS_PREFIX)
        set(BUILD_UTILS_PREFIX ${prefix} CACHE INTERNAL "build-utils prefix" FORCE)
    else()
        set(BUILD_UTILS_PREFIX "" CACHE INTERNAL "build-utils prefix" FORCE)
    endif()
    
    unset(l_include_dir)
    if("${EMPTY}${set_variables_INCLUDE_DIR}" STREQUAL "${EMPTY}")
        get_filename_component(l_include_dir 
            "${BUILD_UTILS_CMAKE_BASE_SRC_DIR}/../include" ABSOLUTE)
    else()
        get_filename_component(l_include_dir "
            ${set_variables_INCLUDE_DIR}" ABSOLUTE)
    endif()

    if (EXISTS "${l_include_dir}")
        set(${BUILD_UTILS_PREFIX}BUILD_UTILS_INCLUDE_DIR ${l_include_dir} 
            CACHE PATH "build utils include directory" FORCE)
    elseif(NOT EXISTS "${l_include_dir}")
        get_filename_component(l_include_dir "${BUILD_UTILS_CMAKE_BASE_SRC_DIR}/../include" ABSOLUTE)
        set(${BUILD_UTILS_PREFIX}BUILD_UTILS_INCLUDE_DIR "${l_include_dir}" 
            CACHE PATH "build utils include directory" FORCE)
    else()
        message(FATAL_ERROR "variable \"INCLUDE_DIR\"" )
    endif()
    
    unset(l_test_base_dir)
    if ("${EMPTY}${set_variables_TEST_BASE_DIR}" STREQUAL "${EMPTY}")
        get_filename_component(l_test_base_dir "${BUILD_UTILS_CMAKE_BASE_SRC_DIR}/test" ABSOLUTE)
    else()
        get_filename_component(l_test_base_dir "${set_variables_TEST_BASE_DIR}" ABSOLUTE)
    endif()

    if (EXISTS "${l_test_base_dir}")
        set(${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_BASE_DIR ${l_test_base_dir} 
            CACHE PATH "test directory" FORCE)
    elseif(NOT EXISTS "${l_test_base_dir}")
        get_filename_component(l_test_base_dir "${BUILD_UTILS_CMAKE_BASE_SRC_DIR}/test" ABSOLUTE)
        set(${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_BASE_DIR "${l_test_base_dir}" 
            CACHE PATH "test directory" FORCE)
    else()
        message(FATAL_ERROR "variable \"TEST_BASE_DIR\"" )
    endif()

    unset(l_test_utils_dir)
    if ("${EMPTY}${set_variables_TEST_UTILS_DIR}" STREQUAL "${EMPTY}")
        get_filename_component(l_test_utils_dir "${BUILD_UTILS_TEST_BASE_DIR}/utils" ABSOLUTE)
    else()
        get_filename_component(l_test_utils_dir "${set_variables_TEST_UTILS_DIR}" ABSOLUTE)
    endif()

    if (EXISTS "${l_test_utils_dir}")
        set(${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_UTILS_DIR ${l_test_utils_dir} 
            CACHE PATH "test utils directory" FORCE)
    elseif(NOT EXISTS "${l_test_utils_dir}")
        get_filename_component(l_test_utils_dir "${BUILD_UTILS_TEST_BASE_DIR}/utils" ABSOLUTE)
        set(${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_UTILS_DIR "${l_test_utils_dir}" 
            CACHE PATH "test utils directory" FORCE)
    else()
        message(FATAL_ERROR "variable \"TEST_UTILS_DIR\"" )
    endif()

    set(l_test_source_dir "")

    if("${EMPTY}${set_variables_TEST_SOURCE_DIR}" STREQUAL "${EMPTY}")
        get_filename_component(l_test_source_dir "${BUILD_UTILS_TEST_BASE_DIR}/src" ABSOLUTE)
    else()
        get_filename_component(l_test_source_dir "${set_variables_TEST_SOURCE_DIR}" ABSOLUTE)
    endif()

    if (EXISTS "${l_test_source_dir}")
        set(${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_SOURCE_DIR ${l_test_source_dir} 
            CACHE PATH "test source directory" FORCE)
    elseif(NOT EXISTS "${l_test_source_dir}")
        get_filename_component(l_test_source_dir "${BUILD_UTILS_TEST_BASE_DIR}/src" ABSOLUTE)
        set(${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_SOURCE_DIR "${l_test_source_dir}" 
            CACHE PATH "test source directory" FORCE)
    else()
        message(FATAL_ERROR "variable \"TEST_SOURCE_DIR\"" )
    endif()

    include(${BUILD_UTILS_CMAKE_BASE_SRC_DIR}/include_build_util.cmake)

endfunction(set_variables)
