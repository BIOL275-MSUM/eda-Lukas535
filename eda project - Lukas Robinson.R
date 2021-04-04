
# load packages -----------------------------------------------------------
library(tidyverse)
library(BIEN)
library(ape)
library(maps)
library(sp)
library(lubridate)
library(sf)
library(elevatr)
library(USAboundaries)

#list of plant species in united states
list <- BIEN_list_country(country = "United States")

# three flowering plant species in Arizona -----------------------------------

Encelia_farinosa <-
  BIEN_occurrence_species(species = "Encelia farinosa")

Rafinesquia_neomexicana <-
  BIEN_occurrence_species(species = "Rafinesquia neomexicana")

Phacelia_distans <-
  BIEN_occurrence_species(species = "Phacelia distans")

#all data

all_data <-
  bind_rows(Encelia_farinosa,
            Rafinesquia_neomexicana,
            Phacelia_distans) %>% 
  as_tibble() %>% 
  transmute(
    species = scrubbed_species_binomial,
    latitude,
    longitude,
    date_collected,
    year = as.factor(year(date_collected))
  ) %>% 
  filter(year %in% c(2015, 2005, 1995)) %>% 
  st_as_sf(coords = c("longitude", "latitude"),crs = 4326) %>% 
  print()

#map data

map_data("state") %>% 
  filter(region == "arizona") %>% 
  st_as_sf(coords = c("long", "lat"),crs = 4326)

#us states data

us_states() %>% 
  filter(state_name %in% c("Arizona", "California")) %>% 
  ggplot() + 
  geom_sf() +
  geom_sf(mapping = aes(color = species, shape = year),
          data = all_data) +
  facet_grid(year ~ species)

#elevation point data

all_data %>% 
  get_elev_point()

#Citation

citation("BIEN")

R.Version()

RStudio.Version()


