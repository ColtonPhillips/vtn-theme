#include <vector>
#include <string>
#include <iostream>
#include <fstream>
#include <algorithm>
#include <cctype>
#include <functional>
#include <cstdlib>
#include <ctime>

using namespace std;

// These templates are boost lib stuff
template <typename CharType, typename TraitsType, typename AllocType>
std::basic_string <CharType, TraitsType, AllocType>
uppercase( const std::basic_string <CharType, TraitsType, AllocType> & s )
{
    std::basic_string <CharType, TraitsType, AllocType> result( s.length(), '\0' );
    std::transform(
        s.begin(),
        s.end(),
        result.begin(),
        std::ptr_fun <int, int> ( std::toupper )
    );
    return result;
}

template <typename CharType, typename TraitsType, typename AllocType>
std::basic_string <CharType, TraitsType, AllocType>
lowercase( const std::basic_string <CharType, TraitsType, AllocType> & s )
{
    std::basic_string <CharType, TraitsType, AllocType> result( s.length(), '\0' );
    std::transform(
        s.begin(),
        s.end(),
        result.begin(),
        std::ptr_fun <int, int> ( std::tolower )
    );
    return result;
}

template <typename CharType, typename TraitsType, typename AllocType>
std::basic_string <CharType, TraitsType, AllocType>
titlecase( const std::basic_string <CharType, TraitsType, AllocType> & s )
{
    std::basic_string <CharType, TraitsType, AllocType> result = lowercase( s );
    typename std::basic_string <CharType, TraitsType, AllocType> ::iterator iter = result.begin();
    while (iter != result.end())
    {
        *iter = toupper( *iter );
        iter = std::find_if( iter, result.end(), std::not1( std::ptr_fun <int, int> ( std::isalpha ) ) );
        iter = std::find_if( iter, result.end(),            std::ptr_fun <int, int> ( std::isalpha )   );                    }
    return result;
}

int readfile(string filename, vector<string>* source) {
    ifstream file;
    string line;

    file.open(filename.c_str());

    if (!file.is_open()) {
        return false;
    }

    while (getline(file, line)) {
        source->push_back(line);
    }

    return true;
}

int main() {
    srand (unsigned (time(0)));
    vector<string> verbs;
    vector<string> nouns;
    readfile("verbs.txt", &verbs);
    readfile("nouns.txt", &nouns);
    random_shuffle(verbs.begin(), verbs.end());
    random_shuffle(nouns.begin(), nouns.end());

    for (int i = 0; i < 100; ++i) {
        cout << titlecase(verbs[i]) << " the " << titlecase(nouns[i]) << endl;
    }
    return 0;
}
