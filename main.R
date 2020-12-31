library(tidyverse)
library(Rtsne)
library(here)

# To be defined...
data_file <- "<...>.tsv"
label_file <- "<...>.tsv"

# Import TSV file
data <- read_tsv(here("data", data_file), col_names = FALSE)
labels <- read_tsv(here("data", label_file), col_names = FALSE)

# Calculate T-SNE
set.seed(42)
tsne_out <- Rtsne(
  data,
  perplexity = min(30, as.integer(nrow(embeddings - 1) / 3))
)

# Plot T-SNE
data.frame(
  x = tsne_out$Y[, 1],
  y = tsne_out$Y[, 2],
  label = labels$X1
) %>%
  ggplot() +
  geom_point(aes(x = x, y = y, color = label))
