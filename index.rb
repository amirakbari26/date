require 'parsi-date'
require 'rspec'
require 'date'


class Date

    def current_day_information
        puts "please enter desired format calendar (for Jalali enter 1 and for Gregorian enter 2))"

        @tc = gets.chomp

        if @tc == "1"
            time = Time.now
            pt = time.to_parsi
            puts pt.strftime("%Y/%m/%d")

        end

        if @tc == "2"
            time = Time.now
            puts time.strftime("%Y/%m/%d")

        end
    end


    def remaining_days

        #all remaining days

        puts "please enter desired format calendar (for Jalali enter (1) and for Gregorian enter (2) )"
        @desired_format = gets.chomp

        if @desired_format == "1"
            puts "please enter start date (e.g 1401-04-12)"
            @ds = gets.chomp
            @sd = Date.parse(@ds)

            puts "please enter end date (e.g 1401-08-26)"
            @de = gets.chomp
            @ed = Date.parse(@de)
            @parsisd = Parsi::Date.parse @ds

        end

        if @desired_format == "2"
            puts "please enter start date (e.g 2021-04-12)"
            @ds = gets.chomp
            @sd = Date.parse(@ds)

            puts "please enter end date (e.g 2022-04-12)"
            @de = gets.chomp
            @ed = Date.parse(@de)

            @arr = @ds.split('-',3)
            @parsisd = Time.new(@arr.at(0), @arr.at(1), @arr.at(2)).to_parsi

        end


        @c = @sd.upto(@ed).select { |date|  date }.count
        puts "all remaining days: #{@c}"



        # remaining work days

        @dayarray = Array[["01","02","03","04","05","06","07","08","09","10","11","12","13"],["14","15"],["22"],["29"]]
        @montharray = Array["فروردین","خرداد","بهمن","اسفند"]



        @count = 0
        while @sd <= @ed
            @nday= @sd.strftime("%A")
            @nm = @parsisd.strftime("%B")
            @numberday = @parsisd.strftime("%d")

            if @nday != "Thursday" && @nday != "Friday"
                @count += 1

            end

            @sd = @sd + 1
            @parsisd = @parsisd + 1


            next if @nday == "Thursday" || @nday == "Friday"

            if @montharray.include?(@nm)

                if  @nm == "فروردین" && @dayarray.at(0).include?(@numberday)

                    @count -= 1
                end

                if  @nm == "خرداد" && @dayarray.at(1).include?(@numberday)

                    @count -= 1
                end

                if  @nm == "بهمن" && @dayarray.at(2).include?(@numberday)

                    @count -= 1
                end

                if  @nm == "اسفند" && @dayarray.at(3).include?(@numberday)

                    @count -= 1
                end

            end


        end

        puts "remaining work days: #{@count}"

    end
end

date = Date.new


puts"for receive current day information enter (1) and
for receive number of all remaining days and remaining work days enter (2)"
    request = gets.chomp

    if request == "1"
        date.current_day_information

    end

    if request == "2"
        date.remaining_days
    end
