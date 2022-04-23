require 'rspec'
require 'date'
require 'parsi-date'

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
    puts "all remaining days; #{c}"

end

day_counter sd ,ed


#remaining work days

c = sd.upto(ed).select{ |d| d.saturday? || d.sunday? || d.monday? || d.tuesday? || d.wednesday? }.count
puts "remaining work days : #{c}"
