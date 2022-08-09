library(tidyverse)
library(readxl)

final_ids<-read_xlsx("C:/Users/Raphaelm/SCCWRP/Ephemeral Stream Assessment tools - Metric calculator for dry stream data/Org_FinalID_List.xlsx", sheet="OrgFinalID")
taxon_metadata<-read_xlsx("C:/Users/Raphaelm/SCCWRP/Ephemeral Stream Assessment tools - Metric calculator for dry stream data/Org_FinalID_Metadata.xlsx", sheet="Sheet1")

#Taxa lacking metadata
setdiff(final_ids$FinalID, taxon_metadata$FinalID)
setdiff(taxon_metadata$FinalID,final_ids$FinalID)

meta_df<-final_ids %>%
  full_join(taxon_metadata)


meta_df %>%
  filter(Phylum=="Bryophyta" & Family=="Fun")

meta_df %>% write.table(file="clipboard-1024", sep="\t", row.names=F)

taxon_metadata$FinalID %>% unique() %>% length()
taxon_metadata$OrganismCode %>% unique() %>% length()

taxon_metadata %>%
  group_by(FinalID) %>%
  tally() %>%
  filter(n>1)
  
