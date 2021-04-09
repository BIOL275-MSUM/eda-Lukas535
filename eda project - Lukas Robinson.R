
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
  st_as_sf(coords = c("longitude", "latitude"),crs = 4326, remove = FALSE) %>% 
  print()

#map data

map_data("state") %>% 
  filter(region == "arizona") %>% 
  st_as_sf(coords = c("long", "lat"),crs = 4326, remove = FALSE)

#us states data

us_states() %>% 
  filter(state_name %in% c("Arizona", "California")) %>% 
  ggplot() + 
  geom_sf() +
  geom_sf(mapping = aes(color = species, shape = year),
          data = all_data) +
  facet_grid(year ~ species)

#elevation point data

elevation_point<-all_data %>% 
  get_elev_point() 

#plot elevation data

elevation_point %>% 
  filter(!is.na(species)) %>% 
  ggplot() +
  geom_jitter(mapping = aes(x = year, y = elevation, color = year),
              alpha = .5) +
  geom_crossbar(
    data = all_elevation,
    mapping = aes(
      x = year,
      y = mean_e,
      ymax = ci_upper_limit,
      ymin = ci_lower_limit
    ),
    color = "black"
  ) +
  facet_wrap( ~ species) +
  guides(color = "none")
  
#plot latitude data

all_data %>% 
  ggplot() +
  geom_jitter(mapping = aes(x = year, y = latitude, color = year),
              alpha = .5) +
  geom_crossbar(
    data = average_latitude,
    mapping = aes(
      x = year,
      y = mean_l,
      ymax = ci_upper_limit,
      ymin = ci_lower_limit
    ),
    color = "black"
  ) +
  facet_wrap( ~ species) +
  guides(color = "none")

#filter species elevation 

Encelia_elevation <-
  filter(elevation_point, species %in% c("Encelia farinosa")) 

Phacelia_elevation <-
  filter(elevation_point, species %in% c("Phacelia distans"))

Rafinesquia_elevation <-
  filter(elevation_point, species %in% c("Rafinesquia neomexicana"))

#elevation mean data

all_elevation <-
  bind_rows(Encelia_elevation,
            Rafinesquia_elevation,
            Phacelia_elevation) %>% 
  st_drop_geometry() %>% 
  group_by(species, year) %>% 
  summarize(
    mean_e = mean(elevation),
    sd_e = sd(elevation),
    sample_size = n(),
    sem = sd_e / sqrt(sample_size),
    ci_upper_limit = mean_e + 1.96 * sem,
    ci_lower_limit = mean_e - 1.96 * sem,
  )

#latitude mean data

average_latitude <-
  all_data %>% 
  st_drop_geometry() %>% 
  group_by(species, year) %>% 
  summarize(
    mean_l = mean(latitude),
    sd_l = sd(latitude),
    sample_size = n(),
    sem = sd_l / sqrt(sample_size),
    ci_upper_limit = mean_l + 1.96 * sem,
    ci_lower_limit = mean_l - 1.96 * sem,
  ) 

#Citation

citation("BIEN")

R.Version()

RStudio.Version()