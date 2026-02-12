### Class Notes 02/12/2026 ###
##Sofia Puccio ####

# Tip 1: 
# dont do things in a lop if you dont need to! 

# Tip 2: 
# dont change dimensions in the loop 
my_dat <- runif(1)
for (i in 2:10){
  temp <- runif(1)
  my_dat <- c(my_dat, tempdir(cat("loop number =", i, my_dat{i}, "/n")))

}

# Tip 3: 
# dont write a loop if you can vectorize it 
my_dat <- 1:10 
for (i in seq_along(my_dat)){
  my_dat{i} <- my_dat[i] + my_dat[i]^2
  cat("loop number =", i, "vector element=", my_dat[i], "/n")

}
# DO THIS 
z <- 1:10 
z <- z + z^2 

# Tip 4: 
# remember the difference between i and z[i]

# Tip 5: 
# dont have to loop through everything 

z <- 1:20 

for (i in seq_along(z)){
  if(i %% 2 ==0) next
  print(i)

}
#######################
# look at the parameter space of the logistic growth model with a for loop 
r_vec <- seq(0,1, by = .05) # a vector of little r's 

for(i in seq_along(r_vec)){
  print(r_vec)
}

