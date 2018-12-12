#include <iostream>
#include <vector>
#include <algorithm>

#include <pqxx/pqxx>

#include "_error.h"
#include "_log.h"
#include "student.h"
#include "_CSVWriter.h"
#include "product.h"

int main(int argc, char const *argv[])
{
	std::cout<<"Angru version .010. Check Logfile."<<std::endl;
	std::cout << "--------------------------------------" << '\n';
	try
	{
		pqxx::result R = Product::getProducts("id <= 8 AND price < 120");
		CSVWriter writer("products8.csv");
		writer.addData(R);
	}
	catch(const _error& e)
	{
    LOG_ERROR << e.what();
		return 1;
	}
	catch(...)
	{
    LOG_ERROR << "Error: unknown exception";
		return 2;
	}
	return 0;
}
