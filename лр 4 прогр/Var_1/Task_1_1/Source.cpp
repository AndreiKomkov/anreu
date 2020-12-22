#include <iostream>
#include <fstream>

int main(int argc,char* array[]) 
{
	if (argc != 3)
	{
		std::cout << "Count of argument must be egual 2\n";
		std::cout << "Example: source.exe <input.txt><output.txt>\n";
		return 1;
	}

	std::ifstream input(array[1]);
	if (!input.is_open())
	{
		std::cout << "Your file " <<  array[1]  << " can't be open\n";
		return 1;

	}

	std::ofstream output(array[2]);
	if (!output.is_open())
	{
		std::cout << " File " << array[2] << "can't be created\n";
		return 1;
	}
	char ch;
	while (input.get(ch))
	{
		if (!output.put(ch))
		{
			break; 
		}
	}

	if (input.bad())
	{
		std::cout << "File " << array[1] << " integration or can't be read\n";
		return 1;
	}
	
	if (!output.flush())
	{
		std::cout << "File " << array[2] << " can't be written on the disk\n";
		return 1;
	}

	return 0;
}