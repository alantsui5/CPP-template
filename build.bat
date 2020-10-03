if "%CMAKE_GENERATOR%"=="" (
    ECHO CMAKE_GENERATOR environment variable not defined. Please define the CMake generator in the CMAKE_GENERATOR environment variable.
)
else (
    @ECHO ON

    RMDIR /Q /S build
    MKDIR build
    PUSHD build

    conan install ..
    cmake .. -G "Visual Studio 16 2019"
    cmake --build . --config Release
    copy ..\resources .\bin
    
    bin\md5.exe
)
