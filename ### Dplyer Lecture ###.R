### Dplyer Lecture ### 
## 02/25/2026## 
## Sofia Puccio ## 

# A few of the core verbs that you'll be used are
# filter(), arrange(), select(), summarize(), group_by(), and mutate()

# start with a built - in dataset
library(tidyverse)
# to specifiy the package your're using, you can first call on the package name 

dplyr::filter()
stats::filter()

data(starwars)
class(starwars)

head(starwars)
tail(starwars)

glimpse(starwars)
# alternative to the structure function 


# Cleaning up our dataset 

# base r has the complete.cases function which removes any rows with NA's 

starwarsClean <- starwars[complete.cases(starwars[,1:10]),]

# you can check for NA's 
is.na(starwarsClean[,1])
anyNA(starwarsClean[,1:10])

# filter() function will subset observations by their values 
# use >, >=, <=, ==, !
# logical operators like & and | 
# filter automaticall excludes NA, have to ask for them specifically 

filter(starwarsClean, gender=="masculine" & height < 180)

filter(starwarsClean, gender=="masculine" & height < 180, height > 100)

filter(starwars, eye_color %in% c("blue", "brown")) # %in% filters for multiple different conditions 

# arrange() rewords rows 
arrange(starwarsClean, by=height)
arrange(starwarsClean, by=desc(height)) # additional columns will break ties in precdeing columns 

# select() choose variables based on their names/columns 
starwarsClean[1:10,]
select(starwarsClean, 1:10) # these two functions are equivalent 
select(starwarsClean, name:homeworld)

#rearrange columns 
select(starwarsClean, homeworld, name, gender, species, everything())

select(starwarsClean, contains("color"))

# rename columns 
select(starwars, haircolor=hair_color) # actual name of the column comes after starting the new name you want 

# mutate() function creates new variables with function sof existing variables 

# create a new column that is just height divided by mass 
mutate(starwarsClean, ratio=height/mass)

starwars_lbs <- mutate(starwarsClean, mass_lbs=mass*2.2)

# you can use the transmute() function to just have the new variable that you want 

transmute(starwarsClean, mass_lbs=mass*2.2)

# summarize() and group_by() functions to collapse as many values down to a single summary 

summarize(starwarsClean, meanHeight=mean(height))
summarize(starwars, meanHeight=mean(height))
summarize(starwars, meanHeight=mean(height, na.rm=TRUE), TotalNumber=n())

#use group_by() for additional calculations 
starwarsGender <- group_by(starwars, gender)
summarize(starwarsGender, meanHeight=mean(height, na.rm=TRUE), number=n())


# pipe statements - the pipe operator is %>%, or|>

# These are sequences of actions that will change your dataset 
# It is going to past intermediate results onto the next functions in your sequence 
# You should avoid this when you need to manipulate more than one object, or if there are meaningful intermediate objects 
# Forematting: you should always have a space before it and usually an automatic indent

starwarsClean%>%
  group_by(gender)%>%
  summarize(meanHeight=mean(height, na.rm=TRUE), number=n())

starwarsClean%>%
  mutate(sp=case_when(species=="Human"~"Human", TRUE ~ "Non-human"))%>%
  select(name, sp, everything())
unique(starwarsClean$species)

glimpse(starwarsClean)

# Pivot from long to wide format using pivot_wide or pivot_longer
