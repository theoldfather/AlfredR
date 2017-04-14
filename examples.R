library(rJava)
library(tis)
library(dplyr)
.jinit()
.jaddClassPath(paste0(Sys.getenv("HOME"),"/Projects/TSDiff/out/artifacts/TSDiff_jar/TSDiff.jar"))


get_vlist<-function(series_name){
  builder<-.jnew("com/oldfather/alfred/VintageListBuilder",series_name)
  vlist<-.jcall(builder,"Lcom/oldfather/tsdiff/CompressedAlignedVintageList;","getVintageList")
}

make_tis<-function(vlist,date_str){
  jdate<-vlist$getVintageStartDate(date_str)
  start_date<-jdate$toString()
  freq<-tolower(vlist$getFreq())
  series<-vlist$getVintageSeries(date_str)
  tis(series,ti(as.Date(start_date),tif(freq)))
}
gdpc1<-get_vlist("GDPC1")
gdpc1 %>% make_tis("2017-04-13" ) %>% tisPlot()
gdpc1 %>% make_tis("2010-06-10" ) %>% tisPlot()

         