#Lists, Matricies, and Data Frames 
# S. Puccio
# 29 Jan, 2026 
###################################

#creating a matrix from a vector '

my_vec <- 1:12 
my_vec 

m <- matrix(data = my_vec, nrow = 4) 
m

# by cols/filing matrix the other way 
m <- matrix(data = my_vec, ncol = 3, byrow = T)
m

#lists 
my_list <- list(1:10, matrix(1:8, nrow = 4, byrow = T), letters[1:3], pi)
print(my_list)

#indexing a list
my_list[1]
str(my_list[1])
x <- my_list[[1]] #double brackets for objects within the list element 
str(x)

# indexing into a matrix 
my_list[(2)][1,2] #[rows, cols]

#naming lists 

my_list2 <- list(tester = FALSE, little_m = matrix(1:9, nrow = 3))
my_list2

# named objects in lists: 
my_list2$little_m[2,3]

#looking at empty place indexing 
my_list2$little_m[,1]
my_list2$little_m[4]

#unlist
unrolled <- unlist(my_list2)
unrolled [1]

#unpacking complex lists 
library(ggplot)

y_var <- runif(10)
x_var <- runif(10)

#regress 
my_model <- lm(y_var~x_var)

#plot it 
qplot(x=x_var, y=y_var)

print(my_model)
summary(my_model)
qplot(x=x_var, y=y_var)

#explore structure 
str(summary(my_model))

summary(my_model)$coefficients["x_var", "Pr(>|t|)"]

u <- unlist(summary(my_model))
print(u)

pval <- u$coefficients8 
pval

#data frames 

var_a <- 1:12 
var_b <- rep(c("A", "B", "C"), 4)
var_c <- runif(12)

# creating a data frame from vecs 
df <- data.frame(var_a, var_b, var_c)
str(df)

df$var_a[1]

#expanding the data frame 
new_data <- list(var_a = 13, var_b = "D", var_c = 0.77)

#appending data 
df2 <- rbind(df, new_data)

head(df2)

View(df2) #looking at data frames in the viewer 

# add a new column to a df 
df2 
# using cbind 
new_var <- rnorm(13)
df3 <- cbind(df2, new_var)
str(df3)

#using assignment operator 
char_var <- rep("T", 13)
df3$charV <- char_var


# writing data frames 
write.csv(df3, "data/my_dataframe.csv")
getwd()

data <- read.cvs("data/my_dataframe.csv")
