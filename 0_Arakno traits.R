library(tidyverse)
library(readxl)

metadata_df<-read_xlsx("C:/Users/RaphaelM/SCCWRP/Ephemeral Stream Assessment tools - Metric calculator for dry stream data/Org_FinalID_Metadata.xlsx", sheet="Sheet1")

spiders_df<-metadata_df %>%
  filter(Order=="Araneae") %>%
  filter(FinalID!="Araneae")

spider_fam<-spiders_df$Family %>%
  unique() %>%
  na.omit()

library(arakno)
?traits

checknames(spiders_df$FinalID)
traits_all_spiders<-lapply(spiders_df$FinalID, function(x){
  print(x)
  traits(x)
})


junk<-traits("Agelenidae")

head(tratis_attypus_affinis)
