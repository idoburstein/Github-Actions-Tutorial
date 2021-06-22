# Github Actions Tutorial - Python :snake:

[![GitHub-Actions-Demo Actions Status](https://github.com/idoburstein/tryout/workflows/All/badge.svg)](https://github.com/idoburstein/tryout/actions)

* Server Environment, Version and Included Software are under "Set up job" 
action -> "Virtual Environment"

## Template
### yml file
* The all.yml includes all functionalities discussed here 
https://github.com/idoburstein/tryout/blob/testbranch/.github/workflows/all.yml 
* Feel free to copy it to your project!
* The file contains a pipeline that checks Style, Unit-Tests, Line Coverage 
and Branch Coverage.
### makefile
* The makefile helps you test your code locally before pushing to github.
* Feel free to copy it to your project!
* Find it here https://github.com/idoburstein/tryout/blob/testbranch/makefile
* **Changing the Coverage Threshold:** If you change the coverage threshold 
make sure to change it in the makefile as well on lines 63, 65, 76, 78
(`coverage report --fail-under=70 **/*.py`)

## Test Your Code Locally And Save Time :hugs:
### Test All (Style, Unit Tests and Coverage)
* Type in the command line `make test_all`
### Test Style
* Type in the command line `make style`
### Test Your Unit Tests
* Type in the command line `make test`
### Test Cove Coverage
* Type in the command line `make coverage` 

## Understand The Process - Learn How To:
* Set up a basic actions file
* Add a python style checker - Pylint - Most common and catches some errors that Flake8 doesn't - like missing docstrings.
* Add a python style checker - Flake8 - Checks the code against PEP8 coding style.
* Execute the unit_test file when you push to github using Unittest.
* Execute the unit_test file using pytest library when you push to github.
* Add Code Coverage evaluation and threshold using Coverage.py.
* Include a "passing" badge in your README.md file when you push to github.

## Style - Pylint :clap:
* **Pylint** checks against PEP8 coding style and throws errors for missing docstrings, trailing spaces etc.
* To inlude Pylint Style Checker, please check (and feel free to copy) my all.yml file, 
Can be found here https://github.com/idoburstein/tryout/blob/testbranch/.github/workflows/all.yml
Check the comments in the file to find the exact lines for Pylint.

## Style - Flake8 :thumbsup:
* **Flake8** checks against PEP8 coding style. However, 
it does not throw errors for missing docstrings.
* To inlude Flake8 Style Checker, please see (and feel free to copy) my style.yml file, 
Can be found here https://github.com/idoburstein/tryout/blob/testbranch/.github/workflows/all.yml
Check the comments in the file to find the exact lines for Flake8.

## Unit Tests - Basic Approach (using Unittest) :raised_hands:
* Every python project should include a unit tests file (or files) to test the written code.
* To run your unit test files using github actions, feel free to copy my code from unit_tests.yml
Can be found https://github.com/idoburstein/tryout/blob/testbranch/.github/workflows/all.yml
Check the comments on the file to find the exact lines for running your unit tests files.

## Unit Tests - Using Pytest :handshake:
* If you use the **pytest** library to test your project, I would highly advocate for this approach as you 
don't need to include the path for your unit test files. Pytest does the look up for you!
* To run your unit test files using github actions, feel free to copy my code from unit_tests.yml
Can be found here https://github.com/idoburstein/tryout/blob/testbranch/.github/workflows/all.yml
Check the comments in the file to find the exact lines for running your unit tests files using pytest.

## Code Coverage :writing_hand:
* Code Coverage calculates and checks if your line coverage and branch coverage pass some threshold.
* Can be found here https://github.com/idoburstein/tryout/blob/testbranch/.github/workflows/all.yml.
Check the comments in the file to find the exact lines for running your coverage analysis.
* Currently the thresholds are 70% for both line and branch coverage. Feel Free to change them in your yml file!
* In order to change it, change the 70 to your own required threshold on this line 
`coverage report --fail-under=70 **/*.py`  

## Github Badges :rocket:
* **Github Badges** are a cool way for you and other people to see if your 
actions have passed/failed. 
* To include Badges in your README.md file, include this line:
`[![Basic Actions Status](https://github.com/{your_user_name}/{name_of_project}/workflows/{yml_file_name}/badge.svg)]
(https://github.com/{your_user_name}/{name_of_project}/actions)`
* your_user_name = your Github user name (for this project it would be 
idoburstein)
* name_of_project = The name of the project (for this project it would be 
tryout)
* yml_file_name = The name in the yml file to take the outcomes from (for a 
unit-test badge it would be Unit-Test)
* **Many people make this mistake**, the yml_file_name is not unit_tests! 
It is the value of the variable name in the yml file