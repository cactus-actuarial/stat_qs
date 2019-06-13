library(ggplot2)

set.seed(1)

# d - dwarves
# o - ogres
# g - goblins

m_d <- 250
m_o <- 83.9
m_g <- 84.1

sd_d <- 10
sd_o <- 4
sd_g <- 5

# ls - life span

sample_size = 1000

ls_d <- rnorm(n = sample_size, mean = m_d, sd = sd_d)
ls_o <- rnorm(n = sample_size, mean = m_o, sd = sd_o)
ls_g <- rnorm(n = sample_size, mean = m_g, sd = sd_g)

# combine data

lifespan <- c(ls_d, ls_o, ls_g)
race <- c(rep("dwarf", sample_size), rep("ogre", sample_size), rep("goblin", sample_size))

creatures <- data.frame(lifespan, race)

samp <- sample(1:dim(creatures)[1], size = 6)
data.frame(round(creatures$lifespan[samp]), creatures$race[samp])

# summary

summary(creatures)

summary(split(creatures, race)$dwarf)
summary(split(creatures, race)$goblin)
summary(split(creatures, race)$ogre)

# visualize

ggplot(creatures, aes(x = lifespan, y = ..density..)) +
    geom_histogram(binwidth = 1) +
    facet_grid(race ~ .) +
    scale_x_continuous(breaks = seq(from = 50, to = 290, by = 20))

boxplot(lifespan ~ race, data = creatures,
        main = "Lifespan of races",
        xlab = "Race",
        ylab = "Lifespan")

# check normality

shapiro.test(as.matrix(subset(creatures, race == "dwarf", select = "lifespan")))
shapiro.test(as.matrix(subset(creatures, race == "ogre", select = "lifespan")))
shapiro.test(as.matrix(subset(creatures, race == "goblin", select = "lifespan")))

# one-way ANOVA

oneway.test(lifespan ~ race, data = creatures)

oneway.test(lifespan ~ race, data = subset(creatures, race != "dwarf"))
oneway.test(lifespan ~ race, data = creatures, subset = which(creatures$race != "dwarf"))

# Robust ANOVA (Kruskal-Wallis test)
# sea cruise, weak / strong stomach

rating_weak   <- c(sapply(sapply(rpois(sample_size * 8 / 16, 2), max, 1), min, 10), floor(runif(sample_size * 8 / 16, min = 1, max = 4)))
rating_strong <- c(sapply(sapply(rpois(sample_size * 8 / 16, 9), max, 1), min, 10), floor(runif(sample_size * 8 / 16, min = 8, max = 11)))

rating <- c(rating_weak, rating_strong)
stomach <- c(rep("weak", sample_size), rep("strong", sample_size))

cruise_ratings <- data.frame(rating, stomach)

ggplot(cruise_ratings, aes(x = rating)) +
    geom_histogram(binwidth = 0.5) +
    scale_x_continuous(breaks = seq(from = 0, to = 10, by = 1)) +
    facet_grid(stomach ~ .)

kruskal.test(rating ~ stomach, data = cruise_ratings)


