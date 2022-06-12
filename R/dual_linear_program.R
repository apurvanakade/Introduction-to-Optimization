new_dual_linear_program <- function(obj = list(), A = list(),
  b = list(), variables = list()) {
  if (missing(variables)) {
    variables <- paste("x", seq_along(obj), sep = "_")
  }
  structure(
    list(obj = obj, A = A, b = b,
      variables = variables),
    class = "dual_linear_program")
}

str.dual_linear_program <- function(x) {
  objective <- paste0("\\mbox{minimize: } & ", paste0(x$obj, x$variables, collapse = " & + & "), " \\\\ \n")

  # combine coefficients and variables
  constraints <- 
  paste("\\mbox{subject to: }",
    paste(" &", 
      paste(
        apply(matrix(paste0(t(x$A), x$variables), nrow = length(x$b), byrow = TRUE), 
        1, 
        paste,
        collapse = " & + & "), 
      x$b, sep = " & \\ge & "), 
    " \\\\ \n", collapse = ""), 
  collapse = "")

  #print positivity constraints
  positivity_constraints <- paste0(paste(x$variables, collapse = ", \\: "), " \\ge 0")

  paste0("\\begin{array}{rrrr",paste(replicate(length(x$variables), "rr"), collapse=""),"}\n", objective, constraints, "\\end{array}\n \\\\ \n", positivity_constraints)
    
}