# Template pour projet C++ moderne

## Table des matières

- [Fonctionnalités](#fonctionnalités)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Utilisation](#utilisation)
- [Contribution](#contribution)
- [FAQ](#faq)
- [Licence](#licence)
- [Auteurs](#auteurs)

## Fonctionnalités

Ce dépôt est un template pour projets C++ modernes. Il utilise Docker avec une image Debian 13.3 (trixie) comme environnement de développement.

La toolchain inclut les outils suivants avec leurs versions :
- **g++** : 14.2.0 (compilateur C++)
- **git** : 2.47.3 (gestion de versions)
- **valgrind** : 3.24.0 (détection de fuites mémoire)
- **cccc** : 3.1.6 (analyse de métriques code)
- **cppcheck** : 2.17.1 (analyse statique)
- **gdb** : 16.3 (débogueur)
- **doxygen** : 1.9.8 (génération de documentation)
- **uncrustify** : 0.78.1 (formatage de code)
- **cmake** : 3.31.6 (système de build)
- **boost** : 1.83.0 (bibliothèques C++)

Le template inclut également :
- Un workflow GitHub Actions CI/CD prêt à l'emploi (fichier `.github/workflows/c-cpp.yml`)
- Configuration pré-établie pour le formatage de code avec uncrustify (fichier `.uncrustify`)
- Configuration doxygen pour la génération de documentation
- Un fichier `.gitignore` adapté aux projets C++

**Détails sur la configuration uncrustify :**
Le fichier `.uncrustify` est configuré pour formater le code C++ selon les conventions snake_case, avec des règles adaptées pour les noms de variables, fonctions et classes.

## Prérequis

Pour utiliser ce template, vous avez besoin de :
- **VSCode** avec l'extension **Dev Containers** (ou **VSCodium** avec **DevPod**)
- **Docker** installé et fonctionnel sur votre machine
- **Git** pour le contrôle de version
- **Compilateur C++** g++ pour le développement local (optionnel)

**Recommandations supplémentaires :**
- **Extension C/C++** pour VSCode/Codium pour une meilleure expérience de développement
- **Extension CMake Tools** pour la gestion des builds CMake

## Installation

1. Créez un nouveau dépôt GitHub/GitLab en utilisant ce template
2. Clonez votre nouveau dépôt localement
3. Ouvrez le projet dans VSCode/VSCodium
4. Utilisez la commande "Reopen in Container" pour lancer l'environnement Docker
5. Le container se construira automatiquement avec tous les outils nécessaires

## Utilisation

Une fois dans le container :
- Le projet est configuré avec CMake et utilise des presets modernes
- Utilisez `cmake --preset` pour configurer et construire
- Les outils d'analyse (cppcheck, valgrind, etc.) sont disponibles
- Les tests peuvent être exécutés avec `ctest --preset`
- Utilisez `doxygen` pour générer la documentation
- Utilisez `uncrustify` pour formater le code selon les règles définies

**Commandes utiles avec les presets CMake :**

### Configuration et build
```bash
# Configurer le projet en mode Debug (GCC)
cmake --preset gcc-debug

# Configurer le projet en mode Release (GCC)
cmake --preset gcc-release

# Configurer le projet en mode Debug (MSVC/Windows)
cmake --preset msvc-debug

# Configurer le projet en mode Release (MSVC/Windows)
cmake --preset msvc-release

# Construire le projet (après configuration)
cmake --build --preset gcc-debug
cmake --build --preset gcc-release
```

### Exécution des tests
```bash
# Exécuter les tests en mode Debug
ctest --preset gcc-debug

# Exécuter les tests en mode Release
ctest --preset gcc-release

# Exécuter les tests avec plus de détails
ctest --preset gcc-debug --verbose
```

### Analyse de code
```bash
# Exécuter l'analyse statique avec cppcheck
cmake --build --preset gcc-debug --target analyse
cmake --build --preset gcc-release --target analyse
```

### Packaging
```bash
# Générer un package DEB/RPM (Linux)
cpack --preset gcc-release

# Générer un package MSI (Windows)
cpack --preset msvc-release

# Générer un package simple (TGZ)
cpack --preset gcc-release -G TGZ
```

### Workflow complet
```bash
# Exécuter le workflow CI complet (configuration, build, tests, packaging)
cmake --workflow --preset ci-workflow
```

### Autres commandes utiles
```bash
# Nettoyer le build
cmake --build --preset gcc-debug --target clear

# Exécuter une cible spécifique
cmake --build --preset gcc-debug --target nom_de_la_cible
```

## Contribution

Pour l'instant, ce projet est maintenu uniquement par OliveiraDF. Les contributions sont les bienvenues !

## FAQ

**Q: Comment ajouter des dépendances ?**  
R: Modifiez le fichier CMakeLists.txt et ajoutez vos dépendances via `find_package()` ou `add_subdirectory()`.

**Q: Comment exécuter les tests ?**  
R: Utilisez `ctest --preset gcc-debug` ou `ctest --preset gcc-release` pour exécuter les tests.

**Q: Comment analyser la qualité du code ?**  
R: Utilisez `cppcheck` pour l'analyse statique et `valgrind` pour détecter les fuites mémoire.

## Licence

Ce projet est sous licence CeCILL. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

## Auteurs

- **OliveiraDF** - Créateur et mainteneur principal