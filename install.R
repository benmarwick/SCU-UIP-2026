# install.R

# Define the global system library path. 
# This ensures packages are visible to the 'jovyan' user when Binder launches.
sys_lib <- "/usr/local/lib/R/site-library"

# 1. Fix the C-API mismatch by recompiling core dependencies from source.
# This overwrites the broken pre-installed versions in the base image.
install.packages(c("vctrs", "rlang", "cli", "glue", "lifecycle"), 
                 lib = sys_lib, 
                 type = "source",
                 repos = "https://cloud.r-project.org")

# 2. Install the rest of the workshop packages
packages <- c(
  'tidyverse', 'ggcorrplot', 'broom', 'GGally', 'cowplot', 'ggbeeswarm',
  'plotrix', 'RColorBrewer', 'viridis',
  'FactoMineR', 'factoextra', 'performance', 'FSA', 'infer',
  'here', 'readxl', 'rio', 'Rmisc', 'quarto', 'plyr', 'pbapply', 'remotes'
)

install.packages(packages, 
                 lib = sys_lib, 
                 repos = "https://cloud.r-project.org")