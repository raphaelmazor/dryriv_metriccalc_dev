library(tidyverse)
library(readxl)

final_ids<-read_xlsx("C:/Users/Raphaelm/SCCWRP/Ephemeral Stream Assessment tools - Metric calculator for dry stream data/Org_FinalID_List.xlsx", sheet="OrgFinalID")
taxon_metadata<-read_csv("C:/Users/Raphaelm/SCCWRP/Ephemeral Stream Assessment tools - Metric calculator for dry stream data/temp_metadata.csv")

#Taxa lacking metadata
setdiff(final_ids$FinalID, taxon_metadata$FinalID)
