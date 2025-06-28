#User Inputs
# Before SCRIPT
# LHS SCRIPT RHS

# Before script - Environment Variables
# LHS 
# RHS - Special variables

# On cli , I send the variable using the following command.
# export a_env=10000
# bash 02-variable.sh
echo Env Variable - a_env - ${a_env}


# LHS
# On cli, I send the variable using the following command.
# a_lhs=1000 bash 02-variable.sh
echo LHS variable a_lhs - ${a_lhs}


# RHS           - Special Variables

## Special Variables
# $1 - First Value OF RHS
# $2 - Second Value of RHS
# $# - Count Number of Values
# $* - All Values
# $0 - filename

# On cli, We will access the variable using the following command.
# bash 02-variable.sh 1000 abc
echo First Value - $1
echo Second Value - $2
echo All Values - $*
echo Number of Values is - $#

# Variable Substitution
# Syntax: var=$(command)
DATE=$(date)

echo Date - $DATE

# Arithmetic Substitution
# Syntax: var=$((expr))
ADD=$((2+4))

echo Added Value - $ADD


# Variable Name Characters
# a-z, A-Z, 0-9, _