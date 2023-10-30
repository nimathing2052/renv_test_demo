# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the Titanic dataset from the 'titanic' package
data("Titanic", package = "datasets")

# Convert the dataset to a data frame for easier manipulation
titanic_df <- as.data.frame(Titanic)

# Display the first few rows of the data
head(titanic_df)

# Filter the data to show only passengers who survived
survivors <- titanic_df %>%
  filter(Survived == "Yes")

# Calculate the count of survivors by passenger class
survivor_counts <- survivors %>%
  group_by(Class) %>%
  summarise(Count = sum(Freq))

# Create a bar plot to visualize the survivor counts by class
ggplot(data = survivor_counts, aes(x = Class, y = Count, fill = Class)) +
  geom_bar(stat = "identity") +
  labs(title = "Number of Titanic Survivors by Class", x = "Class", y = "Count")