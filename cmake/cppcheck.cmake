find_program(CPPCHECK_PATH cppcheck)

if(CPPCHECK_PATH)

    add_custom_target(
        analyse
        COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/cppcheck
        COMMAND ${CPPCHECK_PATH}
            --cppcheck-build-dir=${CMAKE_BINARY_DIR}/cppcheck
            --platform=${CPPCHECK_PLATFORM}
            --language=c++
            --std=c++20
            --enable=warning,style,performance,portability
            --inconclusive
            --suppress=missingIncludeSystem
            --suppress=unmatchedSuppression
            --suppress=unusedFunction
            --error-exitcode=1
            ${CMAKE_SOURCE_DIR}/examples
        COMMENT "Analyse statique avec cppcheck"
        VERBATIM
    )

else()

    message(WARNING "cppcheck non trouvé : la cible 'analyse' ne sera pas disponible")
    
endif()