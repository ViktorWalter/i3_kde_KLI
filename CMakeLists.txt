cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)

set(QT_MIN_VERSION "5.4.0")
set(KF5_MIN_VERSION "5.0.0")

find_package(ECM 0.0.11 REQUIRED NO_MODULE)

set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings)

find_package(Qt5 ${REQUIRED_QT_VERSION} CONFIG REQUIRED Quick)
find_package(KF5 ${KF5_MIN_VERSION} REQUIRED COMPONENTS Plasma)

add_subdirectory(plugin)

plasma_install_package(package org.kde.plasma.indicatorkl)

FILE(GLOB_RECURSE QMLFiles "package/*.qml")
add_custom_target(qml SOURCES ${QMLFiles})
