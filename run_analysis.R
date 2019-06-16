library(dplyr)

# Load Dataset into R

        # Load the subject dataset
        subj_test <- read.table("test\\subject_test.txt")
        subj_train <- read.table("train\\subject_train.txt" )
        
        # Load X datatset
        X_test <- read.table("test\\X_test.txt" )
        X_train <- read.table("train\\X_train.txt" )
        
        #Load Y dataset
        Y_test <- read.table("test\\Y_test.txt" )
        Y_train <- read.table("train\\Y_train.txt" )
        
        # Load features for dataset X
        features <- read.table("features.txt" )
        
        #Load Activities
        activities <- read.table("activity_labels.txt" )

# Merge Datasets
        
        #Merge X,Y,Subject
        subject <- rbind(subj_test,subj_train)
        X_ds <- rbind(X_test,X_train)
        Y_ds <- rbind(Y_test, Y_train )
        colnames(X_ds) <- features[,2]
        colnames(Y_ds) <- "Activity"
        colnames(subject) <- "Subject"
        
       
        # Create combined dataset
        Activity <- activities[match(Y_ds[,1],activities[,1]),2]
        
        Final_ds <- cbind(subject, Activity,X_ds)
        
        # Create means subset 
        #subset <- X_ds[,1:2]
        #subset2 <- X_ds[,which(grepl("mean()|std()",names(X_ds)))]
        Means_ds <- cbind(Final_ds[,1:2],Final_ds[,which(grepl("mean()|std()",names(Final_ds)))])
        
# Create Tidy DS
        write.table(X_ds,"Activity_Recog_Tidy_DS.txt",row.names = FALSE, col.names = TRUE)
        write.table(Means_ds,"Means_and_std_Tidy_DS.txt",row.names = FALSE, col.names = TRUE)
        
        Means_ds$key <- paste(Means_ds$Subject,Means_ds$Activity)
       
        
        finalDs = Means_ds %>% group_by(key) %>% summarize_all(list(mean))
        write.table(finalDs,"Tidy_DS.txt",row.names = FALSE, col.names = TRUE)
        
# Test
        if (nrow(finalDs == 180)) {
                print("Test Successful")
        }
        
        