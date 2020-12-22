@echo off

SET MyProgram="%1"

if %MyProgram%=="" (
	echo "Your should type full path program to our program"
	exit /B 1
)

::Test1 - �������� �������� ������� ����� �� ������� ������� �����
%MyProgram% input_empty.txt output.txt || goto err
fc input_empty.txt output.txt > nul|| goto err
echo "Test 1 passed"

::Test2 - �������� ����������� ����� � �������
%MyProgram% input_not_empty.txt output.txt || goto err
fc input_not_empty.txt output.txt > nul || goto err
echo "Test 2 passed"

::Test3 - �������� �������������� ���������� ���������� ���������� ��������� �� ����
%MyProgram% input_not_empty.txt > nul && goto err
echo "Test 3 passed"

::Test4 - �������� ������ ��� ���������� ����������
%MyProgram% > nul && goto err
echo "Test 4 passed"
 
::Test5 - �������� ��� ������ ��������� � ������ ��������������� �����
%MyProgram% input1234.txt > nul && goto err
echo "Test 5 passed"

::Test6 - �������� ����������� ���������������� ����� 
%MyProgram% input1234.txt output.txt > nul && goto err
echo "Test 6 passed"
 
::Test7 - �������� ������ ����� � �������������� ���������� 
%MyProgram% input_not_empty.txt "M:\bnty\output.txt" > nul && goto err
echo "Test 7 passed








echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1