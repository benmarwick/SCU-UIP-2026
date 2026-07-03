# SCU-UIP-2026: MCQ and Fill-in-the-Blank Questions

## MCQ and Fill-in-the-Blank Bookends

Format: **Opening** recalls the previous lesson (retrieval practice). **Closing** consolidates the current lesson (elaboration/transfer).

---

### Monday L1

**Opening — orientation baseline (no previous lesson)**
> "When you type `1 + 1` in the RStudio Console and press Enter, R returns:"
> a) `"1 + 1"` &nbsp; b) `2` &nbsp; c) An error &nbsp; d) Nothing
> **Answer: b) 2**

**Closing — consolidate panes**
> "Complete the sentence: The four main panes in a default RStudio layout are Source, ___, ___, and Files/Plots/Help."
> **Answer: Console; Environment / History**

---

### Monday L2

**Opening — recall Mon L1**
> "In RStudio, where do you write code that you want to save as a file?"
> a) Console &nbsp; b) Terminal &nbsp; c) Source / Script pane &nbsp; d) Environment
> **Answer: c)**

**Closing — consolidate read_csv**
> "Which function reads a `.csv` file into R as a tidy tibble?"
> a) `read.csv()` &nbsp; b) `read_csv()` &nbsp; c) `open_csv()` &nbsp; d) `load()`
> **Answer: b) `read_csv()` — note the underscore, not the dot**

---

### Tuesday L1

**Opening — recall Mon L2**
> "After `read_csv('lithics_raw.csv')`, which function shows column names, their types, and a preview of the first values — all in one output?"
> **Fill in: `glimpse()`**

**Closing — consolidate type detection**
> "If `length_mm` appears as `<chr>` instead of `<dbl>` after `read_csv()`, the most likely reason is:"
> a) The file is corrupted &nbsp; b) Some values contain unit suffixes like `'42.3mm'` &nbsp; c) R always imports numbers as text &nbsp; d) The column is empty
> **Answer: b)**

---

### Tuesday L2

**Opening — recall Tue L1**
> "We saw `length_mm` imported as `<chr>`. Which `parse_*` function extracts the number from `'42.3mm'` and discards the units?"
> a) `parse_double()` &nbsp; b) `parse_character()` &nbsp; c) `parse_number()` &nbsp; d) `as.numeric()`
> **Answer: c) `parse_number()`**

**Closing — consolidate cleaning verbs**
> "Fill in the outputs:
> `parse_number('42.3mm')` → ___
> `parse_number('N/A')` → ___
> `na_if(-999, -999)` → ___"
> **Answer: `42.3`; `NA`; `NA`**

---

### Wednesday L1

**Opening — recall Tue L2**
> "We ended Tuesday by saving our clean tibble to disk. Which function did we use, and what file did it produce?"
> a) `save()` → `.RData` &nbsp; b) `write_csv()` → `lithics_clean.csv` &nbsp; c) `export()` → `.xlsx` &nbsp; d) `write.csv()` → `lithics_clean.csv`
> **Answer: b) `write_csv()` → `lithics_clean.csv`**

**Closing — bridge to L2 (chi-square)**
> "Look at the stacked bar chart of raw materials by period. If period and raw material were completely **independent** of each other, what would the three bars look like?"
> **Fill in: identical / the same proportions in every bar**

---

### Wednesday L2

**Opening — recall Wed L1**
> "The boxplot from Lesson 1 showed elongation medians in what order from lowest to highest?"
> a) Upper < Middle < Lower &nbsp; b) Lower < Middle < Upper &nbsp; c) All equal &nbsp; d) Middle > Lower > Upper
> **Answer: b) Lower < Middle < Upper**

**Closing — consolidate inference vocabulary**
> "A Tukey HSD confidence interval for a pairwise comparison that does **not** cross zero means the difference is ___.
> A standardised residual greater than +1.96 in the `ggcorrplot` output means that cell combination was observed ___ often than independence predicts."
> **Answer: statistically significant (p adj < 0.05); more**

---

### Thursday L1

**Opening — recall Wed L2**
> "ANOVA found that elongation differed by period (p < 0.05). What did Tukey HSD add that ANOVA alone could not tell us?"
> a) The overall F-statistic &nbsp; b) Which specific pairs of periods differ from each other &nbsp; c) Whether the data are normally distributed &nbsp; d) The effect size
> **Answer: b)**

**Closing — consolidate PCA interpretation**
> "In the biplot, PC1 is interpreted as overall ___ because length, width, thickness, and weight all load strongly and equally on it.
> PC2 is interpreted as ___ because platform_mm and the length-to-width balance load distinctly on it."
> **Answer: size (artefact size); shape / elongation**

---

### Thursday L2

**Opening — recall Thu L1**
> "We set `scale.unit = TRUE` in `PCA()`. Why is this essential when our variables include both `length_mm` (range ~15–80) and `weight_g` (range ~1–50)?"
> a) It makes the biplot prettier &nbsp; b) It removes missing values &nbsp; c) It prevents variables with larger numeric ranges from dominating the components &nbsp; d) It converts weights to millimetres
> **Answer: c)**

**Closing — synthesis across the week**
> "Name the three formal statistical tests we ran this week, and what each one tested:
> 1. ___ tested whether ___ and ___ are independent
> 2. ___ tested whether mean ___ differs across periods
> 3. ___ visualised whether periods separate in ___ -dimensional morphometric space"
> **Answer: chi-square / platform_prep / period; ANOVA+Tukey / elongation; PCA biplot / five-dimensional**

---

## End-of-Lesson MCQs

---

### Monday L1

**Question: What is an R object?**

1. A named place in R's memory where we store data or results
2. A button in the RStudio menu bar
3. A file on your computer
4. A small clay tablet that stores numbers from ancient Mesopotamia

**Answer: 1) A named place in R's memory where we store data or results**

---

### Monday L2

**Question: You use `read_csv()` to import a file. The file has numbers like "42.3mm". What will R do?**

1. Read it as text (character) because it has letters, not pure numbers
2. Read it as a number and ignore the "mm" part
3. Give an error and stop
4. Send the data to a Roman scribe for manual transcription

**Answer: 1) Read it as text (character) because it has letters, not pure numbers**

---

### Tuesday L1

**Question: In a Quarto document, what is a code chunk?**

1. A special area where you write R code that can run
2. A place to write your name and date
3. A button to save the document
4. A hidden chamber where ancient algorithms are carved in stone

**Answer: 1) A special area where you write R code that can run**

---

### Tuesday L2

**Question: You see raw material names like "Chert" and "chert" in your data. They look the same but are not equal. What function fixes this?**

1. `str_to_lower()`: to make them all the same case
2. `parse_number()`: to extract the numbers
3. `filter()`: to remove the bad ones
4. `call_the_sherd_specialist()`: to verify the original text

**Answer: 1) `str_to_lower()`: to make them all the same case**

---

### Wednesday L1

**Question: In ggplot2, what do the `x =` and `y =` inside `aes()` do?**

1. Tell R which columns to put on the horizontal and vertical axes
2. Set the color of the points
3. Choose the file to read
4. Mark the coordinates of the lost city of Atlantis

**Answer: 1) Tell R which columns to put on the horizontal and vertical axes**

---

### Wednesday L2

**Question: After you run an ANOVA test, why do you run Tukey HSD?**

1. ANOVA tells you *that* groups differ; Tukey tells you *which* groups differ
2. To make the p-value smaller
3. To create a scatter plot
4. To summon the spirit of a Palaeolithic statistician for guidance

**Answer: 1) ANOVA tells you *that* groups differ; Tukey tells you *which* groups differ**
