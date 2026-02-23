find_program(UNCRUSTIFY_PATH uncrustify)

if(UNCRUSTIFY_PATH)

    add_custom_target(
        format
        COMMAND find ${CMAKE_SOURCE_DIR}/src -type f \( -name "*.cpp" -o -name "*.h" \) -exec ${UNCRUSTIFY_PATH} -c ${CMAKE_SOURCE_DIR}/.uncrustify --no-backup --replace {} +
        COMMAND find ${CMAKE_SOURCE_DIR}/include -type f \( -name "*.h" -o -name "*.inl" \) -exec ${UNCRUSTIFY_PATH} -c ${CMAKE_SOURCE_DIR}/.uncrustify --no-backup --replace {} +
        COMMENT "Formatage du code avec Uncrustify"
        VERBATIM
    )

else()

    message(WARNING "uncrustify non trouvé : la cible 'format' ne sera pas disponible")
    
endif()
