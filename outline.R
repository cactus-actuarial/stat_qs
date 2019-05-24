library("e1071")
library("MASS")

### 1. Probability theory techniques

## 1.1 Creating data samples
# LO:   Create random sample of data using simple and stratified approach.
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

## 1.2 Probability of discrete and continuous distributions
# LO:   Compute probabilities and convert probabilities to quantiles.
#       Plot frequency charts and histograms.
    
dnorm(0)
pnorm(0)
qnorm(0.5)
rnorm(4)
    # and:
    # dt, pt, qt, rt | t distribution
    # dbinom, pbinom, qbinom, rbinom | Binomial distribution
    # dchisq, pchisq, qchisq, rchisq | Chi-Squared distribution
    # set.seed() for reproducibility

## 1.3 Central tendency, variation and shape measures
# LO:   Compute central tendency, variation and shape measures for a sample of data.

heights <- c(160, 170, 168, 172, 165, 180)

mean(heights)
median(heights)

var(heights)
sd(heights)

quantile(heights)

skewness(heights)
kurtosis(heights)    

### 2 Statistical tests

## 2.1 Confidence intervals
# LO:   Compute a confidence interval for a mean of a given sample of data.
    # forming a confidence interval for a mean
    x <- sample(1:1000, 50)
    t.test(x)
    
## 2.2 Cental Limit Theorem
# LO:   Demonstrate Central Limit Theorem on an example.
    population <- runif(10^6)
    
    sample_means <- colMeans(matrix(population, ncol = 2000))
    
    hist(population, xlab = "Population")
    hist(sample_means, xlab = "Samples means")
    
## 2.3 Hypothesis testing
# LO:   Apply t-Test to test the mean of a sample and to compare two means.
#       Apply Shapiro test to check normality of data.
    
    x <- rnorm(100)
    
    # testing the mean of a sample (t Test)
    t.test(x, mu = 0)
    
    # testing for normality
    shapiro.test(x)    
    
    # Comparing two means
    y <- rnorm(200)
    t.test(x, y)
    
## 2.4 Comparing more means (one-way ANOVA)
# LO:   Analyze if the groups have significantly different means.
    
oneway.test(x ~ f)
    
### 3. Regression
    
## 3.1 Covariance and correlation
# LO:   Compute correlation and covariance of two datasets.
#       Plot scatterplot of paired observations.
    
cor(x, y)
cov(x, y)

## 3.2 Linear regression
# LO:   Compute a linear regression model.
#       Explain obtained regression statistics.

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
    
## 3.3 Evaluate regression model
# LO:   Predict values based on a linear model.
#       Evaluate correctness of predicted values.

    
## 3.4 Logistic regression
# LO:   Compute logistic regression model.

### 4 Interview tricks
    
## 4.1 Sneak peak into the data
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
    
## 4.2 Visualizing data
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
    
## 4.3 Missing data
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

## 4.4 Putting it all together
# LO:   Combine various statistical techniques to 

# pre-loaded data for the exercise
    
set.seed(1)
sigma = matrix(c(25, 4, 4, 1), nrow = 2)
students <- as.data.frame(round(mvrnorm(n = 1000, mu = c(170, 15), Sigma = sigma)))
colnames(students) <- c("height", "age")
students$rand <- NULL
students$group <- NULL

# final exercise
    
# context:
# Let's combine together various statistical concepts which we have refreshed during the course. 
# The "students" dataset has been preloaded for this exercise and it contains students' age and height.
# Your task will be to analyze this dataset in preperation for your interview.
# Remember that you can divide data into random groups using various methods.
# In this exercise, please purse the method presented in the following example. Assume we've got 4 people:
# c("Anna", "Barbara", "Charlie", "David")
# Let's compute random numbers from range [1:4] and assign them to each person.
# sample(1:4)
# People with even numbers will form the first group and people with odd numbers the second.


# instructions:
# * Have a look at 6 first rows of "students" dataframe and compute quantiles and standard deviation of "age" variable.
# * Perform shapiro test to check normality of "height" variable and draw its histogram.
# * Divide all students into 3 random groups, draw boxplot presenting age splits by groups
#   and check if the means in groups are significantly different from each other using ANOVA.
# * Compute linear regression model (height explained by age) based on groups 1 and 2 and predict height of students in group 3.


    # Look at few first rows of the "students" dataframe 
    head(students)

    # Calculate qunatiles and standard deviation of "age" variable
    quantile(students$age)
    sd(students$age)
    
    # Check if height of students follows normal distribution using shapiro test
    shapiro.test(students$height)    
    
    # Draw a histogram of "height" variable
    hist(students$height)
    
    # Divide all students into three groups. 
    # Set seed equal 1 to ensure reproducibility
    set.seed(1)
    # Assign random number from range 1:1000 to variable "rand" in "students" dataframe
    students$rand <- sample(1:1000)
    # Assign the remainder of the division by 3 plus 1 as "group"
    students$group <- (students$rand %% 3) + 1
    
    # Draw boxplot of age split by groups
    boxplot(age ~ group, data = students)
    
    # Check if the means of groups are significantly different basing on one way ANOVA
    oneway.test(age ~ group, data = students)
    
    # Compute linear regression model explaining height by age based on groups 1 and 2
    m <- lm(height ~ age, data = subset(students, group < 3))

    # Draw scatterplot presenting height against age for groups 1 and 2 and add linear model's function
    plot(height ~ age, data = subset(students, group < 3))
    abline(m)
        
    # Predict height of the students in group 3
    predict(m, data = subset(students, group == 3))
    