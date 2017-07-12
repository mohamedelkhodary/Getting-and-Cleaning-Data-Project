library(dplyr)
library(tidyr)
library(stringr)

setwd("E:/M7md/Coursera/Projects/Getting and Cleaning Data/Project/Getting-and-Cleaning-Data-Project")

################################################################
seq128 <- 1:128

activity_labels <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

features <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

################################################################

X_train <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
names(X_train) <- features$V2

mean <- grepl("mean", names(X_train))
std <- grepl("std", names(X_train))
X_train <- X_train[,(mean | std)]


X_test <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")

meanT <- grep("mean", names(X_train))
stdT <- grep("std", names(X_train))
X_test <- X_test[,sort(c(meanT, stdT))]


###############################################################

body_acc_x_train <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
names(body_acc_x_train) <- paste("body_acc_x", seq128)

body_acc_y_train <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
names(body_acc_y_train) <- paste("body_acc_y", seq128)

body_acc_z_train <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
names(body_acc_z_train) <- paste("body_acc_z", seq128)

####

body_gyro_x_train <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
names(body_gyro_x_train) <- paste("body_gyro_x", seq128)

body_gyro_y_train <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
names(body_gyro_y_train) <- paste("body_gyro_y", seq128)

body_gyro_z_train <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
names(body_gyro_z_train) <- paste("body_gyro_z", seq128)

####

total_acc_x_train <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
names(total_acc_x_train) <- paste("total_acc_x", seq128)

total_acc_y_train <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
names(total_acc_y_train) <- paste("total_acc_y", seq128)

total_acc_z_train <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")
names(total_acc_z_train) <- paste("total_acc_z", seq128)

####################################

body_acc_x_test <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")

####

body_gyro_x_test <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")

####

total_acc_x_test <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

###############################################################

y_train <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
names(y_train) <- "Activity"

y_test <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")

####

Activity <- sapply(y_train$Activity, function(x){
  if(x == 1){ x = "WALKING"}
  else if(x == 2){ x = "WALKING_UPSTAIRS"}
  else if(x == 3){ x = "WALKING_DOWNSTAIRS"}
  else if(x == 4){ x = "SITTING"}
  else if(x == 5){ x = "STANDING"}
  else{ x = "LAYING"}
  x
})

y_train <- as.data.frame(Activity)



mtest <- sapply(y_test$V1, function(x){
  if(x == 1){ x = "WALKING"}
  else if(x == 2){ x = "WALKING_UPSTAIRS"}
  else if(x == 3){ x = "WALKING_DOWNSTAIRS"}
  else if(x == 4){ x = "SITTING"}
  else if(x == 5){ x = "STANDING"}
  else{ x = "LAYING"}
  x
})

y_test <- as.data.frame(mtest)

##############################################################

subject_train <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- "Subjects"

subject_test <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")


##############################################################
##############################################################

train <- bind_cols(X_train, body_acc_x_train, body_acc_y_train, body_acc_z_train,
                   body_gyro_x_train, body_gyro_y_train, body_gyro_z_train,
                   total_acc_x_train, total_acc_y_train, total_acc_z_train,
                   y_train, subject_train)

##############################################################

test <- bind_cols(X_test, body_acc_x_test, body_acc_y_test, body_acc_z_test,
                   body_gyro_x_test, body_gyro_y_test, body_gyro_z_test,
                   total_acc_x_test, total_acc_y_test, total_acc_z_test,
                   y_test, subject_test)

##############################################################

tidy <- bind_rows(train, test)
tidy <- tidy[, 1:length(test)]

##############################################################

gtidy <- group_by(tidy, Subjects, Activity)

av <- gtidy %>% summarize(M = mean(as.numeric(as.vector(gtidy[[1]])), na.rm = TRUE)) %>%
  select(Subjects, Activity)

i <- 1
while(i <= 1231){
  x <- summarize(gtidy, M = mean(as.numeric(as.vector(gtidy[[i]])), na.rm = TRUE))
  av <- data.frame( av, x$M )
  i <- i + 1
}

names <- names(select(tidy, -c(Subjects, Activity)))
names <- paste("Average", names)
names <- c("Subject", "Activity", names)
names(av) <- names

write.table(av, "Tidy Average.txt", row.names = FALSE)

################################################################

