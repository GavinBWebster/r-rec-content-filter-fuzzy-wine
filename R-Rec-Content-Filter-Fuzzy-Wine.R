# Load library
library(data.table)
# Get data
wine.data <- fread('https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data')
# Show top 10 lines of dataset
head(wine.data)
# Show distribution of cultivars (col V1)
table(wine.data$V1)
# Extract col 1 (just the cultivars) to wine.type 
wine.type <- wine.data[,1]
# Extract all other columns (the wine properties) to wine.features
wine.features <- wine.data[,-1]
# Scale the feature data
wine.features.scaled <- data.frame(scale(wine.features))
# Convert dataframe to a matrix
wine.mat <- data.matrix(wine.features.scaled)
# Add row names (seq numbers)
rownames(wine.mat) <- seq(1:dim(wine.features.scaled)[1])
# Show first two rows
wine.mat[1:2,]
# Find the Pearson Coefficient between the rows.
# Transpose matrix
wine.mat <- t(wine.mat)
# Find the similarity matrix
cor.matrix <- cor(wine.mat, use = "pairwise.complete.obs", method = "pearson")
dim(cor.matrix)
cor.matrix[1:5,1:5]
# -1 = perfect negative correlation, +1 = perfect positive correlation
# Create recommendation for User looking at Wine 3
user.view <- wine.features.scaled[3,]
user.view
sim.items <- cor.matrix[3,]
sim.items
sim.items.sorted <- sort(sim.items, decreasing = TRUE)
sim.items.sorted[1:5]
# Confirm top 5
rbind(wine.data[3,]
,wine.data[52,]
,wine.data[51,]
,wine.data[85,]
,wine.data[15,]
)
