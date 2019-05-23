library("e1071")

# 1. Probability theory techniques

# 1.1 Creating data samples
# LO:   Create random sample of data using simple stratified approach.
#       Retrieve a random sample from a data frame.
#       Produce a random sample from normal, t, binomial and chi-squared distributions.

    # Simple random sampling
    sample(1:100, 5)
    
    # stratified sampling
    library("dplyr")
    set.seed(1)
    
    sample_iris <- iris %>%
        group_by(Species) %>%
        sample_n(10)
    
    # random permutation of a vector
    sample(1:10)
    
    # distributions
    # rnorm etc.

# 1.2 Probability of discrete and continuous distributions
# LO:   Compute probabilities and covert probabilities to quantiles.
#       Plot histogram.
    
dnorm(0)
pnorm(0)
qnorm(0.5)
rnorm(4)
    # and:
    # dt, pt, qt, rt | t distribution
    # dbinom, pbinom, qbinom, rbinom | Binomial distribution
    # dchisq, pchisq, qchisq, rchisq | Chi-Squared distribution
    # set.seed() for reproducibility

# 1.3 Central tendency, variation and shape measures
# LO:   Compute central tendency, variation and shape measures for a sample of data.

heights <- c(160, 170, 168, 172, 165, 180)

mean(heights)
median(heights)

var(heights)
sd(heights)

quantile(heights)

skewness(heights)
kurtosis(heights)    

# 2 Statistical tests

# 2.1 Confidence intervals
# LO:   Compute a confidence interval for a mean of a given sample of data.
    # forming a confidence interval for a mean
    x <- sample(1:1000, 50)
    t.test(x)
    
# 2.2 Cental Limit Theorem
# LO:   Demonstrate Central Limit Theorem on an example.
    population <- runif(10^6)
    
    sample_means <- colMeans(matrix(population, ncol = 2000))
    
    hist(population, xlab = "Population")
    hist(sample_means, xlab = "Samples means")
    
# 2.3 Hypothesis testing
# LO:   Apply t-Test to test the mean of a sample and to compare two means
#       Apply Shapiro test to check for normality of a data.
    
    x <- rnorm(100)
    
    # testing the mean of a sample (t Test)
    t.test(x, mu = 0)
    
    # testing for normality
    shapiro.test(x)    
    
    # Comparing two means
    y <- rnorm(200)
    t.test(x, y)
    
# 2.4 Comparing more means (one-way ANOVA)
# LO:   ???
    
# 3. Regression
    
# 3.1 Covariance and correlation
# LO:   Compute correlation and covariance of two datasets.
#       Plot scatterplot.
    
cor(x, y)
cov(x, y)

# 3.2 Linear regression
# LO:   Compute a linear regression model.
#       Explain regression statistics.

    # simple linear regression
    y <- rnorm(100, 10, 20)
    x <- rnorm(100)
    m_s <- lm(y ~ x)    
    
    # multiple linear regression
    u <- rnorm(100, 5, 10)
    v <- rnorm(100, 2, 3)
    m_m <- lm(y ~ x + v + u)
    
    # regression statistics
    summary(m_s)
    
# 3.3 Evaluate regression model
# LO:   Predict values based on a linear model.

    
# 3.4 Logistic regression
# LO:   Compute logistic regression model.

# 4 Tips&tricks
    
# 4.1 Sneak peak into the data
# LO:   Display few rows a data frame.
#       Compute summary of a data frame.
    
    head(x)
    tail(x)
    
    # binning your data
    x <- rnorm(1000)
    breaks <- c(-3, -2, -1, 0, 1, 2, 3)
    f <- cut(x, breaks)
    summary(f)
    
    class(x)
    mode(x)
    str(x)
    
# 4.2 Visualizing data
# LO:   Visualize data using various plot types.
    
    # plot one variable
    plot(x)
    boxplot(x)
    hist(x, prob = TRUE)
    lines(density(x))
    
    discrete_sample <- sample(1:20, 50, replace = TRUE)
    plot(table(discrete_sample))
    
    qqnorm(x)
    qqline(x)
    
        # graphics
        abline(a = 0, b = 1)
        
    # plot two variables
    x <- rnorm(100, 0, 1)
    y <- rnorm(100, 1, 0.5)
    plot(x, y)
    
    m <- lm(y ~ x)
    plot(y ~ x)
    abline(m)
    
# 4.3 Missing data
# LO:   Compute statistics omitting missing data.
    
    name <- c("Anna", "Ben", NA)
    age  <- c(21, NA, 33)
    sex  <- c("Female", "Male", "Female") 
    dt   <- data.frame(name, age, sex)
    
    is.na(dt)
    sum(is.na(dt))
    mean(is.na(dt))
    na.omit(dt)
    mean(age, na.rm = TRUE)

# 4.4 Putting it all together
# LO:   Combine various statistical techniques to 
    
    # create a data sample of size 100 of normal distribution with mean = 170 and standard devation = 5
    sample_1 <- rnorm(100, 170, 5)
    
    # create a data sample of size 100 of normal distribution with mean = 160 and standard devation = 8
    sample_2 <- rnorm(100, 160, 8)
    
    # calculate mean, variance and quantiles of both data sets
    m_1 <- mean(sample_1)
    m_2 <- mean(sample_2)
    var_1 <- var(sample_1)
    var_2 <- var(sample_2)
    #...

    
    # draw histograms 
    hist(sample_1)
    hist(sample_2)    

    # check if normal
        
    # test if the two samples are even
    
    # compute linear regression model
    
    # predict value for a person ...
    
    
    