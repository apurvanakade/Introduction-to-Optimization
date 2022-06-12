new_linear_combination <- function(coefficients = double(), 
  variable_names = character()) {
  if (missing(variable_names)) {
    variable_names <- paste("x", seq_along(coefficients), sep = "_")
  }
  structure(list(coefficients = coefficients, variable_names = variable_names), 
    class = "linear_combination")
}

str.linear_combination <- function(x) {
  paste(paste(x$coefficients, x$variable_names, sep = " "), collapse = " + ")
}

#

new_constraint <- function(lhs = linear_combination(),
  inequality = character(), rhs = double()) {
  structure(list(lhs = lhs, inequality = inequality, rhs = rhs),
    class = "constraint")
}

str.constraint <- function(x) {
  paste(str(x$lhs), "&", x$inequality, x$rhs, sep = " ")
}

#

new_linear_program_general <- function(
  objective = linear_combination(), constraints = list(), maximize = TRUE) {
  structure(list(objective = objective, constraints = constraints,
    maximize = maximize), class = "linear_program_general")
}

str.linear_program_general <- function(x) {
  if (x$maximize) {
    paste("\\mbox{maximize: }&& ", str(x$objective),
      " & \\\\ \n \\mbox{subject to: } && ",
      paste(lapply(x$constraints, str), collapse = " \\\\ \n && "), sep = "")
  } else {
    paste("\\mbox{maximize: }&& ", str(x$objective),
      " \\\\ \n \\mbox{subject to: } && ",
      paste(lapply(x$constraints, str), collapse = " \\\\ \n && "), sep = "")
  }
}
