cmake_minimum_required(VERSION 3.10)
project(TxtElite C)



set(DOWNLOAD_DIR "${CMAKE_CURRENT_SOURCE_DIR}/download")
set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")
set(TXTELITE_ZIP "${DOWNLOAD_DIR}/b9101315.zip")
set(TXTELITE_SOURCE "${SRC_DIR}/TXTELITE.C")

#
# Download Text Elite Source and Apply Patch
#

if(NOT EXISTS "${TXTELITE_SOURCE}")
    # Create directories
    file(MAKE_DIRECTORY "${DOWNLOAD_DIR}")
    file(MAKE_DIRECTORY "${SRC_DIR}")
    
    message(STATUS "Downloading Text Elite 1.5 source...")

    file(DOWNLOAD 
        "http://www.elitehomepage.org/archive/a/b9101315.zip"
        "${TXTELITE_ZIP}"
        SHOW_PROGRESS
        STATUS download_status
    )
    
    list(GET download_status 0 status_code)
    if(NOT status_code EQUAL 0)
        message(FATAL_ERROR "Failed to download Text Elite source")
    endif()
    
    message(STATUS "Extracting Text Elite 1.5 source...")
    file(ARCHIVE_EXTRACT 
        INPUT "${TXTELITE_ZIP}"
        DESTINATION "${SRC_DIR}"
    )
    
    message(STATUS "Applying compatibility patch...")

    find_program(PATCH_EXECUTABLE patch)
    if(PATCH_EXECUTABLE)
        execute_process(
            COMMAND ${PATCH_EXECUTABLE} -p0 -i ../goatsoup_fix.patch
            WORKING_DIRECTORY "${SRC_DIR}"
            RESULT_VARIABLE patch_result
        )
        if(NOT patch_result EQUAL 0)
            message(WARNING "Patch failed, applying manual fix...")
        endif()
    else()
        message(STATUS "patch command not found, applying manual fix...")
    endif()
    
    # Manual fix if patch command not available
    file(READ "${TXTELITE_SOURCE}" source_content)
    string(REPLACE 
        "int c=*(source++);" 
        "int c=(unsigned char)(*(source++));"
        source_content "${source_content}")
    string(REPLACE 
        "#include <conio.h>" 
        "/* #include <conio.h> */"
        source_content "${source_content}")
    string(REPLACE 
        "#include <graph.h>" 
        "/* #include <graph.h> */"
        source_content "${source_content}")
    string(REPLACE 
        "#include <malloc.h>" 
        "/* #include <malloc.h> */"
        source_content "${source_content}")
    file(WRITE "${TXTELITE_SOURCE}" "${source_content}")
    message(STATUS "Windows compatibility fixes applied")
endif()

#
# Tell CMake that .C files are C source files
#
set_source_files_properties(${TXTELITE_SOURCE} PROPERTIES LANGUAGE C)

add_executable(txtelite ${TXTELITE_SOURCE})
