#include <algorithm>
#include <dirent.h>	//!NOT STL!
#include <fstream>
#include <cstdio>
#include <cstdlib>
#include <string>
#include <set>
#include <vector>
#include <cctype>
using namespace std;

/*	Author: Calph
 *	
 *	Finds all tags (as in word composed of 3 capital letters) which exist in PATH.
 *	This file was originally specified for linux. It can be easily attuned for any other OS, however.
 */

//Path to some Directory, usually <mod_loc>/history/states/
const char* PATH = "./history/states";

//Gets tags (a word composed of three capital letters) in some ifstream
void get_tags(vector<string>& tags, ifstream& ifs);

int main(int argc, char** argv){
	ifstream ifs;				//As advertised
	vector<string> tags;		//Stores tags found in some ifstream via get_tags
	set<string> extant_tags;	//Stores all tags found in PATH
	set<string>::iterator sit;	//down
	string buff;				//Simple buffer
	DIR *dir;					//Dirent.h specific
	struct dirent *ent;			//Dirent.h specific

	//I do something to all files in a given directory!
	if((dir = opendir(PATH)) != NULL){
		while((ent = readdir(dir)) != NULL){
			//That something I do:
			
			buff = PATH;
			buff += '/';
			buff += ent->d_name;

			printf("%s\n",buff.c_str());
			
			ifs.open(buff);
			if(!ifs.is_open()){
				printf("ERR:%s\n",ent->d_name);
				//exit(1);
			}
			
			get_tags(tags,ifs);
			printf("\t");
			for(int i = 0; i < tags.size(); i++){
				printf("%s, ",tags[i].c_str());
				 extant_tags.insert(tags[i]);
			}
			printf("\n");
			tags.resize(0);
			ifs.close();
		}
		closedir(dir);
	}
	else {
		printf("Failure\n");
	}

	for(sit = extant_tags.begin(); sit != extant_tags.end(); ++sit){
		printf("%s\n",sit->c_str());
	}
}

//Gets tags (a word composed of three capital letters) in some ifstream
void get_tags(vector<string>& tags, ifstream& ifs){
	string s,t;
	char buff;

	while(getline(ifs,s)){
		t = "";
		for(int i = 0; i < s.size(); i++){
			if(t.size() == 3 && (i+1 > s.size() || isupper(i+1))) break;
			if(isupper(s[i])) t += s[i];
			else if(t.size() > 0) t = "";
		}

		if(t.size() == 3) tags.push_back(t);
	}
}
