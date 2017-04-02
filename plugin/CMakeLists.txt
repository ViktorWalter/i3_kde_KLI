set(plasmoidplugin_SRCS
    plasmoidplugin.cpp
    layoutfetcher.cpp
    )

add_library(plasmoidplugin SHARED ${plasmoidplugin_SRCS})

target_link_libraries(plasmoidplugin Qt5::Quick KF5::Plasma)
set(QML_INSTALL_DIR "/usr/lib/x86_64-linux-gnu/qt5/qml")

install(TARGETS plasmoidplugin DESTINATION ${QML_INSTALL_DIR}/org/kde/private/layoutfetcher)

install(FILES qmldir DESTINATION ${QML_INSTALL_DIR}/org/kde/private/layoutfetcher)

message("install dir a is ${KDE_INSTALL_QMLDIR}")
message("install dir b is ${QML_INSTALL_DIR}")
message("install dir c is ${KDE_INSTALL_FULL_QMLDIR}")

FILE(GLOB_RECURSE qmldirs "qmldir")
add_custom_target(qmldir SOURCES ${qmldirs})
