#if condtion very highly used because of many option
# case condtion is very less used


#### Simple IF
# if [ expression ]: then
#     command
# fi

#### Else IF
# if [ expression ]: then
#     command
# else
#    command
####
# if [ expression1 ]: then
#     command
# elif [ expression2 ]: then
#    command
# elif [ expression3 ]: then
#    command
# else 
#     command
# fi

# Expression are three type Numbers ,String
# 1. Number Comparsion
# Operatior -eq, -nq, -le, -lt, -ge, -gt
# [ 1 -eq 1 ]
a=10
if [ "$a" -lt 100 ]; then
    echo $a less than 100
fi

#2. String Comparsion
# Operatior = , != , -z 
# [ -z $x ] --. This is true if x is not declared
if [ -z "$x" ]; then
    echo z is empty
fi

# 3 File checks 
# Operator: -e , -x , -f 