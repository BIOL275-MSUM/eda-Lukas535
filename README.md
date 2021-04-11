Climate Changes Affect on Plant Species
================
Lukas Robinson
2021-04-11

## R Markdown

## Abstract

Climate change here on Earth is at an alarming stage, with a steady
increase in atmospheric carbon dioxide affecting how plants
photosynthesis, to the unbalanced situations in climatic conditions,
some places prolonged droughts and in others increased flooding. These
issues are causing major problems for plant species worldwide. Climate
change is defined as a long-term change in the average weather patterns
that have come to define Earth’s local, regional and global climates.
Just with this definition, we can hypothesis that as climate change
slowly changes Earth’s local, regional and global climates plant species
will be affected in some way. In this research project, I will be
answering how climate change is affecting these plant species based on
their plant distribution over time. To define plant distribution I will
be looking at three different time periods and three common plant
species found at different elevations in Arizona and California then
comparing the abundance and distribution of those plant species in that
area. I will be using the Botanical Information and Ecology Network
(BIEN) package to look at all of the data and the BIEN data will be the
data presented.

## Introduction

## Methods

### Data Acquisition

For this project, all the data was analyzed and manipulated using
RStudio (RStudio Team 2020). I obtained data from the Botanical
Information and Ecology Network (BIEN, 2021). This data was acquired
using the R package known as BIEN (Maitner, 2020). BIEN was used to
obtain information about plant distribution and abundance over numerous
years. No special access was required to access this resource I just
needed to download the package into R Studio before looking at the data.
Since the data from the BIEN package is so large I narrowed down my
search for a good research project by searching for three plant species
using information found from azstateparks.com.

### Data Preparation

After first loading in all of the required packages, my data was first
prepared for analysis by filtering through all the plant species in the
BIEN package to only the three plant species that I wanted to look at.

Once I filtered out my three species I then bound these three data sets
together into one and simplified that data set to only have the
categories I needed for my research. The categories include species,
date collected, year, and geometry. By doing this it helped me better
understand how large my sample size will be for this experiment.

After I created this new data set, I filtered out the two states that I
will be looking at, California and Arizona. Once that was done I graphed
the data into three separate rows and columns. This showed what the
distribution looked like of the three plant species over the three given
years.

Next, I used the elevatr package to help me get each elevation point for
the plant species found in the data set. This was done by filtering each
plant species individually then binding those data sets together. Then
calculating the mean, standard deviation, sample size, standard error,
and the upper and lower limit. This allowed me to then be able to plot
these plant species and see what each of their mean and their 95%
confidence interval look like over time and how it has changed.

The same process was done to get the latitude graph over time. The only
difference was plugging in latitude instead of elevation. I then graphed
this to see how the mean latitude of these species has changed.

## Results

![](README_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

Figure 1. A map displaying the distributions of the three plant species
in Arizona and California for the years 1995, 2005, 2015.

![](README_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->

Figure 2. A jitter plot displaying the different elevations of the three
plant species over the years 1995, 2005, and 2015.

![](README_files/figure-gfm/unnamed-chunk-11-1.png)<!-- -->

Figure 3. A jitter plot displaying the different latitudes of the three
plant species over the years 1995, 2005, 2015.

## Discussion

## Literature Cited

1.  Brian Maitner (2020). BIEN: Tools for Accessing the Botanical
    Information and Ecology Network Database. R package version 1.2.4.
    <https://CRAN.R-project.org/package=BIEN>

2.  RStudio Team (2020). RStudio: Integrated Development Environment for
    R. RStudio, PBC, Boston, MA URL <http://www.rstudio.com/>

3.  Hollister, J.W. (2020). elevatr: Access Elevation Data from Various
    APIs. R package version 0.3.1.
    <https://CRAN.R-project.org/package=elevatr/>

4.  R Core Team (2020). R: A language and environment for statistical
    computing. R Foundation for Statistical Computing, Vienna, Austria.
    URL <https://www.R-project.org/>
