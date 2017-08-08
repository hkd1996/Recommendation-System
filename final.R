library(plyr)
library(readr)
library(lsa)
input <- read.csv("/home/secret95/Desktop/RS/2.csv")
colnames(input)<-c("uid","bid","rating")
u<-unique(input$uid)
uno<-1:length(u)
b<-unique(input$bid)
r<-unique(input$rating)
dm<-array(data=input$rating,c(length(u),length(b)))
id<-readline(prompt = "Enter userid")
200
userid<-as.integer(id)
x<-dm[userid,]
cs=c()
#y<-dm[-userid,]
for(i in 1:length(u)){
  if(userid!=i){
    y<-dm[i,]
    cs[i]<-cosine(x,y)
  }
  else
    cs[i]=0
  }
csm<-array(data=cs,c(1,length(u)))  
maxc<-which.max(csm)
maxc.row<-dm[maxc,]
sum=0
val=0
index=c()
rec.index=c() #index of book that needs to be recommended 
for(i in 1:5){
  v<-which.max(maxc.row)
  rec.index[i]<-v+sum
  sum=sum+rec.index[i]
  val<-rec.index[i]
  m<-length(maxc.row)
  val=val+1
  maxc.row2<-maxc.row[val:length(maxc.row)]
  maxc.row<-maxc.row2
  val=val-1
}

rec.index
  

  
  

  

