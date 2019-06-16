# Code Book
## This is the codebook for Tidy Dataset Assignment for the Course - Getting & Cleaning data. 

### The code contains the following sections. 
* Loading dataset - Code uploaded the data from the working Directory
* Merge Dataset - Merges the Test & Training dataset
* Create Tidy Dataset - Uses the required logic to merge the data sets. 
* Test - Unit test to confirm the code worked as expected

### Following are the main variable used
* X_test/X_train - Data set loaded into these variables
* Y_test/Y_train - Data set loaded into these variables
* subject_test/subject_train - Data set loaded into these variables
* features - Data set loaded into these variables
* Activities - Data set loaded into these variables


* X_ds - variables to save merged data
* Y_ds - variables to save merged data
* subject_ds - variables to save merged data
* Activity - Variable to store Activity Labels for the Y_ds data
* Final_ds - Combines the whole dataset to give tidy dataset. 
* Means_ds - Subjects the Final_ds to get only mean and std
* finalDs - Aggregated the Means_ds
