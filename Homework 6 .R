### Homework 6 ####
## Sofia Puccio ##
## 02/18/2026. Computational Biology ####

# For Loops and SIR Parameter Sweep ###

# Question 1: Create a function that takes as its inputs, vectors for β (the transmission rate), and γ (the recovery rate). This function will output a dataframe that includes the max number of infected individuals for each parameter combination.

# load the required package 
install.packages("deSolve")
library(deSolve)

# Provided SIR function (unchanged)
run_sir_model <- function(
  beta    = 0.1,
  gamma   = 0.1,
  N       = 1000,
  S0      = 999,
  I0      = 1,
  R0      = 0,
  t_start = 0,
  t_end   = 160,
  dt      = 1
) {

  init  <- c(S = S0, I = I0, R = R0)
  times <- seq(t_start, t_end, by = dt)

  sir_equations <- function(time, state, parameters) {
    with(as.list(c(state, parameters)), {
      dS <- -beta * S * I / N
      dI <-  beta * S * I / N - gamma * I
      dR <-  gamma * I
      list(c(dS, dI, dR))
    })
  }

  out <- ode(
    y     = init,
    times = times,
    func  = sir_equations,
    parms = c(beta = beta, gamma = gamma, N = N)
  )

  as.data.frame(out)
}

## Creating a function that takes the vectors of β and γ and runs the SIR model for every combination, stores the maximum number infected, and Returns a data frame

## Define parameter vectors 
beta_vec  <- seq(0, 0.5, by = 0.01)
gamma_vec <- seq(0, 0.5, by = 0.01)
print(beta_vec)
print(gamma_vec)

# Create the SIR model with empty values now that the variables have been defined as was shown above 
sir_parameter_sweep <- function(beta_vec, gamma_vec) {

  # Create an empty container for results
  results <- data.frame(
    beta = numeric(length(beta_vec) * length(gamma_vec)),
    gamma = numeric(length(beta_vec) * length(gamma_vec)),
    max_infected = numeric(length(beta_vec) * length(gamma_vec))
  )

# Next we need to counter for row indexing, which creates a variable that keeps track of which row of the results data frame we are currently filling.
## We need this because each combination of gamma and beta produces one result, Those results need to be stored one per row in the data frame.But nested loops don’t automatically count rows — so we do it manually.
  counter <- 1

  # Nested loops over parameter space
  for (b in beta_vec) {
    for (g in gamma_vec) {

      # Run SIR model
      sir_out <- run_sir_model(beta = b, gamma = g)

      # Extract maximum infected value
      max_I <- max(sir_out$I)

      # Store results
      results[counter, ] <- c(b, g, max_I)

      # Increment counter
      counter <- counter + 1
    }
  }

  return(results)
}

## Define the parameter vectors and run the sweep 
# Transmission rate values
beta_vec <- seq(0, 0.5, by = 0.01)

# Recovery rate values
gamma_vec <- seq(0, 0.5, by = 0.01)

# Run parameter sweep
sir_results <- sir_parameter_sweep(beta_vec, gamma_vec)

# Inspect output
head(sir_results)


## Question 2: Create a second function that takes the above outputted dataframe as its input and creates a heatmap of max(number of infected) with Transmission Rate,β and Recovery Rate,γ as your x and y axises.
## This function takes the output from Part 1 and produces a heatmap of maximum infected individuals across parameter space.

# First we need to load the plotting package 
# install.packages("ggplot2")
library(ggplot2)

## Create the function for the heatmap plot. This is in order to plot the max infected across the beta-gamma space 
plot_sir_heatmap <- function(sir_df) {

  ggplot(sir_df, aes(x = beta, y = gamma, fill = max_infected)) +
    geom_tile() +
    scale_fill_viridis_c() +
    theme_minimal() +
    labs(
      title = "Maximum Number of Infected Individuals",
      x = expression(beta~"(Transmission Rate)"),
      y = expression(gamma~"(Recovery Rate)"),
      fill = "Max Infected"
    )
}
## Create the actual heatmap 
plot_sir_heatmap(sir_results)

## Biological interpretation: The heatmap reveals clear structure in epidemic severity across parameter space. When R0=β/γ<1, infections fail to spread and the maximum number of infected individuals remains near zero. However, when 𝑅0>1 large outbreaks occur. Regions where β or γ equals zero produce biologically meaningful edge cases in which no epidemic develops.

