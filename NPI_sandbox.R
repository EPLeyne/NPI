## Add tidyverse
(tidyverse)

# Create the subset of lines and TOS that are to have extra data taken
sel_subset <- "Axe, Beaufort, Beckom, Cutlass, Gregory, Kittyhawk, Lancer, Mace, Manning, Scepter,
Trojan, Suntop, Commander, Compass, Fathom, Planet, Spartacus, Urambie, EGA_Gregory, RGT Planet, Spartacus CL"
sel_subset <- str_split(sel_subset,",")
sel_subset <-  unlist(sel_subset)
sel_subset <- str_trim(sel_subset)
sel_subset

tos_subset <- c('1','4','8')


 #Wagga
wagga <- read_csv("raw_data/WaggaWagga2019_Design.csv") 
wagga <- wagga %>%
  select(-(X1)) %>% 
  mutate(subset=if_else((wagga$Variety %in% sel_subset & wagga$TOS %in% tos_subset), "subset\\u0007", ""))
write_csv(wagga, file.path("fp_files/2019_npi_waggawagga.csv"))

#Callington
callington <- read_csv("raw_data/Callington2019_Design.csv")
callington <- callington %>% 
  select(-(X1)) %>% 
  mutate(subset=if_else(callington$Variety %in% sel_subset & callington$TOS %in% tos_subset, "subset\\u0007", ""))
write_csv(callington, file.path("fp_files/2019_npi_callington.csv"))

#Merridin
merridin <- read_csv("raw_data/Merridin_New_Design.csv")
merridin <- merridin %>% 
  mutate(subset=if_else(merridin$Variety %in% sel_subset & merridin$TOS %in% tos_subset, "subset\\u0007", ""))
write_csv(merridin, file.path("fp_files/2019_npi_merridin.csv"))

#Yan Yean
yanyean <- read_csv("raw_data/Yan Yean2019_Design.csv")
yanyean <- yanyean %>% 
  select(-(X1)) %>% 
  mutate(subset=if_else(yanyean$Variety %in% sel_subset & yanyean$TOS %in% tos_subset, "subset\\u0007", ""))
write_csv(yanyean, file.path("fp_files/2019_npi_yanyean.csv"))

#Sandbox
NPIsandbox <- read_csv("raw_data/WaggaWagga2019_Design.csv")
NPIsandbox <- NPIsandbox %>% 
  select(-(X1)) %>% 
  mutate(subset=if_else(NPIsandbox$Variety %in% sel_subset & NPIsandbox$TOS %in% tos_subset, "subset\\u0007", ""))
write_csv(NPIsandbox, file.path("fp_files/NPIsandbox.csv"))

#Dale
dale <- read_csv("raw_data/Dale_2019.csv")
dale <- dale %>% 
  mutate(subset=if_else(dale$Variety %in% sel_subset & dale$TOS %in% tos_subset, "subset\\u0007", ""))
write_csv(dale, file.path("fp_files/2019_npi_dale.csv"))
