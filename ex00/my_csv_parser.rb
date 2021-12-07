def my_csv_parser (param_1, param_2)
    array = param_1.split("\n")
    for i in 0...array.length
        array[i] = array[i].split(param_2)
    end
    return array
end
