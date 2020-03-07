#include <algorithm>
#include <dirent.h>	//!NOT STL!
#include <fstream>
#include <cstdio>
#include <cstdlib>
#include <string>
#include <vector>
#include <cctype>
using namespace std;

/*	Author: Calph
 *	
 *	Checks if any tags in history/states/ do not exist in the file pointed to by GOOD_TAGS_PATH.
 *	This file was originally specified for linux. It can be easily attuned for any other OS, however.
 */

//Path to some Directory, usually <mod_loc>/history/states/
const char* PATH = "./history/states";
//Path to good tags (must be a simple file w/ a single tag for each line- Any deviation will cause unexpected behavior).
const char* GOOD_TAGS_PATH = "./tags.txt/"

//Gets tags (a word composed of three capital letters) in some ifstream
void get_tags(vector<string>& tags, ifstream& ifs);

int main(int argc, char** argv){
	ifstream ifs;					//As advertised
	vector<string> 	good_tags, 		//Stores tags in GOOD_TAGS_PATH
					tags, 			//Stores tags found in some ifstream via get_tags
					bad_files;		//Stores bad files for printing later
	string buff;					//Simple buffer
	DIR *dir;						//Dirent.h specific
	struct dirent *ent;				//Dirent.h specific

	//Get tags from GOOD_TAGS_PATH
	ifs.open(GOOD_TAGS_PATH);
	if(!ifs.is_open()){ 
		fprintf(stderr, "File: %s could not be opened.\n", GOOD_TAGS_PATH); 
		exit(1); 
	}
	while(getline(ifs,buff,'\n')) good_tags.push_back(buff);
	ifs.close();

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
				printf("\tERR:%s\n",ent->d_name);
				//exit(1);
			}
			
			get_tags(tags,ifs);

			printf("\t");
			for(int i = 0; i < tags.size(); i++){
				printf("%s, ",tags[i].c_str());
				if(find(good_tags.begin(),good_tags.end(),tags[i]) == good_tags.end()){
					printf("\n\t%s",ent->d_name);
					bad_files.push_back(ent->d_name);
					break;
				}
			}
			printf("\n");

			tags.resize(0); 
			ifs.close();
		}
		closedir(dir);
	}
	else {
		printf("FAILURE\n");
	}

	for(int i = 0; i < bad_files.size(); i++){
		printf("%s\n",bad_files[i].c_str());
	}
}

//Gets tags (a word composed of three capital letters) in some ifstream
void get_tags(vector<string>& tags, ifstream& ifs){
	string s,t;
	char buff;
	smatch m;

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
