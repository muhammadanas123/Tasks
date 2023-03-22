require 'csv'

class Problem
    attr_reader :arr
    def initialize
        @arr = []
        13.times { |i| @arr[i]=rand(1..10)}
    end

    #task 1
    def frequency
        occur = {}
        count = 0
        for i in @arr
            for j in @arr
                if i==j
                    count+=1
                end
            end
            occur[i]=count
            count=0
                end
        occur
    end

    #task 1
    def running_sum(*arr)
        result = []
        result[0] = arr[0]
        arr.each_with_index do |item, index|
            if index>0
                result[index] = result[index-1]+arr[index]
            end
        end
        result
    end

    #task 3
    def stored_password
        password = ""
        CSV.open("passwords.csv", "w") do |csv|
            10.times do |i|
                password = gets
                csv << [i,password]
                password = ""
            end
        end
    end

    def password_generator
        table = CSV.parse(File.read("passwords.csv"), headers: true)
        passwords = table.by_col[1]
        # puts passwords
        another_password = gets
        flag = 0
        for i in passwords
            if another_password==i
                puts "password already exist"
                flag = 1
            end
        end
        last_index = table.by_col[0][-1].to_i
        if flag==0
            CSV.open("passwords.csv", "a") do |csv|
                csv << [last_index+1,another_password]
            end
        end
    end
end


prob = Problem.new
# puts prob.arr
# puts prob.frequency

# puts prob.running_sum(1, 2, 3, 4, 5)





