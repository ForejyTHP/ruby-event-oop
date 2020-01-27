# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/user'
require_relative 'lib/event'
require_relative 'lib/event_creator'
require_relative 'lib/calendar_displayer'


# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.

def perform
  #Ca c'est pour tester la classe User, 2 users sont crees
  user_test = User.new("nom_test@email.com", 42)
  user_test2 = User.new("nom_test2@email.com", 56)
  p User.all

  #Test la methode find_by_email
  user_founded_by_email = User.find_by_email("nom_test2@email.com")
  p user_founded_by_email.age

  #Test la classe Event, avec chaque variable
  event_test = Event.new("2010-10-31 12:00", 30, "standup quotidien", ["truc@machin.com", "bidule@chose.fr"])
  event_test.postpone_24h
  p event_test.start_date
  p event_test.duration
  p event_test.title
  p event_test.attendees

  #Test les differentes methodes :end_date, is_past?, is_soon? et to_s
  p event_test.end_date
  p event_test.is_past?

  event_test.start_date = Time.now - 20*30
  p event_test.is_soon?

  event_test.to_s
  event_creator_test = Event_creator.new.event
  event_creator_test.to_s


  #Et ici c'est pour tester la classe CalendarDisplayer, et oui c'etait galere mais ca marche X)
  event_1 = Event.new("2010-10-31 11:00", 30, "standup quotidien", ["truc@machin.com", "bidule@chose.fr"])
  event_2 = Event.new("2010-10-30 10:00", 30, "standup quotidien", ["truc@machin.com", "bidule@chose.fr"])
  event_3 = Event.new("2010-10-29 15:00", 30, "standup quotidien test", ["truc@machin.com", "bidule@chose.fr"])
  event_4 = Event.new("2010-10-28 12:00", 30, "standup quotidien", ["truc@machin.com", "bidule@chose.fr"])
  event_5 = Event.new("2010-10-01 01:00", 30, "standup quotidien", ["truc@machin.com", "bidule@chose.fr"])
  event_6 = Event.new("2010-10-10 02:00", 30, "standup test", ["truc@machin.com", "bidule@chose.fr"])
  event_7 = Event.new("2010-10-31 09:00", 30, "standup quotidien", ["truc@machin.com", "bidule@chose.fr"])
  event_8 = Event.new("2010-10-12 12:00", 30, "standup test", ["truc@machin.com", "bidule@chose.fr"])
  event_9 = Event.new("2010-10-12 12:00", 30, "standup test test", ["truc@machin.com", "bidule@chose.fr"])
  event_10 = Event.new("2010-10-12 12:00", 30, "standup test test", ["truc@machin.com", "bidule@chose.fr"])
  event_11 = Event.new("2010-10-12 12:00", 30, "standup test test", ["truc@machin.com", "bidule@chose.fr"])
  event_12 = Event.new("2010-10-12 12:00", 30, "standup test test", ["truc@machin.com", "bidule@chose.fr"])
  event_13 = Event.new("2010-10-12 12:00", 30, "standup test test", ["truc@machin.com", "bidule@chose.fr"])
  event_14 = Event.new("2010-10-12 12:00", 30, "standup test test", ["truc@machin.com", "bidule@chose.fr"])
  ary_events = [event_1, event_2, event_3, event_4, event_5, event_6, event_7, event_8, event_9, event_10, event_11, event_12, event_13, event_14,]
  calendar = CalendarDisplayer.new(ary_events)
  calendar.create_table
end

perform