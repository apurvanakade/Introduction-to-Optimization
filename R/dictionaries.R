new_dictionary <- function(
  objective = list(), 
  coefficients = matrix(), 
  constants = list(),
  basic_variables = list(), 
  non_basic_variables = list()) {
  structure(list(objective = round(objective, digits = 4), 
      coefficients = round(coefficients, digits = 4), 
      constants = round(constants, digits = 4),
      non_basic_variables = non_basic_variables,
      basic_variables = basic_variables), 
    class = "dictionary")
  }

str.dictionary <- function(x) {
  # print objective
  objective <- paste0("\\mbox{maximize: } & \\zeta &=&", x$objective[[1]], "& + &", paste0(x$objective[2:length(x$objective)], x$non_basic_variables, collapse = " &+& "), " \\\\ \n")

  # combine coefficients and variables
  coefficients <- 
    apply(
      t(matrix(paste0(t(x$coefficients), x$non_basic_variables), nrow = length(x$non_basic_variables))), 
      1, paste0, collapse = " & - &")

  # print constraints
  constraints <- paste0("\\mbox{subject to: }", 
    paste0(" & ", x$basic_variables, " & = & ", x$constants, " & - &", coefficients, " \\\\ \n", collapse = ""), 
    collapse = "")
  
  #print positivity constraints
  positivity_constraints <- paste0(paste(paste(x$non_basic_variables, collapse = ", \\: "), paste(x$basic_variables, collapse = ", \\: "), sep = ", \\: "), " \\ge 0")
  
  paste0("\\begin{array}{rrrr",paste(replicate(length(x$non_basic_variables), "rr"), collapse=""),"}\n", objective, constraints, "\\end{array}\n \\\\ \n", positivity_constraints)

  # coefficients
}