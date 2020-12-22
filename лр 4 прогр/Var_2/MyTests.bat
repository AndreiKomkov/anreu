@echo off
set Program="%~1"

if %Program%=="" (
	 "Full path of the program is empty"
	exit /B 1
)

:: Test 1 - Проверка недостаночного количества аргументов, подаваемых на вход программе
%Program% input_not_empty.txt > nul && goto err
 echo "Test 1 passed"

:: Test 2 - Проверка на отсутсвие аргументов, подаваемых на вход программе
%Program% > nul && goto err
 echo "Test 2 passed"

:: Test 3 - Проверка при одном аргументе с именем несуществующего файла
%Program% _input.txt > nul && goto err
 echo "Test 3 passed"

:: Test 4 - Проверка ввода несуществующего первого файла
%Program% _input.txt file1.txt > nul && goto err
 echo "Test 4 passed"

:: Test 5 - Проверка ввода несуществующего второго файла
%Program% file1.txt _input.txt > nul && goto err
 echo "Test 5 passed"

:: Test 6 - Проверка определения корректности работы программы при различном содержимом файлов
%Program% file1.txt file2.txt > output_1.txt || goto err
fc output_1.txt output_diff_ethalon.txt > nul|| goto err
echo "Test 6 passed"

:: Test 7 - Проверка определения корректности работы программы при одинаковом содержимом файлов
%Program% file3.txt file4.txt > output2.txt || goto err
fc output2.txt output_same_ethalon.txt > nul || goto err
echo "Test 7 passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Test failed"
exit /B 1