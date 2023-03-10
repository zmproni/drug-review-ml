# Drugs Review dataset Data Analysis and ML Project
A project for a University class, meant for personal use. Written in R for the purpouses of the class. Uses the Drugs Review dataset and perform data cleaning, exploration and apply unsupervised learning and supervised learning techniques to the dataset. The project is not actively being worked on anymore. 
  
## Files required:
---

```processed/drug_review_cleaned.csv```  
Get this by running dataset-cleaning.R  

---

```processed/sparse_matrix.rds```  
Get this by running text-preprocessing.rmd  

---  

## Order of files:
1. ```dependencies.R```
2. ```cleaning-exploration.R```
3. ```sentiment-analysis/lexicon/sentiment-extraction-vader.R```  
4. ```texpt-preprocessing.rmd```
5. ```text_clustering/*.rmd```
6. ```sentiment-analysis/*.rmd```

## File descriptions 
```dependencies.R```  
Contains some of the libraries required for the project.
I might have forgotten some, due to creating this file after the project was already started.

```cleaning-exploration.R```  
Contains some of the exploratory analysis done on the dataset.  
**TODO**: 
* Add more visualization and analysis.
Contains the code for cleaning the dataset. The cleaned dataset is saved in the processed folder. Make sure to create a processed folder
in the root of the project.

```dataset-cleaning.R```  

```text_clustering.rmd```  
Contains the code for the text clustering part of the project. 
The code is written in RMarkdown, so it can be run in RStudio.  
**TODO**: 
* Might move text preprocessing out of file to prevent redundancy in future unsupervised and supervised learning files.*
