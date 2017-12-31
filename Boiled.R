# @begin Boiled.R
# @in boiled_v2.0.csv

#boiled=read.csv("boiled2.csv")
boiled=read.csv("boiled_v2.0.csv")
dim(boiled)
#head(boiled$place)
statesname=c("AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY")
statesfullname=c("ALABAMA","ALASKA","ARIZONA","ARKANSAS","CALIFORNIA","COLORADO","CONNECTICUT","DELAWARE","FLORIDA","GEORGIA","HAWAII","IDAHO","ILLINOIS","INDIANA","IOWA","KANSAS","KENTUCKY","LOUISIANA","MAINE","MARYLAND","MASSACHUSETTS","MICHIGAN","MINNESOTA","MISSISSIPPI","MISSOURI","MONTANA","NEBRASKA","NEVADA","NEW HAMPSHIRE","NEW JERSEY","NEW MEXICO","NEW YORK","NORTH CAROLINA","NORTH DAKOTA","OHIO","OKLAHOMA","OREGON","PENNSYLVANIA","RHODE ISLAND","SOUTH CAROLINA","SOUTH DAKOTA","TENNESSEE","TEXAS","UTAH","VERMONT","VIRGINIA","WASHINGTON","WEST VIRGINIA","WISCONSIN","WYOMING")
boiled$states=as.character(boiled$place)
boiled$states[1704:1706]
for (i in 1:length(statesname)){
  boiled$states[grep(statesfullname[i],as.character(boiled$place))]=statesname[i]
}
boiled$states[1704:1706]
for (j in 1:length(statesname)){
  boiled$states[grep(statesname[j],as.character(boiled$states))]=statesname[j]
}
boiled$states[1704:1706]


for (i in 1:length(boiled$states)){
  if (nchar(boiled$states[i])!=2){
    boiled$states[i]=""
  }
}

#summary(boiled$states)
boiled1=boiled[nchar(boiled$states)>0,]

#write.csv(boiled1,file="boiled4.csv")
sort(boiled$states,decreasing = TRUE)
tb=table(boiled$states)
#write.csv(t,file="boiled5.csv")

tb.df=as.data.frame(t)
tb.df
tb.df$log=log10(tb.df$Freq)
newtb=tb.df[-1,]
#write.csv(newtb,file="boiled65.csv")

dim(boiled)
write.csv(boiled,file="boiled21.csv")
