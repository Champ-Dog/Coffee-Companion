No.	Requirement
R1	Answers to all the documentation requirements below.
R2	Your README.md should have a separate heading for each documentation requirement and answers organised under the appropriate headings.

## References
Coffeekaizen.com. n.d. COFFEE KAIZEN. [online] Available at: <http://coffeekaizen.com/calculators/extcalculator/> [Accessed 1 April 2022].

Rubystyle.guide. 2022. The Ruby Style Guide. [online] Available at: <https://rubystyle.guide/> [Accessed 5 April 2022].

## Source Control
This source code for this project is hosted at [GitHub](https://github.com/Champ-Dog/Coffee-Companion).

Should the above link not function, you can manually enter this address:
https://github.com/Champ-Dog/Coffee-Companion

## Code Style
Code for this project should adhere to [The Ruby Style Guide](https://rubystyle.guide/) as much as possible. 

In developing this project I have made use of RuboCop to simplify adherence, as well as referring directly to the material. It has been necessary to violate these conventions in several places for proper code or gem functions.

R6	Develop a list of features that will be included in the application. It must include:
- at least THREE features
- describe each feature

Note: Ensure that your features above allow you to demonstrate your understanding of the following language elements and concepts:
- use of variables and the concept of variable scope
- loops and conditional control structures
- error handling

## Features
The Coffee Companion is a quality assurance tool for baristas and cafe owners/managers. It allows information about coffees to be stored, searched, edited, summarised, and exported.

### Save
The Coffee Companion is primarily a tool to store information about coffees. Users 'create' a new entry with the origin and name of a particular bean. Additional information can then be attached to that entry to store recipes and cupping notes. This information is stored between sessions in a seperate file.

**Technical**: A custom Coffee class has been created to contain information about particular coffees. Each coffee stored in the app is a new Coffee class instance. This class has attributes to store origin, name, and cupping notes (as highlight, minimise, and tactile). 


A Recipes module is included with the Coffee to add a recipes attribute, where seperate recipes can be stored as arrays. This has been seperated from the Coffee class for both conceptual and functional reasons. Conceptually, a brewing recipe is not an inherent attribute of a given coffee, unlike it's origin, name, flavour, and mouthfeel. Functionally, recipes need to be handled differently to other attributes.

A given Coffee object is intended to hold several recipes, which need to be kept separate. A collection of flavour descriAdditionally, the ordering of a given recipe also needs to be preserved, both to comply with coffee industry convention of describing a recipe as Dose, Yield, Time, TDS, EXT; and to successfully summarise the range of values across each stored recipe.

### Search
The Coffee Companion allows users to search against stored coffees by either name (for a specific coffee) or origin (to show all coffees from a region).

### Edit
User can edit or remove stored information about a coffee, or remove a coffee entirely if it is no longer relevant.

### Summarise
The Coffee Companion will summarise key information about a coffee, for quick reference or reporting. Summaries will show the recipe range for a coffee, along with stored flavour descriptors, in an easy to read format.

### Export
The Coffee Companion includes an export feature, allowing summaries of selected coffees to be saved in .txt format. This allows for easier reporting between staff, stores, roasters, or other stakeholders.

R7	
Develop an implementation plan which:
- outlines how each feature will be implemented and a checklist of tasks for each feature
- prioritise the implementation of different features, or checklist items within a feature
- provide a deadline, duration or other time indicator for each feature or checklist/checklist-item

Utilise a suitable project management platform to track this implementation plan.

Provide screenshots/images and/or a reference to an accessible project management platform used to track this implementation plan. 

## Implementation



> Your checklists for each feature should have at least 5 items.

R8	
Design help documentation which includes a set of instructions which accurately describe how to use and install the application.

You must include:
- steps to install the application
- any dependencies required by the application to operate
- any system/hardware requirements
- how to use any command line arguments made for the application



# Coffee-Companion

This repository houses the source code for the Coffee Companion app.
This app is being developed as a Terminal Application assessment.
The function of the app is to record and output information about the performance of a coffee over time; aimed primarily at a head barista or manager.

## Dependencies

- rspec