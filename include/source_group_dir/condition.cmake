function(source_group_dir_condition path output)
    cmake_parse_arguments(source_group_dir_condition "CASE_SENSITIVE" 
        "BASE_DIR;RELATIVE_PATH;FILENAME;INCLUDE_DIR" "ARGS" ${ARGN}) 
    set(${output} TRUE PARENT_SCOPE)
endfunction(source_group_dir_condition)
