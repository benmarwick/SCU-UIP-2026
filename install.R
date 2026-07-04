# install.R

# --- 1. Setup User Library ---
# We use a user library to ensure our packages override any outdated 
# packages pre-installed in the base Docker image's system library.
user_lib <- "~/R/library"
dir.create(user_lib, recursive = TRUE, showWarnings = FALSE)
.libPaths(c(user_lib, .libPaths()))

# --- 2. Fix the C-API Version Mismatch ---
# Force-recompile core tidyverse dependencies from source to fix the 
# 'undefined symbol: SETLENGTH' error caused by the new R version.
install.packages(c("vctrs", "rlang", "cli", "glue", "lifecycle"), 
                 lib = user_lib, 
                 type = "source",
                 repos = "https://cloud.r-project.org")

# --- 3. Install Workshop Packages ---
packages <- c(
  # Core tidyverse and plotting
  'tidyverse', 'ggcorrplot', 'broom', 'GGally', 'cowplot', 'ggbeeswarm',
  'plotrix', 'RColorBrewer', 'viridis',
  # Stats and Multivariate
  'FactoMineR', 'factoextra', 'performance', 'FSA', 'infer',
  # Data and Misc
  'here', 'readxl', 'rio', 'Rmisc', 'quarto', 'plyr', 'pbapply', 'remotes'
)

install.packages(packages, 
                 lib = user_lib, 
                 repos = "https://cloud.r-project.org")