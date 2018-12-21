install.packages("statip")
library(statip)

#Question number 1

x <- seq(0,20, by = 1)
par(mfrow = c(3,2))
#plot for p = 0.1
y <- dbinom(x, 20, 0.1, log = FALSE)
p <- plot(y, type = "b", main = "Binomial distribution with p = 0.1", xlab = "Number of success", ylab = "P(X)", col = "Blue")
#plot for p= 0.3
y1 <- dbinom(x, 20, 0.3, log = FALSE)
p1 <- plot(y1, type = "b", main = "Binomial distribution with p = 0.3", xlab = "Number of success", ylab = "P(X)", col = "Green")
#plot for p = 0.5
y2 <- dbinom(x, 20, 0.5, log = FALSE)
p2 <- plot(y2, type = "b", main = "Binomial distribution with p = 0.5", xlab = "Number of success", ylab = "P(X)", col = "Orange")
#plot for p= 0.7
y3 <- dbinom(x, 20, 0.7, log = FALSE)
p3 <- plot(y3, type = "b", main = "Binomial distribution with p = 0.7", xlab = "Number of success", ylab = "P(X)", col = "Red")
#plot for p = 0.9
y4 <- dbinom(x, 20, 0.9, log = FALSE)
p4 <- plot(y4, type = "b", main = "Binomial distribution with p = 0.9", xlab = "Number of success", ylab = "P(X=n)", col = "Yellow")


#Question number 2

#Heads = 1, Tails = 0
sample.space <- c(0,1)
p <- 0.5 #fair coin
N <- 20
flips_20 <- sample(sample.space, size = N, replace = TRUE)
flips_200 <- sample(sample.space, size = 200, replace = TRUE)
flips_50 <- sample(sample.space, size = 50, replace = TRUE)

#sampling with replacement
flipsample_20_r <- sample(flips_20, size = 10, replace = TRUE)
flipsample_20_r
flipsample_50_r <- sample(flips_50, size = 10, replace = TRUE)
flipsample_50_r
flipsample_200_r <- sample(flips_200, size = 10, replace = TRUE)
flipsample_200_r

#Bernoulli distribution
flipDB_r <- dbern(x= flipsample_20_r, p = 0.5, log = FALSE)
flipDB_r
flipDB2_r <- dbern(x = flipsample_50_r, p = 0.5, log = FALSE)
flipDB2_r
flipDB3_r <- dbern(x = flipsample_200_r, p = 0.5, log = FALSE)
flipDB3_r

#sampling without replacement
flipsample_20_wr <- sample(flips_20, size = 10, replace = FALSE)
flipsample_20_wr
flipsample_50_wr <- sample(flips_50, size = 10, replace = FALSE)
flipsample_50_wr
flipsample_200_wr <- sample(flips_200, size = 10, replace = FALSE)
flipsample_200_wr


flipDB_wr <- dbern(x = flipsample_20_wr, p = 0.5, log = FALSE)
flipDB_wr
flipDB2_wr <- dbern(x= flipsample_50_wr, p = 0.5, log = FALSE)
flipDB2_wr
flipDB3_wr <- dbern(x= flipsample_200_wr, p = 0.5, log = FALSE)
flipDB3_wr


print("Yes, all these are Bernoulli sequences as probability of each element is equal")



#Question number 3

print("On sampling the values, i could not find the observed frequency table in the question")