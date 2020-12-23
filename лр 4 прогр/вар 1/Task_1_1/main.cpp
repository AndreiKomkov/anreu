#include <iostream>
#include <fstream>

int main(int argc, char* array[])
{
	if (argc != 3)
	{
		std::cout << "Count of arguments must be equal 2\n";
		std::cout << "Example: mycp.exe <input.txt> <output.txt>\n";
		return 1;
	}
	std::ifstream input(array[1]);
	if (!input.is_open())
	{
		std::cout << "Your file " << array[1] << " can`t open\n";
		return 1;
	}
	std::ofstream output(array[2]);

	if (!output.is_open())
	{
		std::cout << "File " << array[2] << " can`t be created\n";
		return 1;
	}

	char ch;
	while (input.get(ch))
	{
		output.put(ch);
	}

	if (!output.flush())
	{
		std::cout << "File" << array[2] << " cau`t be written on the disk";
		return 1;
	}

	if (input.bad())
	{
		std::cout << "File " << array[1] << " iterrupted or can`t be read";
		return 1;
	}


	/*
	for (int i = 0; i < argc; i++)
	{
	std::cout << array[i] << std::endl;
	}
	*/
	return 0;

}