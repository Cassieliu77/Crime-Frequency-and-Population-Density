#### Preamble ####
# Purpose: Download the needed dataset
# Author: Yongqi Liu
# Date: 20 Sep 2024 
# Contact: cassieliu.liu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Find the dataset called "About Neighborhood Crime Rates" on Open Data Toronto

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download data ####
# get the package
package <- show_package("neighbourhood-crime-rates")
package
# get all resources for this package
resources <- list_package_resources("neighbourhood-crime-rates")
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))
# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

#### Save data ####
write_csv(data, "data/raw_data/raw_crime_data.csv") 

         
