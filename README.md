# Drugs Review dataset Data Analysis and ML Project
A project for a University class, meant for personal use. Written in R for the purpouses of the class. Uses the Drugs Review dataset and perform data cleaning, exploration and apply unsupervised learning and supervised learning techniques to the dataset.
  
## Files required:
```processed/drug_review_cleaned.csv```  
  
Get this by running dataset-cleaning.R

---  

## Order of files:
1. ```dependencies.R```
2. ```exploratory-analysis.R```
3. ```dataset-cleaning.R```
4. ```text_clustering.Rmd```

## File descriptions 
```dependencies.R```  
Contains some of the libraries required for the project.
I might have forgotten some, due to creating this file after the project was already started.

```exploratory-analysis.R```  
Contains some of the exploratory analysis done on the dataset.  
**TODO**: 
* Add more visualization and analysis.

```dataset-cleaning.R```  
Contains the code for cleaning the dataset. The cleaned dataset is saved in the processed folder. Make sure to create a processed folder
in the root of the project.

```text_clustering.rmd```  
Contains the code for the text clustering part of the project. 
The code is written in RMarkdown, so it can be run in RStudio.  
**TODO**: 
* Might move text preprocessing out of file to prevent redundancy in future unsupervised and supervised learning files.*
