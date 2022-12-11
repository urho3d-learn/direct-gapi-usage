:: Меняем кодировку консоли на UTF-8
chcp 65001

:: Указываем путь к cmake.exe
set "PATH=c:\programs\cmake\bin"

:: Компилируем проекты в папке build_vs.
:: В процессе разработки нам нужна отладочная версия движка, а для релизной версии игры нужна релизная версия движка
cmake --build build_vs --config Debug
cmake --build build_vs --config Release

:: Ждём нажатие Enter перед закрытием консоли
pause
