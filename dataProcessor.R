#frameData: data should be convert
#choosenCols: a vector to pass in which cols should be convert 
#multiplier: a vector of numeric to pass in 
#the length of choosenCols must equals to the length of multiplier.
convertUnitByRow <- function(frameData , choosenCols , multiplier){
  tempData = frameData
  for (i in 1:length(choosenCols)) {
  tempData[,choosenCols[i]] = tempData[,choosenCols[i]] * multiplier[i] 
  }
  return(tempData)
}


#########number of scenario (customize)!!!!!! #########
nS = 3 
#######################################################

inputFile = read.csv(file = "AndrewFP_32ONU_extra_OLT_with_1030.txt", header = T , sep = "," ,stringsAsFactors = F) 
inputFile = as.data.frame(inputFile)
inputFile = inputFile[,c(-1)]
nRows = nrow(inputFile)
nCols = ncol(inputFile)
colsPerS = nCols / nS  

##processing the data cols by cols for each scenario###
result =NULL
rowNames = NULL
for (i in 1:nS) {
  rowData = NULL
  for (j in seq(from = i , to = nCols , by = nS) ) {
    temp = mean( as.double(inputFile[,j]) , na.rm = T)
    rowData = c(rowData , temp)
  }
  result = rbind(result , rowData)
  rowNames = c(rowNames , paste(as.character(10 * i),"p"))
}
rownames(result) <- rowNames

###multiplier vector(customize) !!!!################
###choosen cols(customize) !!!!#####################
multiplierVector = rep(1000 , times = 6)
choosen = c(3,5,7:10)
####################################################

####for testing ####
#write.table(result , file = "result_orig.csv" ,append = F , sep = "," ,col.names = F)

result = convertUnitByRow(result , choosen , multiplierVector)
#result output (customize type of file and parameters)!!!!!!#######
write.table(result , file = "result.csv" ,append = F , sep = "," ,col.names = F)






########for testing####################################
test = read.csv("result.csv" ,header = F , sep = ",")
#######################################################

#############another version###################################################################
#x = fread("AndrewFP_32ONU_extra_OLT_with_1030.csv" ,header = T, sep="," ,stringsAsFactors = F)
#x = data.frame(x)
#x=x[,c(-1)]
#nrow(x)
#ncol(x)
################################################################################################