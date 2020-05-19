function(add_test_executable_dir_get_target_compile out_list_def_arg out_list_option_arg)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_compile "" 
        "${one_options}" "DEFAULT_LIST_DEF_ARG;DEFAULT_LIST_OPTION_ARG;ARGS" ${ARGN}) 
    cmake_parse_arguments(args "UPPER" "" "" 
        ${add_test_executable_dir_get_target_compile_ARGS})

    if (args_UPPER)
        string(TOUPPER "${add_test_executable_dir_get_target_compile_DEFAULT_LIST_DEF_ARG}" 
            default_list_def_arg)
        string(TOUPPER "${add_test_executable_dir_get_target_compile_DEFAULT_LIST_OPTION_ARG}" 
            default_list_option_arg)
    else()
        set(default_list_def_arg
            ${add_test_executable_dir_get_target_compile_DEFAULT_LIST_DEF_ARG})
        set(default_list_option_arg 
            ${add_test_executable_dir_get_target_compile_DEFAULT_LIST_OPTION_ARG})
    endif()

    set(${out_list_def_arg} "${default_list_def_arg}" PARENT_SCOPE)
    set(${out_list_option_arg} "${default_list_option_arg}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_compile)
