library(tidyverse)
library(readxl)
#Step 1:
#Check that required fields are in data submission

taxon_metadata<-read_xlsx("C:/Users/Raphaelm/SCCWRP/Ephemeral Stream Assessment tools - Metric calculator for dry stream data/Org_FinalID_Metadata.xlsx", sheet="Sheet1")
user_data<-read_xlsx("C:/Users/Raphaelm/SCCWRP/Ephemeral Stream Assessment tools - Metric calculator for dry stream data/Final data/Taxonomy data/2018_BakersfieldCOSSEP_SWAMP_Taxonomy_Results_DryStreams_KG.xlsx", sheet="BenthicResults")
#Update this to include additional datasets

#Does it have required fields?

req_fields<-c("StationCode","SampleDate","CollectionMethodCode","FinalID","Result","LocationCode","Replicate")

missing_fields<-function(x){
  names_x<-names(x)
  setdiff(req_fields, names_x)
}
missing_fields(user_data)  

#Do all FinalIDs match acceptable values?
check_finalid<-function(x){
  finalid_x<-x$FinalID
  setdiff(finalid_x, taxon_metadata$FinalID)
}
check_finalid(user_data)

#Make a sample ID, and sub-sample IDs for banks and channel
make_sampleid<-function(x){
  x<-x %>%
    mutate(SampleID2=paste(StationCode, SampleDate, CollectionMethodCode, Replicate, sep="_"),
           SampleID2loc=case_when(CollectionMethodCode=="Bryo_DS"~paste(SampleID2,LocationCode, sep="_"),
                                  T~NA_character_))
  x
}
test_data<-make_sampleid(user_data)
test_data$SampleID2
test_data$SampleID2loc
user_data$SampleID


#join with metadata to aggregate from FinalID to STE_Level1 or STE_Level2

#