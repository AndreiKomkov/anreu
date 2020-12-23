#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;


int main(int argc, char* array[])
{
	if (argc != 3)
	{
		cout << "argc must be equal 3\n";
		cout << "argc = " << argc << "\n";
		return 1;
	}

	ifstream file1(array[1]);
	ifstream file2(array[2]);

	if (!file1.is_open())
	{
		cout << "First file cannot be opened\n";
		file1.close(); file2.close();
		return 1;
	}
	if (!file2.is_open())
	{
		cout << "Second file cannot be opened\n";
		file1.close(); file2.close();
		return 1;
	}
	char ch;
	string file1_in, file2_in;
	while (file1.get(ch))
	{
		file1_in.push_back(ch);
	}

	if (file1.bad())
	{
		cout << "File " << array[1] << " interrupted or can`t be readed\n";
		file1.close(); file2.close();
		return 1;
	}

	if (file2.bad())
	{
		cout << "File " << array[2] << " interrupted or can`t be readed\n";
		file1.close(); file2.close();
		return 1;
	}

	while (file2.get(ch))
	{
		file2_in.push_back(ch);
	}

	if (file1_in == file2_in)
	{
		cout << "Files are equal\n";
		file1.close(); file2.close();
		return 0;
	}
	else
	{
		size_t size = file1_in.size() >= file2_in.size() ? file1_in.size() : file2_in.size();
		for (size_t i = 0, line_count = 1; i < size; ++i)
		{
			if (file1_in[i] != file2_in[i])
			{
				cout << "Files are different. Line number is " << line_count << endl;
				break;
			}
			if (file1_in[i] == '\n' || file2_in[i] == '\n')
			{
				++line_count;
			}
		}
		file1.close(); file2.close();
		return 0;
	}
}