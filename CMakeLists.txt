cmake_minimum_required(VERSION 3.16)

project(MKProjectRandom VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(${PROJECT_NAME}
    main.cpp
    mkpers.h
    mkpers.cpp
    persdata.h
    persdata.cpp
    persmodel.h
    persmodel.cpp
)

qt_add_qml_module(${PROJECT_NAME}
    URI qml
    VERSION 1.0
    QML_FILES main.qml TournamentView.qml ScoresView.qml
)

target_compile_definitions(${PROJECT_NAME}
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME}
    PRIVATE Qt6::Quick)
