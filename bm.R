getwd()
boiled21=read.csv("boiled21.csv")
boiled21
dim(boiled21)
mashed21=read.csv("mashed21.csv")
bm=rbind(boiled21,mashed21)
dim(bm)
head(bm)
write.csv(bm,file="bm.csv")
colnames(bm)
bm1=data.frame(bm$Dish_name,bm$price,bm$date)
dim(bm1)
write.csv(bm1,file="bm1.csv")
bm2=na.omit(bm1)
dim(bm2)
write.csv(bm2,file="bm2.csv")

head(bm)
bm$event=as.character(bm$event)
bm$event1=bm$event

bm$event1[grep("DIN",bm$event)]="DINNER"
bm$event1[grep("BREAKFAST",bm$event)]="BREAKFAST"
bm$event1[grep("LUN",bm$event)]="LUNCH"

for (i in 1:length(bm$event1)){
  if (nchar(bm$event1[i])>0){
    if (bm$event1[i]!="DINNER"&bm$event1[i]!="BREAKFAST"&bm$event1[i]!="LUNCH"){
      bm$event1[i]="DAILY"
    }
  }
  else{bm$event1[i]="UNKNOWN"}
  
}
bm$event1
summary(as.factor(bm$event1))

bm$physical_description1=as.character(bm$physical_description)
bm$physical_description1[grep("CARD",bm$physical_description)]="CARD"
bm$physical_description1[grep("FOL",bm$physical_description)]="FOLDER"
bm$physical_description1[grep("BROAD",bm$physical_description)]="BROADSHEET"
bm$physical_description1[grep("BOOKLET",bm$physical_description)]="BOOKLET"
for (i in 1:length(bm$physical_description1)){
  if (nchar(bm$physical_description1[i])>0){
    if (bm$physical_description1[i]!="CARD"&bm$physical_description1[i]!="FOLDER"&bm$physical_description1[i]!="BROADSHEET"&bm$physical_description1[i]!="BOOKLET"){
      bm$physical_description1[i]="OTHER"
    }
  }
  else{bm$physical_description1[i]="UNKNOWN"}
}

summary(as.factor(bm$physical_description1))

bm$physical_description2=as.character(bm$physical_description)
bm$physical_description2[grep("\\d+\\.*\\d*\\s*[xX]\\s*\\d+\\.*\\d*",bm$physical_description)]
bm$physical_description2

pd=strsplit(bm$physical_description2,";")
got=rep("",length(pd))
for (i in 1:length(pd)){
  if (length(pd[[i]])>0){
  #  print (i)
    #got[i]=grep("\\d+\\.*\\d*\\s*[xX]\\s*\\d+\\.*\\d*",pd[[i]])
  #}
  if (length(grep("\\d+\\.*\\d*\\s*[xX]\\s*\\d+\\.*\\d*",pd[[i]]))>0){
    got[i]=grep("\\d+\\.*\\d*\\s*[xX]\\s*\\d+\\.*\\d*",pd[[i]])
  }
  }
}
got
bm$physical_description2=""
for (i in 1:length(got)){
  print(i)
  bm$physical_description2[i]=pd[[i]][got]
}

for (i in 1:length(pd)){
  if (length(pd[[i]])>0){
    print(i)
    bm$physical_description2[i]=pd[[i]][as.numeric(got[i])]
  }
}
bm$physical_description2

newdf=data.frame(bm$Dish_name,bm$price,bm$event1,bm$physical_description1,bm$states)
dim(newdf)
summary(newdf1$bm.event1)


newdf1=newdf[nchar(as.character(newdf$bm.states))>0,]
dim(newdf1)
summary(newdf1$bm.price)
newdf2=na.omit(newdf1)
dim(newdf2)
set.seed(0)
a=sample(462,100)
summary(newdf1$bm.event1)
summary(newdf$bm.physical_description1)
test=newdf2[a,]
train=newdf2[-a,]


write.csv(train,file="bmtrain.csv")
write.csv(test,file="bmtest.csv")
