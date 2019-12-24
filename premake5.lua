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
        files { "./Source/Mossflower/**.cpp", "./Source/Mossflower/**.hpp", "./Source/Mossflower/**.inl" }
        removefiles { "./Source/Mossflower/Main.cpp" }

    project "MossflowerExecutable"
        removeconfigurations { "Test" }
        kind "ConsoleApp"
        files { "./Source/Mossflower/Main.cpp" }
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
