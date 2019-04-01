cmake_minimum_required(VERSION 3.14)

project(test)

include_directories(
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/lex_yacc)

add_executable(${PROJECT_NAME}
    "main.cpp"
    "lex_yacc/lex.cpp"
    "lex_yacc/yacc.hpp"
    "lex_yacc/yacc.cpp")

add_custom_command(
        OUTPUT lex.cpp
        COMMAND flex -o lex.cpp lex.l
        DEPENDS lex.l
        WORKING_DIRECTORY lex_yacc
        COMMENT "lex")
add_custom_command(
        OUTPUT yacc.cpp yacc.hpp
        COMMAND bison -d -o yacc.cpp yacc.y
        DEPENDS yacc.y
        WORKING_DIRECTORY lex_yacc
        COMMENT "yacc")
