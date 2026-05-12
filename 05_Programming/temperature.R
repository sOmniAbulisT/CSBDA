convert_temperature <- function(temperature, degree){
    if(degree == "F"){
        answer <- temperature * 9 / 5 + 32
    } else {
        answer <- (temperature - 32) * 5 / 9
    }

    return(answer)
} # we can do better

#--- Consider the argument "degree" is NULL ---#
convert_temperature <- function(temperature, degree){
    if(degree == "F"){
        answer <- temperature * 9/5 + 32
    }else if(degree == "C"){
        answer <- (temperature - 32) * 5 / 9
    }else{
        answer <- NA
    }

    return(answer)
}

#--- If the temperature goes to infinity (number is too big or small) ---#
convert_temperature <- function(temperature, to_degree){
    to_degree <- toupper(to_degree)
    if(to_degree == "F"){
        answer <- temperature * 9/5 + 32
    }else if(to_degree == "C"){
        answer <- (to_degree - 32) * 5 / 9
    }else{
        answer <- NA
    }

    return(answer)
}

#--- What the avaliable option ---#
convert_temperature <- function(temperature, to_degree){
    to_degree <- toupper(to_degree)
    to_degree <- match.arg(to_degree, choices = c("C", "F"))

    if(to_degree == "F"){
        answer <- temperature * 9/5 + 32
    }else if(to_degree == "C"){
        answer <- (to_degree - 32) * 5 / 9
    }else{
        answer <- NA
    }

    return(answer)
}
