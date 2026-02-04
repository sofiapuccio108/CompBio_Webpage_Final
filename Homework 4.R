######## Homework 4: Working with matrices , lists, and data frames 

# Assign to the variable n_dims a single random integer between 3 and 10.

n_dims <- sample(3:10, 1)
print(n_dims)

# Create a vector of consecutive integers from 1 to n_dims^2
vals <- 1:(n_dims^2)
print(vals)

# Randomly reshuffle the values
vals <- sample(vals)

# Create a square matrix
my_matrix <- matrix(vals, nrow = n_dims, ncol = n_dims)
my_matrix #print 

# Transposing the matrix, this flips the matrix over its major diagonal which swaps the rows and columns 
t_matrix <- t(my_matrix) 
t_matrix

# Calculating the sum and mean of the first row
sum(my_matrix[1, ])
mean(my_matrix[1, ])

# Sum and mean of the last row
sum(my_matrix[n_dims, ])
mean(my_matrix[n_dims, ])

#note: eig$values are (usually) real or complex numbers, whereas eig$vectors are numeric vectors, often containing decimals (and possibly complex values)
eig <- eigen(my_matrix)
typeof(eig$values)
typeof(eig$vectors)
# the output for this code was "complex" which means we got complex eigenvalues for this matrix 

######Creating a list 
# Create list components
my_matrix <- matrix(runif(16), nrow = 4)
my_logical <- runif(100) > 0.5
my_letters <- sample(letters)

# Combine all of the components into a list
my_list <- list(my_matrix = my_matrix, my_logical = my_logical, my_letters = my_letters)
my_list

# Creating a new list 
new_list <- list(my_list$my_matrix[2, 2], my_list$my_logical[2], my_list$my_letters[2])
new_list

# Checking data types of new list 
typeof(new_list[[1]])
typeof(new_list[[2]])
typeof(new_list[[3]])
# The results from this were "double", "logical", and "character" indicating that one list has numbers with decimals, one stores TRUE or FALSE values, and one contains charaters 

# Combine them into a single atomic vector 
combined_vec <- c(new_list[[1]], new_list[[2]], new_list[[3]])
combined_vec
typeof(combined_vec)
# This shows up as "character" because there are chracters involved 

# Creating a data frame 
my_df <- data.frame(my_unis = runif(26, 0, 10), my_letters = sample(LETTERS))
my_df

# Replace 4 random rows in my_units with NA 
my_df$my_unis[sample(1:26, 4)] <- NA
my_df # In this case, M, O, C, and T were the four random letters being listed as NA 

# Line of code to identify which rows have the missing values 
# Identify which rows have missing values in my_unis (single line)
which(is.na(df$my_unis)) #can you do this? 
# df was already used , so I needed to rename my dataframe and rewrite the list 
my_df <- data.frame(my_unis = runif(26, 0, 10), my_letters = sample(LETTERS, 26)) # taking df and making it "my_df"
my_df$my_unis[sample(1:26, 4)] <- NA # extracts "my_units" from the sample 
which(is.na(my_df$my_unis))
my_df <- my_df[order(my_df$my_letters), ]
mean(my_df$my_unis, na.rm = TRUE)

# (running again) Replace 4 random rows in my_unis with NA (single line)
my_df$my_unis[sample(1:26, 4)] <- NA
my_df

# Identify which rows have missing values in my_unis (single line)
which(is.na(my_df$my_unis))

# Re-order the entire data frame alphabetically by my_letters
my_df <- my_df[order(my_df$my_letters), ]
my_df

# Calculate the column mean for my_unis
mean(my_df$my_unis, na.rm = TRUE)

