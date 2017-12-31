boiled=read.csv("boiled2.csv")
head(boiled$place)
statesname=c("AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY")
boiled$states=as.character(boiled$place)

for (i in 1:length(statesname)){
  boiled$states[grep(statesname[i],as.character(boiled$place))]=statesname[i]
}

for (i in 1:length(boiled$states)){
  if (nchar(boiled$states[i])!=2){
    boiled$states[i]=""
  }
}

summary(boiled$states)
boiled$states
boiled1=boiled[nchar(boiled$states)>0,]

write.csv(boiled1,file="boiled4.csv")
sort(boiled$states,decreasing = TRUE)
t=table(boiled$states)
write.csv(t,file="boiled5.csv")

t.df=as.data.frame(t)
t.df
t.df$log=log10(t.df$Freq)
write.csv(t.df,file="boiled6.csv")
