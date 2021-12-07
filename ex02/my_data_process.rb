require 'json'

def add_data_to_hash (index, key, csv, hash)
    content = Hash.new(0)
    for line in 1...csv.length
        values = csv[line].split(",")
        content[values[index]] += 1
    end
    hash[key] = content
end

def my_data_process (csv_content)
    list = {}
    add_data_to_hash(0, "Gender", csv_content, list)
    add_data_to_hash(4, "Email", csv_content, list)
    add_data_to_hash(5, "Age", csv_content, list)
    add_data_to_hash(6, "City", csv_content, list)
    add_data_to_hash(7, "Device", csv_content, list)
    add_data_to_hash(9, "Order At", csv_content, list)
    return list.to_json
end

# my_data_process(["Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At", "Male,Carl,Wilderman,carl,yahoo.com,21->40,Seattle,Safari iPhone,2,afternoon", "Male,Marvin,Lind,marvin,hotmail.com,66->99,Detroit,Chrome Android,2,afternoon", "Female,Shanelle,Marquardt,shanelle,hotmail.com,21->40,Las Vegas,Chrome,1,afternoon", "Female,Lavonne,Romaguera,lavonne,yahoo.com,66->99,Seattle,Chrome,2,morning", "Male,Derick,McLaughlin,derick,hotmail.com,41->65,Chicago,Chrome Android,1,afternoon"])
# ruby my_data_process.rb

