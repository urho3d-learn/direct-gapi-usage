:: Этот батник нужно запускать от Админа, чтобы не копировать папки с данными,
:: а просто создавать символические ссылки на них (команда mklink требует админских прав)

:: Меняем кодировку консоли на UTF-8
chcp 65001

:: Проверяем, что батник запущен от Админа. Для этого запускаем программу, которая требует админских прав.
:: Если возникает ошибка, значит батник запущен не от Админа
:: 2>&1 редиректит stderr в stdout
:: >nul редиректит stdout в nul (эквивалентно 1>nul)
:: https://support.microsoft.com/ru-ru/help/110930/redirecting-error-messages-from-command-prompt-stderr-stdout
@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Запустите батник от Админа
    pause
    exit /b
)
@echo on

:: При запуске батника от Админа меняется текущий путь. Фиксим это
cd /D "%~dp0"

:: Указываем путь к cmake.exe
set "PATH=c:\programs\cmake\bin"

:: Создаём проекты для Visual Studio 2019 в папке build_vs, используя конфиг CMakeLists.txt из папки src.
:: Необходимо использовать те же настройки, что и у движка
cmake.exe src -B build_vs -G "Visual Studio 16" -A x64 -D URHO3D_OPENGL=1 -D URHO3D_D3D11=1^
 -D URHO3D_ANGELSCRIPT=0 -D URHO3D_SAMPLES=0 -D URHO3D_TOOLS=0^
 -D URHO3D_NETWORK=0 -D URHO3D_PHYSICS2D=0 -D URHO3D_URHO2D=0^
 -D URHO3D_NAVIGATION=0 -D URHO3D_IK=0 -D URHO3D_WEBP=0 -D URHO3D_PHYSICS=0

:: Ждём нажатие Enter перед закрытием консоли
pause
