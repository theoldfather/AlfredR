library(rJava)
library(tis)
library(dplyr)
.jinit()
.jaddClassPath(paste0(Sys.getenv("HOME"),"/Projects/TSDiff/out/artifacts/TSDiff_jar/TSDiff.jar"))
builder<-.jnew("com/oldfather/alfred/VintageListBuilder","GDPC1")
vlist<-.jcall(builder,"Lcom/oldfather/tsdiff/CompressedAlignedVintageList;","getVintageList")
vhead<-.jcall(vlist,"Lcom/oldfather/tsdiff/CompressedAlignedVintageNode;","getHead")
vlist$getFreq()

date_str<-"2014-07-28"
jdate<-vlist$getVintageStartDate(date_str)
start_date<-jdate$toString()
freq<-tolower(vlist$getFreq())
series<-vlist$getVintageSeries(date_str)
tis(series,ti(as.Date(start_date),tif(freq)))


make_tis<-function(vlist,date_str){
  jdate<-vlist$getVintageStartDate(date_str)
  start_date<-jdate$toString()
  freq<-tolower(vlist$getFreq())
  series<-vlist$getVintageSeries(date_str)
  tis(series,ti(as.Date(start_date),tif(freq)))
}
make_tis(vlist,"2012-12-31" )%>% tisPlot()

         