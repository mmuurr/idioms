## The high-level idiom is:
## tbl %>% pmap(function(...) something(list(...))

library(tidyverse)

f1 <- function(x) x
f2 <- function(x) x^2

## make iris small (and a tibble) for the example:
iris <- iris %>% as_tibble() %>% head()

## Example 1:
## Walk through the rows and call a function based on Sepal.Length.
iris %>% pmap_dbl(function(...) with(list(...), {
    if(Sepal.Length < 5) {
        f1(Sepal.Width)
    } else {
        f2(Sepal.Width)
    }
}))

## Example 2:
## Create a JSON-representation of each row (but not the whole dataframe):
iris %>% pmap_chr(function(...) jsonlite::toJSON(list(...), auto_unbox = TRUE))
