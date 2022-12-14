:: Меняем кодировку консоли на UTF-8
chcp 65001

:: Указываем путь к cmake.exe
set "PATH=c:\programs\cmake\bin"

:: Создаём проекты для Visual Studio 2019 в папке build_vs, используя конфиг CMakeLists.txt из папки repo
:: https://urho3d-doxygen.github.io/doxygen/_building.html
cmake.exe repo -B build_vs -G "Visual Studio 16" -A x64 -D URHO3D_OPENGL=1 -D URHO3D_D3D11=1^
 -D URHO3D_ANGELSCRIPT=0 -D URHO3D_SAMPLES=0 -D URHO3D_TOOLS=0^
 -D URHO3D_NETWORK=0 -D URHO3D_PHYSICS2D=0 -D URHO3D_URHO2D=0^
 -D URHO3D_NAVIGATION=0 -D URHO3D_IK=0 -D URHO3D_WEBP=0 -D URHO3D_PHYSICS=0

:: Ждём нажатие Enter перед закрытием консоли
pause
