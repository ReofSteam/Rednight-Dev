import os
import sys
import time
import platform
from fnmatch import fnmatch
files = []
dirName = os.getcwd()
if platform.system() == "Windows": 
	ftf_folder = "\\"
	dirName = dirName.replace("{0}.scripts".format(ftf_folder),"")
	print("You are using Windows, and we will therefore be using " + ftf_folder)
elif platform.system() == "Linux": 
	ftf_folder = "/"
	print("You are using Linux, and we will therefore be using " + ftf_folder)
	dirName = dirName.replace("{0}.scripts".format(ftf_folder),"")
ideologies = []
if len(sys.argv) > 1:
	for i in range(1, len(sys.argv)):
		if not sys.argv[i] in ideologies:
			ideologies.append(sys.argv[i])
else:
	print("\nUsage:\n\t- Windows: python findthefucker.py 'This is' 'An Example' 'How To' 'Use The' 'Program'\n\t- Linux:   python3 findthefucker.py 'This is' 'An Example' 'How To' 'Use The' 'Program'\n")
	raise SystemExit
print("Okay, I will look for:\n" + '\n'.join(ideologies))
time.sleep(5)
log = []
uuu = open("fault.txt","w")
uuu.close
def getListOfFiles(dirName):
    # create a list of file and sub directories 
    # names in the given directory 
    listOfFile = os.listdir(dirName)
    allFiles = list()
    # Iterate over all the entries
    for entry in listOfFile:
        # Create full path
        fullPath = os.path.join(dirName, entry)
        # If entry is a directory then get the list of files in this directory 
        if os.path.isdir(fullPath):
            allFiles = allFiles + getListOfFiles(fullPath)
        else:
            allFiles.append(fullPath)
                
    return allFiles        

listOfFiles = getListOfFiles(dirName)
for elem in listOfFiles:
	if not elem.endswith(".dds")  and not elem.endswith(".psd") and not elem.endswith(".pdn") and not elem.endswith(".bmp") and not elem.endswith(".tga") and not elem.endswith(".py") and elem != dirName + "\\.scripts\\log.txt" and elem != dirName + "{0}.scripts{0}fault.txt".format(ftf_folder) and not '.git' in elem and not 'z_META' in elem:
		files.append(os.path.join(elem))
print ("****************")
# Get the list of all files in directory tree at given path
listOfFiles = list()
for (dirpath, dirnames, filenames) in os.walk(dirName):
	listOfFiles += [os.path.join(dirpath, file) for file in filenames]
	# Print the files    
for elem in listOfFiles:
	if not elem.endswith(".dds")  and not elem.endswith(".psd") and not elem.endswith(".pdn") and not elem.endswith(".bmp") and not elem.endswith(".tga") and not elem.endswith(".py") and elem != dirName + "\\.scripts\\log.txt" and elem != dirName +  "{0}.scripts{0}fault.txt".format(ftf_folder) and not '.git' in elem and not 'z_META' in elem:
		files.append(os.path.join(elem))
print(files)
i = 0
while i < len(files):
	with open(files[i]) as f:
		try:
			u = f.read()
		except:
			u = f.read().encode("utf-8")
			u = u.decode("utf-8")
		v = u.split("\n")
		for uu in range(0,len(v)):
			y = 0
			if uu <= 0:
				notExist = False
			while y < len(ideologies):
				if not ideologies[y].lower() in v[uu].lower():
					y += 1
				elif ideologies[y].lower() in v[uu].lower():
					notExist = True
					print("ISSUE on line " + str(uu) + ": " + files[i] + " (" + ideologies[y] + ")")
					log.append("ISSUE on line " + str(uu) + ": " + files[i] + " (" + ideologies[y] + ")")
					if os.path.isfile("fault.txt"):
						uuu = open("fault.txt","a")
						uuu.write("\nISSUE on line " + str(uu) + ": " + files[i] + " (" + ideologies[y] + ")")
						uuu.close
					else:
						uuu = open("fault.txt","w")
						uuu.write("ISSUE on line " + str(uu) + ": " + files[i] + " (" + ideologies[y] + ")")
						uuu.close
					y = len(ideologies)
			if y == len(ideologies) and notExist == False:
				if uu == len(v)-1:
					print("Fine: ", files[i])
		f.close()
	i += 1
u = []
if os.path.isfile("fault.txt"):
	with open("fault.txt","r") as f:
		u = f.read().split("\n")
		i = 0
		while i < len(u):
			if not u[i]:
				print(u[i] + " was deleted!")
				del u[i]
			else:
				if not i+1 >= len(u):
					if u[i] == u[i+1]:
						print(u[i] + " is duplicate, deleted")
						del u[i+1]
			i += 1
print('\n'.join(log) + "\n\nAmount of issues: " + str(len(log)))
uuu = open("log.txt","w")
uuu.write('\n'.join(log))
uuu.close()