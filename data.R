
library(tidyverse)
library(labelled)

# Read in data

survey <- tibble::tribble(
  ~participant_id, ~pet_1, ~pet_2, ~pet_3, ~pet_type, ~participant_age,
  "10", 2, 1, 1, 1, 12,
  "22", 2, 2, -99, 2, 14, 
  "13", 4, 4, 1, 1, 15,
  "11", 2, 1, 1, 1, 13,
  "15", 2, -99, 3, 2, 16, 
  "20", 4, 4, 1, 1, 17,
  "14", 2, 1, 1, 1, 13,
  "17", 2, 3, 3, 2, 16, 
  "25", 4, 4, 1, 1, 17,
  "27", 2, 1, 1, 1, 13,
  "28", 2, 3, 3, 2, NA, 
  "18", 4, 4, 1, 1, 11)


# Read in data dictionary

dict <- tibble::tribble(
  ~var_name, ~label,
  "participant_id", "Respondent study ID",
  "participant_age", "How old are you?",
  "pet_type", "What type of pet do you have",
  "pet_1", "Within your family, your pet likes you best", 
  "pet_2", "You talk to your pet as a friend",
  "pet_3", "You buy presents for your pet")

# Add value labels

survey <- survey %>%
  mutate(across(pet_1:pet_3, 
                ~labelled(., labels = c(`almost never`=1, 
                                                   sometimes=2, often=3, `almost always`=4,
                                        `missing response` = -99)))) %>%
  set_value_labels(pet_type = c(dog = 1, cat = 2)) %>%
  mutate(across(pet_1:pet_3, ~(`na_values<-`
                               (., c(-99)))))


# Add variable labels to variables

dict_labels <- dict %>%
  select(var_name , label) %>%
  deframe() %>%
  as.list()

survey <- survey %>%
  set_variable_labels(.labels = dict_labels, .strict = FALSE)

# Reorder

var_order <- dict %>%
  dplyr::select(var_name) %>%
  dplyr::pull()

# reorder

survey <- survey %>%
  relocate(all_of(var_order))

