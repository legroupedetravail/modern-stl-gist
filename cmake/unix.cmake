set(COMPILER_WARNINGS
	-Werror							# Traite tous les warnings comme des erreurs
	-Wall							# Active un ensemble standard d’avertissements courants
	-Wextra							# Active des avertissements supplémentaires non inclus dans -Wall
	-Wpedantic						# Respect strict du standard C++ (avertit sur les extensions non standard)
	-Wconversion					# Avertit sur les conversions implicites (ex: float → int)
	-Wshadow						# Avertit si une variable masque une autre (ex: variable locale cache un champ membre)
	-Wnon-virtual-dtor				# Avertit si une classe polymorphe n’a pas de destructeur virtual
    -Wcast-align					# Avertit sur des casts mal alignés (ex: pointer une structure mal alignée)
    -Wunused						# Avertit pour les variables, fonctions, paramètres non utilisés
    -Woverloaded-virtual			# Avertit si une méthode masque une autre avec le même nom mais signature différente
    -Wsign-conversion				# Avertit sur les conversions de signed ↔ unsigned
    -Wdouble-promotion				# Avertit si float est promu en double inutilement
    -Wformat=2						# Avertit sur mauvais formats dans printf/scanf (plus strict que -Wformat)
    -Wimplicit-fallthrough			# Avertit si un case de switch tombe dans un autre sans break
    -Wsuggest-override				# Suggère override pour les fonctions virtuelles redéfinies
    -Wnull-dereference				# Avertit sur les déréférencements potentiels de pointeurs nuls
    -Wold-style-cast				# Avertit si tu utilises un cast C-style ((int)x) au lieu de static_cast, etc
	-Wmissing-field-initializers	# Une structure ou classe agrégée est partiellement initialisée via une initialisation entre accolades ({})
)

set(COMPILER_RELEASE_OPTIMISATION
	-O3								# Optimisation agressive pour la performance maximale
)

set(COMPILER_DEBUG_OPTIMISATION
	-g								# Génère des informations de débogage (DWARF) utilisables par gdb/lldb
	-O0								# Désactivation des optimisations
)

set(CPPCHECK_PLATFORM "unix64")

set(CPACK_FORMAT DEB)
set(CPACK_COMMENT "Génération du paquet DEB (Linux)")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER ${PROJECT_MAINTENER})
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)
#set(CPACK_DEBIAN_PACKAGE_DEPENDS "libc6 (>= 2.27)")
set(CPACK_GENERATOR "DEB")