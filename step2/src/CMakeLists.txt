# https://urho3d-doxygen.github.io/doxygen/_using_library.html

# Минимальная версия CMake
cmake_minimum_required (VERSION 3.15)

# Название проекта (solution в Visual Studio)
project (step2)

# Путь к скомпилированному движку
set (ENV{URHO3D_HOME} ${CMAKE_SOURCE_DIR}/../../engine/build_vs)

# Путь к модулям CMake
set (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/../../engine/repo/cmake/Modules)

# Получаем доступ к функциям из модуля UrhoCommon.cmake
include (UrhoCommon)

# Название таргета (экзешник игры, проект в Visual Studio)
set (TARGET_NAME step2)

# Создаём список исходных файлов для таргета
# RECURSE - исходники будут искаться также в подпапках
# GROUP - Visual Studio будет отображать файлы как есть, а не раскидывать cpp- и h-файлы в разные категории
define_source_files (GLOB_CPP_PATTERNS *.cpp GLOB_H_PATTERNS *.h RECURSE GROUP)

# Указываем папки с ресурсами
define_resource_dirs (GLOB_PATTERNS ${CMAKE_SOURCE_DIR}/../../engine/repo/bin/CoreData
                                    ${CMAKE_SOURCE_DIR}/../../engine/repo/bin/Data
                                    ${CMAKE_SOURCE_DIR}/../../result/step2_data)

# Создаём таргет
setup_main_executable ()

# В Visual Studio таргет step2 будет назначен стартовым вместо ALL_BUILD,
# чтобы потом не делать это вручную при отладке игры
set_property(DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${TARGET_NAME})
