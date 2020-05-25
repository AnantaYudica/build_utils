function(get_test_name_tag_ext_file_tag_condition filename index length cond 
    tag_delim_index tag_delim_length)

    set(one_options "STRING;CHARACTER;DELIMITER;DELIMITER_LENGTH;EXT_DELIMITER_INDEX")
    string(CONCAT one_options "${one_options}" ";EXT_DELIMITER_LENGTH;EXT_INDEX;EXT_LENGTH"
        ";INCLUDE_DIR")
    cmake_parse_arguments(get_test_name_tag_ext_file_tag_condition "" 
        "${one_options}" "ARGS" ${ARGN})
    set(delim_len ${get_test_name_tag_ext_file_tag_condition_DELIMITER_LENGTH})
    set(delim "${get_test_name_tag_ext_file_tag_condition_DELIMITER}")

    if (${delim_len} EQUAL  1)
        if ("${EMPTY}${delim}" STREQUAL "${EMPTY}${get_test_name_tag_ext_file_tag_condition_CHARACTER}")
            set(${cond} TRUE PARENT_SCOPE)
            set(${tag_delim_index} ${index} PARENT_SCOPE)
            set(${tag_delim_length} 1 PARENT_SCOPE)
        else()
            set(${cond} FALSE PARENT_SCOPE)
        endif()
    elseif(NOT ${delim_len} GREATER ${length})
        string(SUBSTRING ${get_test_name_tag_ext_file_tag_condition_STRING} 0 ${delim_len} comp)
        if ("${EMPTY}${comp}" STREQUAL "${EMPTY}${get_test_name_tag_ext_file_tag_condition_DELIMITER}")
            set(${cond} TRUE PARENT_SCOPE)
            set(${tag_delim_index} ${index} PARENT_SCOPE)
            set(${tag_delim_length} ${delim_len} PARENT_SCOPE)
        else()
            set(${cond} FALSE PARENT_SCOPE)
        endif()
    else()
        set(${cond} FALSE PARENT_SCOPE)
    endif()
endfunction(get_test_name_tag_ext_file_tag_condition )
