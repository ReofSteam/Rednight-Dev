#!/usr/bin/python

import os
import sys
import readline
import glob
import re

"""
The below is altered from https://gist.github.com/iamatypeofwalrus/5637895
"""
class tabCompleter(object):
	def get_path(self, prompt):
		readline_setup = 0
		if not readline_setup:
			readline.set_completer_delims('\t')
			readline.parse_and_bind("tab: complete")
			readline.set_completer(self.pathCompleter)
			readline_setup = 1

		return raw_input(str(prompt))

	def pathCompleter(self, text, state):
		""" 
		This is the tab completer for systems paths.
		Only tested on *nix systems
		"""
		line = readline.get_line_buffer().split()
		
		# replace ~ with the user's home dir. See https://docs.python.org/2/library/os.path.html
		if '~' in text:	
			text = os.path.expanduser('~')

		# autocomplete directories with having a trailing slash
		if os.path.isdir(text):
			text += '/'

		return [x for x in glob.glob(text + '*')][state]
	
''' Begin 'original' code '''



''' Main '''
#User Input
t = tabCompleter()

mod_path = t.get_path("Enter the mod path: ")
common_countries_path = os.path.join(mod_path, "common", "countries")
country_tags_path = os,path.join(mod_path, "common", "country_tags")

if not os.path.isdir(str(mod_path)):
	print "Path " + str(mod_path) + " does not exist.\nTerminating."
	sys.exit(1)
print "Interpreted as: " + str(mod_path)

if not os.path.isdir(str(common_countries_path)):
	print "Path " + os.path.normpath("common/countries/") + " from Mod path could not be found.\nTerminating."
	sys.exit(1)
print str(common_countries_path)

#Construct Taglist


#Do thing
dirs = os.listdir(common_countries_path)

for file in dirs:
	print file
