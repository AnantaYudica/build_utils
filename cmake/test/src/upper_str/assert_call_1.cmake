function(call)
    cmake_parse_arguments(call "" "OUTPUT" "ARGS" ${ARGN}) 
    set(out "")
    list(LENGTH call_ARGS len)
    if (len EQUAL 1)
        list(GET call_ARGS 0 str)
        upper_str(${str} out)
    elseif(len EQUAL 2)
        list(GET call_ARGS 0 str)
        list(GET call_ARGS 1 index)
        upper_str(${str} out INDEX ${index})
    elseif(len EQUAL 3)
        list(GET call_ARGS 0 str)
        list(GET call_ARGS 1 index)
        list(GET call_ARGS 2 length)
        upper_str(${str} out INDEX ${index} LENGTH ${length})
    endif()
    set(${call_OUTPUT} ${out} PARENT_SCOPE)
endfunction(call)
