#Classe permettant de creer un evenetement en interagissant avec l'utilisateur

class Event_creator
  attr_accessor :event

  def initialize
    print  " Salut, tu veux creer un evenement ? Cool !\nCommencons. Quel est le nom de l'evenement ?\n> "
    @title = gets.chomp
    print "Super, Quand aura-t-il lieu ? (ex : 2019-01-13 09:00)\n> "
    @start_date = gets.chomp
    print "Au top. Combien de temps va-t-il durer (en minutes) ?\n> "
    @duration = gets.chomp
    print "Genial. Qui va participer ? Balance leurs e-mails (ex : email_1@mail.com ; email_2@mail.com)\n> "
    @attendees = gets.chomp
    @event = Event.new(@start_date, @duration, @title, @attendees.split(" ; "))
    print "Super, c'est note, ton evenement a ete cree !"
    @event.to_s
  end
end

#Lance un menu permettant de creer un evenement de facon user-friendly, l'evenement est accessible a partir de la variable @event