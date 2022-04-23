require 'rspec'
require 'date'
require 'parsi-date'

#current day information

puts "What kind of calendar would you like? (Jalali or Gregorian)"

c = gets.chomp

if c == "Jalali"
    time = Time.now
    pt = time.to_parsi
    puts pt.strftime("%Y/%m/%d")

end

if c == "Gregorian"
    time = Time.now
    puts time.strftime("%Y/%m/%d")

end


#all remaining days

puts "please enter start date (e.g 2020,04,12)"
ds = gets.chomp
a = ds.split(',',3)

puts "please enter end date (e.g 2021,04,12)"
de = gets.chomp
b = de.split(',',3)


def day_counter(b , a)
    c = Integer Date.new(b.at(0).to_i,b.at(1).to_i,b.at(2).to_i) - Date.new(a.at(0).to_i,a.at(1).to_i,a.at(2).to_i)
    puts c
end

day_counter b ,a


#remaining work days

count = 0

dsobj = Date.parse ds

deobj = Date.parse de


while dsobj <= deobj do
    nday= dsobj.strftime("%A")

    if nday != "Thursday" && nday != "Friday"
        count+= 1

    end

    dsobj = dsobj + 1

end
puts count
