#La classe Event, qui sert a construire un event

class Event
  attr_accessor :start_date
  attr_accessor :duration #en minutes
  attr_accessor :title
  attr_accessor :attendees

  def initialize(start_date_to_save, duration_to_save, title_to_save, attendees_to_save)
    @start_date = Time.parse(start_date_to_save)
    @duration = duration_to_save
    @title = title_to_save
    @attendees = attendees_to_save
  end

  #postpone_24h ajoute 24h a la date de l'event
  def postpone_24h
    self.start_date += 24 * 60 * 60
  end

  #end_date retourne la date de fin d'event
  def end_date
    self.start_date + duration * 60
  end

  def is_past?
    self.start_date < Time.now ? true : false
  end

  def is_future?
    self.start_date > Time.now ? true : false
  end

  def is_soon?
    Time.now - start_date <= 30 * 60 
  end

  #to_s permet d'afficher proprement chaque variable de l'event
  def to_s
    print "\n >Titre : #{self.title}\n>Date de debut : #{self.start_date.strftime("%Y-%m-%d %H:%M")}\n>Duree : #{self.duration} minutes\n>Invites : "
    attendees.each { |attendee|  (attendee != attendees.last) ? (print attendee + ", ") : (puts attendee)}
  end
end
