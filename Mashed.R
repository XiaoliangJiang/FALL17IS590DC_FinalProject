#mashed=read.csv("mashed2.csv")
mashed=read.csv("mashed_v2.0.csv")
dim(mashed)
#head(mashed$place)
statesname=c("AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY")
statesfullname=c("ALABAMA","ALASKA","ARIZONA","ARKANSAS","CALIFORNIA","COLORADO","CONNECTICUT","DELAWARE","FLORIDA","GEORGIA","HAWAII","IDAHO","ILLINOIS","INDIANA","IOWA","KANSAS","KENTUCKY","LOUISIANA","MAINE","MARYLAND","MASSACHUSETTS","MICHIGAN","MINNESOTA","MISSISSIPPI","MISSOURI","MONTANA","NEBRASKA","NEVADA","NEW HAMPSHIRE","NEW JERSEY","NEW MEXICO","NEW YORK","NORTH CAROLINA","NORTH DAKOTA","OHIO","OKLAHOMA","OREGON","PENNSYLVANIA","RHODE ISLAND","SOUTH CAROLINA","SOUTH DAKOTA","TENNESSEE","TEXAS","UTAH","VERMONT","VIRGINIA","WASHINGTON","WEST VIRGINIA","WISCONSIN","WYOMING")
mashed$states=as.character(mashed$place)

for (i in 1:length(statesname)){
  mashed$states[grep(statesfullname[i],as.character(mashed$place))]=statesname[i]
}

for (j in 1:length(statesname)){
  mashed$states[grep(statesname[j],as.character(mashed$states))]=statesname[j]
}



for (i in 1:length(mashed$states)){
  if (nchar(mashed$states[i])!=2){
    mashed$states[i]=""
  }
}

#summary(mashed$states)

mashed1=mashed[nchar(mashed$states)>0,]

#write.csv(mashed1,file="mashed4.csv")
sort(mashed$states,decreasing = TRUE)
tm=table(mashed$states)
#write.csv(t,file="mashed5.csv")

tm.df=as.data.frame(tm)
tm.df
tm.df$log=log10(tm.df$Freq)
newtm=tm.df[-1,]
#write.csv(newtm,file="mashed65.csv")

write.csv(mashed,file="mashed21.csv")
