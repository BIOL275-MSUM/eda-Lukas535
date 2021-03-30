
# load packages -----------------------------------------------------------
library(tidyverse)
library(BIEN)
library(ape)
library(maps)
library(sp)
library(lubridate)

#list of plant species in united states
list<-BIEN_list_country(country="United States")

# three flowering plant species in Arizona -----------------------------------

Encelia_farinosa<-BIEN_occurrence_species(species="Encelia farinosa")

Rafinesquia_neomexicana<-BIEN_occurrence_species(species="Rafinesquia neomexicana")

Phacelia_distans<-BIEN_occurrence_species(species="Phacelia distans")

#filter of three dates 

Encelia_farinosa_date<-filter(Encelia_farinosa, year(date_collected)%in%c(2015,2005,1995))

Rafinesquia_neomexicana_date<-filter(Rafinesquia_neomexicana, year(date_collected)%in%c(2015,2005,1995))

Phacelia_distans_date<-filter(Phacelia_distans, year(date_collected)%in%c(2015,2005,1995))

#plot data

map('world',fill = T , col= "grey", bg = "light blue",xlim = c(-180,-20),ylim = c(-60,80))
plot(Encelia_farinosa,col = "green",add = T)

#Citation


citation("BIEN")

R.Version()

RStudio.Version()


