#                          Make File
#                  Automate Your Local Testing

# Signifies our desired python version
# Makefile macros (or variables) are defined a little bit differently than 
# traditional bash, keep in mind that in the Makefile there's top-level 
# Makefile-only syntax, and everything else is bash script syntax.
PYTHON = python3

# .PHONY defines parts of the makefile that are not dependant on any specific file
# This is most often used to store functions
.PHONY = help setup test run clean

# Defining an array variable
FILES = input output

# Defines the default target that `make` will to try to make, or in the case of 
# a phony target, execute the specified commands
# This target is executed whenever we just type `make`
.DEFAULT_GOAL = help

# The @ makes sure that the command itself isn't echoed in the terminal
help:
	@echo "---------------HELP-----------------"
	@echo "To setup the project type make setup"
	@echo "To test all (style, unit-tests and coverage) type make test_all"
	@echo "To check style using flake8 type make style_f"
	@echo "To check style using Pylint type make style_p"
	@echo "To test the project type make test"
	@echo "To test the coverage threshold type make coverage"
	@echo "To run the project type make run"
	@echo "------------------------------------"

# This generates the desired project file structure
# A very important thing to note is that macros (or makefile variables) are referenced 
# in the target's code with a single dollar sign ${}, but all script variables are referenced with two dollar signs $${}
setup:
	
	@echo "Checking if project files are generated..."
	[ -d project_files.project ] || (echo "No directory found, generating..." && mkdir project_files.project)
	for FILE in ${FILES}; do \
		touch "project_files.project/$${FILE}.txt"; \
	done

# The ${} notation is specific to the make syntax and is very similar to bash's $() 
# This function uses pytest to test our source files
test:
	pip install pytest
	${PYTHON} -m pytest

style_f: 
	pip install flake8
	flake8 .

style_p:
	pip install pylint
	find . -type f -name "*.py" | xargs pylint
	
coverage:
	pip install pytest
	pip install coverage
	coverage run -m pytest
	coverage report --fail-under=70 **/*.py
	coverage run --branch -m pytest
	coverage report --fail-under=70 **/*.py

test_all:
	pip install flake8
	flake8 .
	pip install pylint
	find . -type f -name "*.py" | xargs pylint
	pip install pytest
	${PYTHON} -m pytest
	pip install coverage
	coverage run -m pytest
	coverage report --fail-under=70 **/*.py
	coverage run --branch -m pytest
	coverage report --fail-under=70 **/*.py

#run:
#	${PYTHON} our_app.py

# In this context, the *.project pattern means "anything that has the .project extension"
clean:
	rm -r *.project