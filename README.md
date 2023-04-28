# RateMyProfessors_SJSU
## Introduction
Having graduated in SJSU College of Science, Mathematics Department, I looked back and wished I had more information about the professors in my department prior to the beginning of classes to help select what classes and build more targeted faculty relationships. As I began to approach this question, I decided that exploring student experience was the best place to begin. 
## Process
1. I extracted data, from RateMyProfessors website, 3000 professors' ratings in SJSU using the selenium library into a CSV file
2. Using PostgreSQL, I created a database to store the data and cleaned it by changing datatypes, trimming, updating table to add in column, grouping by college. 
3. Using Tableau, I analyzed the interdepertmental ratings within the college of Science focused mostly on difficulty and quality features. I also created an interactive dashboard of quality vs difficulty featuring all college of Science professors. Finally, I analyzed average ratings across colleges. 
## Next Steps
The next step is to create a more robust database that has more information about professors; for example: what kind of research have they worked on or currently working on, what is their field of expertise. Additionally, create a fully automated pipeline to update the data.
## Goal
To help a student make an informed decision in their choice of what professors/department to work with. 
