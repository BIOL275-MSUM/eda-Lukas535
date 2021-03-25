Climate Changes Affect on Plant Species in Arizona
================
Lukas Robinson
3/11/2021

## R Markdown

## Abstract

Climate change here on Earth is at an alarming stage, with a steady
increase in atmospheric carbon dioxide affecting how plants
photosynthesis to the unbalanced situations in climatic conditions, some
places prolonged droughts and in others increased flooding is causing
major problems for plant species. Climate change is defined as a
long-term change in the average weather patterns that have come to
define Earth’s local, regional and global climates. Just with this
definition, we can hypothesis that as climate change slowly changes
Earth’s local, regional and global climates plant species will be
affected in some way. In this research project, I will be answering how
climate change is affecting these plant species based on their plant
distribution over time. To define plant distribution I will be looking
at three different time periods and three common plant species found at
different elevations in Arizona comparing the abundance and distribution
of those plant species in that area. I will be using the Botanical
Information and Ecology Network (BIEN) package to look at all of the
data and the BIEN data will be the data presented.

## Introduction

## Methods

### Data Acquisition

For this project, I obtained data from the Botanical Information and
Ecology Network (BIEN, 2021). This data was acquired using the R package
known as BIEN (Maitner, 2020). BIEN was used to obtain information about
plant distribution and abundance over a numerous amount of years. No
special access was required to access this resource just needed to
download the package into R Studio before looking at the data. Since the
data from the BIEN package is so large I narrowed down my search for a
good research project by searching for three plant species using
information found from azstateparks.com

### Data Preparation

Data was first prepared for analysis by filtering through all the
species in the data to only the plant species that I wanted to look at.
I did this by using the BIEN\_occurrence\_species(species=“species”)
function for each of the three species.

Next, to look at the specific dates I used the filter(“species”,
year(date\_collected)%in%c(“years”)) function to filter out the three
years that I needed. This helped me understand how big my sample size
will be for this experiment.

## Results

## Discussion

## Literature Cited

1.  Brian Maitner (2020). BIEN: Tools for Accessing the Botanical
    Information and Ecology Network Database. R package version 1.2.4.
    <https://CRAN.R-project.org/package=BIEN>

## References
