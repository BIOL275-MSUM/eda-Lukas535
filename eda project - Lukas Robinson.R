
# load packages -----------------------------------------------------------
library(tidyverse)
library(BIEN)
library(ape)
library(maps)
library(sp)
library(lubridate)
#list of plant species in united states
list<-BIEN_list_country(country="United States")

# three common flowering plant species in Arizona -----------------------------------

Encelia_farinosa<-BIEN_occurrence_species(species="Encelia farinosa")

Fouquieria_splendens<-BIEN_occurrence_species(species="Fouquieria splendens")

Sierra_vista<-BIEN_occurrence_species(species="")

#filter of three dates 
Encelia_farinosa_date<-filter(Encelia_farinosa, year(date_collected)%in%c(2015,2005,1995))
Fouquieria_splendens_date<-filter(Fouquieria_splendens, year(date_collected)%in%c(2015,2005,1995))




