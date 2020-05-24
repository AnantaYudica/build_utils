function(source_group_dir_filter output)
    string(CONCAT one_options "LEVEL;BASE_DIR;PATH;RELATIVE_PATH;FILENAME;DIRNAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(source_group_dir_filter "CASE_SENSITIVE;DIRECTORY" 
        "${one_options}" "ARGS" ${ARGN}) 

    cmake_parse_arguments(args "" "level" "" ${source_group_dir_filter_ARGS})
    
    set(level 2)
    if (NOT "${EMPTY}${args_level}" STREQUAL "${EMPTY}")
        set(level ${args_level})
    endif()

    if (${source_group_dir_filter_LEVEL} LESS ${level})
        set(${output} TRUE PARENT_SCOPE)
    else()
        set(${output} FALSE PARENT_SCOPE)
    endif()
endfunction(source_group_dir_filter)
