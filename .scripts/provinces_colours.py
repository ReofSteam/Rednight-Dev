import sys
import os
import random
m = -1
if len(sys.argv) > 1:
	if sys.argv[1].isdigit():
		m = int(sys.argv[1])
	else:
		print(sys.argv[1])
else:
	print(sys.argv)
try:
	if os.path.isfile("colors_that_dont_exist.txt"):
		o = open("colors_that_dont_exist.txt", "w")
		o.write("")
		o.close()

	path = os.getcwd()

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
	        	if not fullPath in ' '.join(allFiles):
	        		allFiles.append(fullPath)
	                
	    return allFiles 

	while not "definition.csv" in path:
		f = getListOfFiles(path)
		#print(len(f))
		for i in range(len(f)):
			if "definition.csv" in f[i]:
				path = f[i]
				print("Path set to: " + path)
				break
			else:
				print(f[i])
			if i == len(f)-1:
				p = path.split("\\")
				if len(p) > 0:
					del p[len(p)-1]
					path = '\\'.join(p)
					print("Path moved to: " + path)
				else:
					print("tbh, I dunno even know")
	with open(path, "r") as provinces:
		l = provinces.read().split("\n")
		province_id = []
		new_provinces = []
		for i in range(len(l)):
			l[i] = ";" + ';'.join(l[i].split(";")[1:4]) + ";" 
			province_id.append(l[i])
		if m == -1:
			for r in range(0,256, random.randint(1,5)):
				for g in range(40,256, random.randint(1,5)):
					for b in range(0, 256, random.randint(1,5)):
						if not m == -1:
							if len(new_provinces) > m:
								sys.exit()
						if not ";" + str(r) + ";" + str(g) + ";" + str(b) + ";" in ' || '.join(province_id):
							if not os.path.isfile("colors_that_dont_exist.txt"):
								new_provinces.append(";" + str(r) + ";" + str(g) + ";" + str(b) + ";")
								o = open("colors_that_dont_exist.txt", "w")
								o.write(";" + str(r) + ";" + str(g) + ";" + str(b) + ";" + "\n")
								o.close()
								print(str(r) + ", " + str(g) + ", " + str(b) + ": NEW COLOR FOUND! (Total: " + str(len(new_provinces)) + ")")
							elif os.path.isfile("colors_that_dont_exist.txt"):
								new_provinces.append(";" + str(r) + ";" + str(g) + ";" + str(b) + ";")
								o = open("colors_that_dont_exist.txt", "a")
								o.write(";" + str(r) + ";" + str(g) + ";" + str(b) + ";" + "\n")
								o.close()
								print(str(r) + ", " + str(g) + ", " + str(b) + ": NEW COLOR FOUND! (Total: " + str(len(new_provinces)) + ")")
							
						else:
							print("\n\n" + str(r) + ", " + str(g) + ", " + str(b) + ": already exists\n\n")
		else:
			for n in range(m):
				b = random.randint(1,255)
				g = random.randint(1,255)
				r = random.randint(1,255)
				if not ";" + str(r) + ";" + str(g) + ";" + str(b) + ";" in ' || '.join(province_id):
					if not os.path.isfile("colors_that_dont_exist.txt"):
						new_provinces.append(";" + str(r) + ";" + str(g) + ";" + str(b) + ";")
						o = open("colors_that_dont_exist.txt", "w")
						o.write(";" + str(r) + ";" + str(g) + ";" + str(b) + ";" + "\n")
						o.close()
						print(str(r) + ", " + str(g) + ", " + str(b) + ": NEW COLOR FOUND! (Total: " + str(len(new_provinces)) + ")")
					elif os.path.isfile("colors_that_dont_exist.txt"):
						new_provinces.append(";" + str(r) + ";" + str(g) + ";" + str(b) + ";")
						o = open("colors_that_dont_exist.txt", "a")
						o.write(";" + str(r) + ";" + str(g) + ";" + str(b) + ";" + "\n")
						o.close()
						print(str(r) + ", " + str(g) + ", " + str(b) + ": NEW COLOR FOUND! (Total: " + str(len(new_provinces)) + ")")	
					else:
						print("\n\n" + str(r) + ", " + str(g) + ", " + str(b) + ": already exists\n\n")
					
		if len(new_provinces) > 0:
			print("Amount of new provinces that can be created: " + str(len(new_provinces)))
except FileNotFoundError:
	print("\"definition.csv\" not found")
	sys.exit()