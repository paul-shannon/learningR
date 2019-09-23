df1<- data.frame(
  letterGroups= c('aaa','bbb','ccc')
  ,columnName1=c(3,1,4)
)
print(df1)

df2<- data.frame(
  letterGroups= c('aaa','ccc','eee')
  ,columnName2=c(2,1,7)
)
print(df2)

df3<- merge(df1,df2, by=c('letterGroups'))  #we are joining on this same field/column that is in common (we can choose multiple that are in common)
#took the things they had in common and put in all of the information we get from the specified data frames about those letter groups-- we ignore letter groups that they don't have in common
print(df3)

df4<- merge(df1,df2, by=c('letterGroups'), all.x=TRUE)  #keeps everything from the first data frame even if the second data frame has no data on it
print(df4)

df5<- merge(df1,df2, by=c('letterGroups'), all=TRUE)  #keeps everything from both data frames
print(df5)
