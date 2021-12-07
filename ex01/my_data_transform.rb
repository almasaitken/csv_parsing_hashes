require 'date'

def my_data_transform (csv_content)
    string = []
    index_num = 0
    for line in csv_content.split("\n")
        values = line.split(",")
        if (index_num>0)
            values[4] = values[4].split("@")[1]
            if ((values[5].to_i >= 1) & (values[5].to_i <= 20))
                values[5] = "1->20"
            end
            if ((values[5].to_i >= 21) & (values[5].to_i <= 40))
                values[5] = "21->40"
            end
            if ((values[5].to_i >= 41) & (values[5].to_i <= 65))
                values[5] = "41->65"
            end
            if ((values[5].to_i >= 66) & (values[5].to_i <= 99))
                values[5] = "66->99"
            end
            time = DateTime.parse(values[9], "%Y-%m-%d %H:%M:%S")
            if ((time.hour >= 6) & (time.hour<12))
                values[9] = "morning"
            end
            if ((time.hour >= 12) & (time.hour<18))
                values[9] = "afternoon"
            end
            if ((time.hour >= 18) & (time.hour<=23))
                values[9] = "evening"
            end
        end  
        string[index_num] = values.join(",")
        index_num += 1
    end
    return string
end

# my_data_transform("Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At\nMale,Carl,Wilderman,carl,wilderman_carl@yahoo.com,29,Seattle,Safari iPhone,2,2020-03-06 16:37:56\nMale,Marvin,Lind,marvin,marvin_lind@hotmail.com,77,Detroit,Chrome Android,2,2020-03-02 13:55:51\nFemale,Shanelle,Marquardt,shanelle,marquardt.shanelle@hotmail.com,21,Las Vegas,Chrome,1,2020-03-05 17:53:05\nFemale,Lavonne,Romaguera,lavonne,romaguera.lavonne@yahoo.com,81,Seattle,Chrome,2,2020-03-04 10:33:53\nMale,Derick,McLaughlin,derick,mclaughlin.derick@hotmail.com,47,Chicago,Chrome Android,1,2020-03-05 15:19:48\n")

# ruby ex01/my_data_transform.rb
