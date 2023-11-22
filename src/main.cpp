#include <iostream>
#include <vector>
#include <fstream>
#include <sstream>

std::vector<std::string> sepstr(std::string str){
    std::vector<std::string> res;
    std::stringstream strstrm(str);
    std::string word;
    while(std::getline(strstrm, word, ' ')){
        res.push_back(word);
    }

    return res;
}

int main(){
    std::string test;
    printf("which test (ex. 2020 a or 2021 fall a or 2001)\n\t> ");
    std::cin >> test;

    std::vector<std::string> septest = sepstr(test);
    int year = std::stoi(septest[0]);

    return 0;
}
