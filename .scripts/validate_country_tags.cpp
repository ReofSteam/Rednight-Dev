#include<fstream>
#include<cstdio>
#include<cstdlib>
#include<map>
#include<dirent.h>	//!!NOT STL!!
#include<string>

using namespace std;

/* Author: Calph,
 * Last Modified: January 3rd, 2019
 *
 * PLEASE READ THE FOLLOWING CAREFULLY:
 * Ensures every tag in 1 file in common/country_tags/ has corresponding files in common/countries/ & history/countries/. 
 * Note the program uses dirent.h (not STL) and is currently specified for linux (though it should be easily changeable). 
 * It is run from the mod folder.
 */

const char* TAGS_PATH = "./common/country_tags/kn_countries.txt";
const char* COMMON_PATH = "./common/";
const char* HISTORY_COUNTRIES_PATH = "./history/countries/";

struct validator{
	int ln;
	string lb, b, tag, country_path;
	ifstream ifs;
	map<string,string> hcd; //history_countries_data, map<tags,file_path>

	void validate(int i = 0, string p=TAGS_PATH, string ccp=COMMON_PATH, string hcp=HISTORY_COUNTRIES_PATH);
	void reduce(string& str);
	bool divide();
	void check_common_countries(string path);
	void check_history_countries(string path);
	void construct_hcd(string path);
};

//!!//

int main(){
	validator V;
	V.validate();
}

//!!//

void validator::validate(int i, string p, string ccp, string hcp){
	ln = -1;
	
	ifs.open(p);
	if(!ifs.is_open()){
		fprintf(stderr,"TAGS_PATH:%s, failed to open.\n",p.c_str());
		exit(1);	
	}
	
	printf("%s\n",p.c_str());

	construct_hcd(hcp);
	while(getline(ifs,lb,'\n')){
		ln++;
		if(ln < i) continue;
//		printf("%4d: %s\n",ln,lb.c_str());

		//Prep
		b = lb;
		while(isspace(b[0])) b = b.substr(1);
		if(b.size() <= 0 || b[0] == '#') continue;
		if(divide()){
			fprintf(stderr,"Bad Tag; \"%d: %s\"\n",ln,lb.c_str());
			continue;
		}
//		printf("\b%s, %s\n",b.c_str(),tag.c_str());

		//Validating
		check_common_countries(ccp);
		check_history_countries(hcp);
		continue;
	}
	
	ifs.close();
}

//Splits up b into tag & country_path
bool validator::divide(){
	int i;
	tag = country_path = "";	
	
	tag = b.substr(0,3);
	for(i = 0; i < tag.size(); i++) 
		if(!isupper(tag[i])) return 1;	

	//If '=' can't be found it's bad.
	i = b.find('=',i);
	if(i > b.size()) return 1;

	//Find the opening parenthesis
	i = b.find('\"',i);
	if(i > b.size()) return 1;
	
	//Store the text and check for the closing parenthesis
	while(i++ < b.size() && b[i] != '\"' && b[i] != '\n') country_path += b[i];
	if(b[i] == '\n') return 1; 

	return 0;
}

//Attempts to open path, if it cannot, path does not exist.
void validator::check_common_countries(string path){
	path += country_path;
		
	ifstream ifs(path);
	if(!ifs.is_open()){
		fprintf(stderr,"File DNE: %s\n\t\"%d: %s\"\n",path.c_str(),ln,lb.c_str());
		return;
	}
	ifs.close(); 
}

//Checks hcd for history/country file, if it is not in hcd, it DNE.
void validator::check_history_countries(string path){
	map<string,string>::iterator hcd_it;
	hcd_it = hcd.find(tag);
	if(hcd_it == hcd.end()){
		fprintf(stderr,"Could not find file in %s that matches tag: %s\n",path.c_str(),tag.c_str());
		return;
	}
	else hcd.erase(tag);
}

//Stores all relevant files in path into hcd
void validator::construct_hcd(string path){
	string buff, btag;
	DIR *dir;
	struct dirent *ent;
	
//	printf("[====|CONSTRUCT_HCD|====]\n[%s]\n",path.c_str());

	if((dir = opendir(path.c_str())) != NULL){
		while((ent = readdir(dir)) != NULL){
			buff = ent->d_name;
			if(buff.size() < 5 || buff.substr(buff.size()-4) != ".txt") continue;
//			printf("%s\n",buff.c_str());

			btag = buff;
			while(isspace(btag[0])) btag = btag.substr(1);
			if(btag.size() < 3) continue;
			btag = btag.substr(0,3);
			for(int i = 0; i < btag.size(); i++) if(!isupper(btag[i])) continue;
			
			hcd.insert(make_pair(btag,buff));
//			printf("<%s:%s>\n",btag.c_str(),buff.c_str());
		}
	}
}
