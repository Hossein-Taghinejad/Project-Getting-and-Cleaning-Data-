subject_test=read.table("subject_test.txt")
X_test=read.table("X_test.txt")
y_test=read.table("y_test.txt")
features=read.table("features.txt")
colnames(X_test)=features$V2
colnames(subject_test)="Subject"
colnames(y_test)="Labels"
main.test=cbind(y_test,X_test)
main.test=cbind(subject_test,main.test)
#-------------------------------------------------
subject_train=read.table("subject_train.txt")
X_train=read.table("X_train.txt")
y_train=read.table("y_train.txt")
colnames(X_train)=features$V2
colnames(subject_train)="Subject"
colnames(y_train)="Labels"
main.train=cbind(y_train,X_train)
main.train=cbind(subject_train,main.train)
#------------------------------------------------------
main=rbind(main.test,main.train)
main=main[,c(1,2,union(grep("mean",colnames(main)),grep("std",colnames(main))))]
cnames=colnames(main)
cnames=gsub("-",".",cnames)
colnames(main)=cnames
#----------------------------------------------------
library(plyr)
result=ddply(main,.(Subject,Labels),sapply,mean)
label=rep(c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRs","SITTING","STANDING","LAYING"),30)
result$Labels=label
#--------------------------------------------------------
write.table(result,file="result.txt",col.names = T)


