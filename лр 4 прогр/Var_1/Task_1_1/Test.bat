@echo off

SET MyProgram="%1"

if %MyProgram%=="" (
	echo "Your should type full path program to our program"
	exit /B 1
)

::Test1 - Проверка создания пустого файла из другого пустого файла
%MyProgram% input_empty.txt output.txt || goto err
fc input_empty.txt output.txt > nul|| goto err
echo "Test 1 passed"

::Test2 - Проверка копирования файла с данными
%MyProgram% input_not_empty.txt output.txt || goto err
fc input_not_empty.txt output.txt > nul || goto err
echo "Test 2 passed"

::Test3 - Проверка недостаточного количества аргументов подаваемых программе на вход
%MyProgram% input_not_empty.txt > nul && goto err
echo "Test 3 passed"

::Test4 - Проверка работы при отсутствии аргументов
%MyProgram% > nul && goto err
echo "Test 4 passed"
 
::Test5 - Проверка при одлном аргументе с именем несуществующего файла
%MyProgram% input1234.txt > nul && goto err
echo "Test 5 passed"

::Test6 - Проверка копирования несуществуцющего файла 
%MyProgram% input1234.txt output.txt > nul && goto err
echo "Test 6 passed"
 
::Test7 - Проверка записи файла в несуществующюю директорию 
%MyProgram% input_not_empty.txt "M:\bnty\output.txt" > nul && goto err
echo "Test 7 passed








echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1