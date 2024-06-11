df <- data.frame(product = c('A','B','C','D','E'), Price = c(612, 447, NA, 374, 831))

df

df1 <- df$Price[is.na(df$Price)] <- 0

df

df$Price[is.na(df$Price)] <- mean(df$Price, na.rm = TRUE)

df$Price[is.na(df$Price)] <- median(df$Price, na.rm = TRUE)

data()

#installing titanic packages
install.packages('titanic')
#loading the library
library(titanic)
# Load the 'Titanic' dataset from R's built-in datasets
data("Titanic")
# The 'Titanic' dataset is a table, convert it to a data frame for 
summary
titanic_df <- as.data.frame(Titanic)
# Summarize the 'titanic_df' data frame
summary(titanic_df)

titanic_train$Age

library(ggplot2)
library(dplyr)
library(cowplot)

data("titanic_train", package = "titanic")

ggplot(titanic_train, aes(Age)) +
  geom_histogram(color = "#000000", fill = "#0099F8") +
  ggtitle("Variable distribution") +
  theme_classic() +
  theme(plot.title = element_text(size = 18))

value_imputed <- data.frame(
  original = titanic_train$Age,
  imputed_zero = replace(titanic_train$Age,
                         is.na(titanic_train$Age), 0),
  imputed_mean = replace(titanic_train$Age,
                         is.na(titanic_train$Age), mean(titanic_train$Age, na.rm = TRUE)),
  imputed_median = replace(titanic_train$Age,
                           is.na(titanic_train$Age), median(titanic_train$Age, na.rm =
                                                              TRUE))
)
value_imputed



h1 <- ggplot(value_imputed, aes(x = original)) +
  geom_histogram(fill = "#ad1538", color = "#000000", position =
                   "identity") +
  ggtitle("Original distribution") +
  theme_classic()
h2 <- ggplot(value_imputed, aes(x = imputed_zero)) +
  geom_histogram(fill = "#15ad4f", color = "#000000", position =
                   "identity") +
  ggtitle("Zero-imputed distribution") +
  theme_classic()
h3 <- ggplot(value_imputed, aes(x = imputed_mean)) +
  geom_histogram(fill = "#1543ad", color = "#000000", position =
                   "identity") +
  ggtitle("Mean-imputed distribution") +
  theme_classic()
h4 <- ggplot(value_imputed, aes(x = imputed_median)) +
  geom_histogram(fill = "#ad8415", color = "#000000", position =
                   "identity") +
  ggtitle("Median-imputed distribution") +
  theme_classic()
plot_grid(h1, h2, h3, h4, nrow = 2, ncol = 2)


library(mice)
titanic_numeric <- titanic_train %>%
  select(Survived, Pclass, SibSp, Parch, Age)
md.pattern(titanic_numeric)


mice_imputed <- data.frame(
  original = titanic_train$Age,
  imputed_pmm = complete(mice(titanic_numeric, method =
                                "pmm"))$Age,
  imputed_cart = complete(mice(titanic_numeric, method =
                                 "cart"))$Age,
  imputed_lasso = complete(mice(titanic_numeric, method =
                                  "lasso.norm"))$Age)
mice_imputed

h01 <- ggplot(mice_imputed, aes(x = original)) +
  geom_histogram(fill = "#ad1538", color = "#000000", position =
                   "identity") +
  ggtitle("Original distribution") +
  theme_classic()
h02 <- ggplot(mice_imputed, aes(x = imputed_pmm)) +
  geom_histogram(fill = "#15ad4f", color = "#000000", position =
                   "identity") +
  ggtitle("PMM-imputed distribution") +
  theme_classic()
h03 <- ggplot(mice_imputed, aes(x = imputed_cart)) +
  geom_histogram(fill = "#1543ad", color = "#000000", position =
                   "identity") +
  ggtitle("CART-imputed distribution") +
  theme_classic()
h04 <- ggplot(mice_imputed, aes(x = imputed_lasso)) +
  geom_histogram(fill = "#ad8415", color = "#000000", position =
                   "identity") +
  ggtitle("LASSO-imputed distribution") +
  theme_classic()
plot_grid(h01, h02, h03, h04, nrow = 2, ncol = 2)


library(missForest)

missForest_imputed <- data.frame(
  original=titanic_numeric$Age,
  imputed_missForest=missForest(titanic_numeric)$ximp$Age
)
missForest_imputed


h0m1 <- ggplot(missForest_imputed, aes(x = original)) +
  geom_histogram(fill = "#ad1538", color = "#000000", position =
                   "identity") +
  ggtitle("Original distribution") +
  theme_classic()
h0m2 <- ggplot(missForest_imputed, aes(x = imputed_missForest)) +
  geom_histogram(fill = "#15ad4f", color = "#000000", position =
                   "identity") +
  ggtitle("missForest distribution") +
  theme_classic()

plot_grid(h0m1, h0m2, nrow = 1, ncol = 2)

library(titanic)
log_scale<-log(titanic_train$Fare)

log_data<-data.frame(Fare=log_scale)

ggplot(log_data, aes(x=1:nrow(log_data), y=Fare)) +
  geom_point()+
  scale_y_continuous(trans='log')+
  ggtitle("Scatter plot with logarithmic scale")

log_scale = log(as.data.frame(titanic_train$Fare))

library(ggplot2)
library(titanic)
library(caret)
library(lattice)

process <- preProcess(as.data.frame(titanic_train$Fare),
                      method=c("range"))
norm_scale <- predict(process, as.data.frame(titanic_train$Fare))

scale_data<- as.data.frame(scale(titanic_train$Fare))

log_scale<- log(titanic_train$Fare)

log.data<-data.frame(Fare=log_scale)
