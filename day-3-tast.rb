class Problem
    attr_reader :arr
    def initialize
        @arr = []
        13.times { |i| @arr[i]=rand(1..10)}
    end


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
end


prob = Problem.new
# puts prob.arr
# puts prob.frequency

puts prob.running_sum(1, 2, 3, 4, 5)
