class CalendarDisplayer
  def initialize(ary_event_to_print)
    @ary_event = ary_event_to_print
  end

  def create_table
    top_and_bottom = "-" * 71
    side = "|" * 5
    puts top_and_bottom
    (0..4).each do |n|
      (1..7).each do |m|
          day = (n * 7 + m)
          if day <= 31
            print "|" + day.to_s + " " * (9 - day.to_s.size)
          else
            print "|" + " " * 9
          end
      end
      print "|\n"
      (0..4).each do |k|
        (1..7).each do |l|
          day2 = (n * 7 + l)
          print_body(day2, k)
        end
          print "|\n"
        end
      puts top_and_bottom
    end
  end

  #print_body ca creer les 9/10 de chaque "case", en gerant l'absence d'event, un seul event ou plusieurs events
  #Avec un seul event je recupere l'heure et le nom de l'event
  #Avec plusieurs event je connais a l'avance le nombre avec la variable count_events
  #Sans event ce jour, je remplis avec des espaces
  def print_body(day2, k)
    print "|"
    count_events = @ary_event.count do |event|
      event.start_date.day == day2
    end
    if count_events == 1
      ary_time_and_name = convert_time_and_name(@ary_event.find{ |event| event.start_date.day == day2})
      temp_str = ary_time_and_name[k]
      if temp_str.nil? == false
        print temp_str + " " * (9 - temp_str.length)
      else
        print " " * 9
      end
    elsif count_events >= 2 && k <= 1
      if k == 0
        print count_events.to_s + " events "
      else
        print "scheduled"
      end
    else
      print " " * 9
    end
  end

  #La methode qui permet de transformer un event en une array avec l'heure, et chaque(s) mot(s) du nom de l'event
  def convert_time_and_name(event_to_print)
    ary_time_and_name = [event_to_print.start_date.strftime("%H:%M%P")]
    ary_time_and_name.push(event_to_print.title.split)
    ary_time_and_name.flatten
  end


end
