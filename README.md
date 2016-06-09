# dataProcessorForChris
data processor for Chris

Thanks for using my tool, everyone in YZU 1707LAB. This is a small tool which can save massive time on processing data.
This is a tutorial for this tool :

##the parameters
---------------------
line 41~42:

multiplierVector = rep(1000 , times = 6)

乘以1000 ,6次 ,也可以指定成自己想要的倍率串列

choosen = c(3,5,7:10)
 
 哪些欄位要被轉換, 第3 , 5 ,7~10 要被轉換
 
 the length of choosenCols must equals to the length of multiplier.
