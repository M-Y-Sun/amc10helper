#include <iostream>
#include <vector>
#include <sstream>
#include <fstream>

std::vector<std::string> sepstr(std::string str){
    std::vector<std::string> res;
    std::string word;
    std::istringstream ss(str);
    while(ss >> word){
        res.push_back(word);
    }

    return res;
}

int main(){
    std::string test;
    printf("enter test (<year> <season> <letter>, ex. 2020 a or 2021 fall a or 2001)\n\t> ");
    std::getline(std::cin, test);

    std::vector<std::string> septest = sepstr(test);
    
    if(septest.size() > 3){
        perror("invalid test input\n");
        return -1;
    }

    int year = std::stoi(septest[0]);
    if(year < 2000 || year > 2023){
        std::cerr << "no test found for year " << year << std::endl;
        return -1;
    }
    std::string fname;
    if(year == 2000 || year == 2001){
        fname = std::to_string(year);
    }else if(year != 2021){
        fname = std::to_string(year).append(septest[1]);
    }else{
        fname = std::to_string(year).append(septest[1]).append(septest[2]);
    }
    fname = "../lib/" + fname + ".txt";

    std::fstream file;
    file.open(fname, std::ios::in);
    if(!file.is_open()){
        std::cerr << "failed to open file '" << fname << "'" << std::endl;
        return -1;
    }

    std::string line;
    int beg;
    printf("enter starting question\n\t> ");
    scanf("%d", &beg);
    int iter;
    for(iter = 0; iter < beg - 1; ++iter){
        std::getline(file, line);
    }
    
    while(std::getline(file, line)){
        char ans = (line.c_str())[0];
        char ans_in = '\0';
        while(1){
            printf("q%d > ", iter + 1);
            scanf(" %c", &ans_in);
            ans_in = toupper(ans_in);
            if(ans == ans_in){
                printf("correct\n");
                break;
            }else{
                printf("incorrect\n");
            }
        }
        ++iter;
    }
    printf("problem set finished\n");

    return 0;
}
