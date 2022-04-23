require 'parsi-date'
require 'rspec'
require 'date'



#current day information

puts "What kind of calendar would you like? (for Jalali enter 1 and for Gregorian enter 2)"

tc = gets.chomp

if tc == "1"
    time = Time.now
    pt = time.to_parsi
    puts pt.strftime("%Y/%m/%d")

end

if tc == "2"
    time = Time.now
    puts time.strftime("%Y/%m/%d")

end


#all remaining days

puts "please enter start date (e.g 2020-04-12)"
ds = gets.chomp
sd = Date.parse(ds)

puts "please enter end date (e.g 2021-04-12)"
de = gets.chomp
ed = Date.parse(de)


def day_counter(sd , ed)
    c = sd.upto(ed).select { |date|  date }.count
    puts "all remaining days: #{c}"

end

day_counter sd ,ed



#remaining work days
dayarray = Array[["01","02","03","04","05","06","07","08","09","10","11","12","13"],["14","15"],["22"],["29"]]
montharray = Array["فروردین","خرداد","بهمن","اسفند"]

arr = ds.split('-',3)
parsisd = Time.new(arr.at(0), arr.at(1), arr.at(2)).to_parsi

count = 0
while sd <= ed do
    nday= sd.strftime("%A")
    nm = parsisd.strftime("%B")
    numberday = parsisd.strftime("%d")

    if nday != "Thursday" && nday != "Friday"
        count += 1

    end



    if montharray.include?(nm)

        if  nm == "فروردین" && dayarray.at(0).include?(numberday) && nday != "Thursday" && nday != "Friday"

            count -= 1
        end

        if  nm == "خرداد" && dayarray.at(1).include?(numberday) && nday != "Thursday" && nday != "Friday"

         count -= 1
        end

        if  nm == "بهمن" && dayarray.at(2).include?(numberday) && nday != "Thursday" && nday != "Friday"

           count -= 1
        end

        if  nm == "اسفند" && dayarray.at(3).include?(numberday) && nday != "Thursday" && nday != "Friday"

            count -= 1
        end

    end


    sd = sd + 1
    parsisd = parsisd + 1
end
puts "remaining work days: #{count}"
