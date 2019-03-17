library(tidyverse)

sel_subset <- "Axe, Beaufort, Beckom, Cutlass, Gregory, Kittyhawk, Lancer, Mace, Manning, Scepter, Trojan, Suntop, Commander, Compass, Fathom, Planet, Spartacus, Urambie"
sel_subset <- str_split(sel_subset,",")
sel_subset <-  unlist(sel_subset)
sel_subset <- str_trim(sel_subset)
sel_subset

tos_subset <- c('1','4','8')



wagga <- read_csv("WaggaWagga2019_Design.csv") 
wagga <- wagga %>%
  select(-(X1)) %>% 
  mutate(subset=if_else((wagga$Variety %in% sel_subset & wagga$TOS %in% tos_subset), "subset\\u0007", ""))
write_csv(wagga, file.path("2019_npi_waggawagga.csv"))

callington <- read_csv("Callington2019_Design.csv")
callington <- callington %>% 
  select(-(X1)) %>% 
  mutate(subset=if_else(callington$Variety %in% sel_subset & callington$TOS %in% tos_subset, "subset\\u0007", ""))
write_csv(callington, file.path("2019_npi_callington.csv"))

merridin <- read_csv("Merridin_New_Design.csv")
merridin <- merridin %>% 
  mutate(subset=if_else(merridin$Variety %in% sel_subset & merridin$TOS %in% tos_subset, "subset\\u0007", ""))
write_csv(merridin, file.path("2019_npi_merridin.csv"))

yanyean <- read_csv("Yan Yean2019_Design.csv")
yanyean <- yanyean %>% 
  select(-(X1)) %>% 
  mutate(subset=if_else(yanyean$Variety %in% sel_subset & yanyean$TOS %in% tos_subset, "subset\\u0007", ""))
write_csv(yanyean, file.path("2019_npi_yanyean.csv"))


NPIsandbox <- read_csv("Merridin2019_Design.csv")
NPIsandbox <- NPIsandbox %>% 
  select(-(X1)) %>% 
  mutate(subset=if_else(NPIsandbox$Variety %in% sel_subset & NPIsandbox$TOS %in% tos_subset, "subset\\u0007", NA_character_))
write_csv(NPIsandbox, file.path("NPIsandbox.csv"), is.na = FALSE)


