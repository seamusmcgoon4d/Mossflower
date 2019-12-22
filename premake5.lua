workspace "Mossflower"
    configurations { "Debug", "Release", "Test" }
    location "./Generated/"
    architecture "x86_64"
    language "C++"
    cppdialect "C++17"

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "RELEASE" }
        optimize "On"

    filter "configurations:Test"
        defines { "TEST", "DEBUG" }
        symbols "On"

    filter { }

    targetdir ("./Builds/Bin/%{prj.name}/%{cfg.longname}")
    objdir ("./Builds/Obj/%{prj.name}/%{cfg.longname}")

    project "MossflowerLibrary"
        kind "StaticLib"
        files { "./Source/MossflowerLibrary/**.cpp", "./Source/MossflowerLibrary/**.hpp", "./Source/MossflowerLibrary/**.inl" }
        removefiles { "./Source/MossflowerLibrary/Main.cpp" }
    
    project "MossflowerExecutable"
        removeconfigurations { "Test" }
        kind "ConsoleApp"
        files { "./Source/MossflowerLibrary/Main.cpp" }
        includedirs { "./Source/" }
        links { "MossflowerLibrary" }
        
    project "GoogleTest"
        removeconfigurations { "Debug", "Release" }
        kind "StaticLib"
        files { "./Submodules/googletest/googletest/src/gtest-all.cc" }
        includedirs { "./Submodules/googletest/googletest/include", "./Submodules/googletest/googletest" }

    project "MossflowerTests"
        removeconfigurations { "Debug", "Release" }
        kind "ConsoleApp"
        files { "./Tests/**.cpp", "./Tests/**.hpp" }
        includedirs { "./Source/", "./Submodules/googletest/googletest/include" }
        links { "MossflowerLibrary", "GoogleTest" }
