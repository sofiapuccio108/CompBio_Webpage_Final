### Homework 7###
### Sofia Puccio###
### 02/28/2026###

# Load required packages##
library(dplyr)
library(tidyr)
# Examine the structure of the Iris Data Set 
str(iris)
# After examining the dataset I have noted that there are 50 observations(rows) and 5 variables (columns)

# Creating Iris1
# The conditions listed are: 
# Species = virgnica or versicolor, Sepal.Length > 6, Sepal.Width > 2.5
iris1 <- iris %>%
  filter(
    Species %in% c("virginica", "versicolor"),
    Sepal.Length > 6,
    Sepal.Width > 2.5
  )

dim(iris1)
# The observations made after running this code were that R will compute depeding on the filtering used. Additionally, the number of variables identified were 5. 

# Creating Iris2
# In this variable we are only keeping the species, Sepal.Length, and Sepal.Width
iris2 <- iris1 %>%
  select(Species, Sepal.Length, Sepal.Width)

dim(iris2)
# The observations were the same as Iris1, and the number of variables listed were 3

# Ordering Iris3 by Sepal.Length 
# In this segment we will be sorting from smallest sepal length and displaying the first 6 rows
iris3 <- iris2 %>%
  arrange(desc(Sepal.Length))

head(iris3)

# We can now create Iris4 and add Sepal.Area by multiplying Sepal.Length and Sepal.Width, this will create a new column
iris4 <- iris3 %>%
  mutate(Sepal.Area = Sepal.Length * Sepal.Width)

dim(iris4)
# Once again, the observations are the same as Iris3/4, and the number of varibles is 4

# Creating Iris5, this will act as a summary statistic. This will calculate the average sepal length, average sepal width, and the overall sample size. 
iris5 <- iris4 %>%
  summarise(
    mean_sepal_length = mean(Sepal.Length),
    mean_sepal_width  = mean(Sepal.Width),
    sample_size       = n()
  )

iris5
# Creating Iris6 which shows the average sepal length, the average sepal width, and the sample size for each species of in the iris4 data frame and print iris6.
iris6 <- iris4 %>%
  group_by(Species) %>%
  summarise(
    mean_sepal_length = mean(Sepal.Length),
    mean_sepal_width  = mean(Sepal.Width),
    sample_size       = n()
  )

iris6
# At this point we have a table containing the species, the mean length,width, and sample size for each

# Now that we have all of our variables and our table, we can rework the steps using a single pipeline to get from Iris1 to Iris4
# We can make this IrisFinal 
irisFinal <- iris %>%
  filter(
    Species %in% c("virginica", "versicolor"),
    Sepal.Length > 6,
    Sepal.Width > 2.5
  ) %>%
  select(Species, Sepal.Length, Sepal.Width) %>%
  arrange(desc(Sepal.Length)) %>%
  mutate(Sepal.Area = Sepal.Length * Sepal.Width)

head(irisFinal)

# This now outputs 6 different values for each variable in each species
# Now we will create a "longer" data frame with columns of measure including species, sepal.length, sepal.width, petal.length, and petal.width, measure, and value 
iris_long <- iris %>%
  pivot_longer(
    cols = c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width),
    names_to = "Measure",
    values_to = "Value"
  )

head(iris_long)
# The output is a 6x3 table 