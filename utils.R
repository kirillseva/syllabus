has_name <- function(x, nm) {
  if (is.null(names(x)))
    return(FALSE)

  nm %in% names(x)
}

`%||%` <- function(x, y) if (is.null(x)) y else x


books <- read_csv(
  "books/books.csv",
  col_types = cols(
    id = col_character(),
    title = col_character(),
    href = col_character(),
    depth = col_integer()
  )
)

find_book <- function(x) {
  match <- books$id == x
  if (!any(match)) {
    stop("Couldn't find book: '", x, "'", call. = FALSE)
  }

  as.list(books[match, , drop = FALSE])
}

indent <- function(text, by = 2) {
  ind <- strrep(" ", by)

  paste(ind, gsub("\n", paste0("\n", ind), text))
}
