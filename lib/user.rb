class User
  attr_accessor :email
  attr_accessor :age
  @@all_users = []

  def initialize(email_to_save, age_to_save)
    @email = email_to_save
    @age = age_to_save
    @@all_users.push(self)
  end

  #Permet d'acceder a la variable de classe qui stocke tous les users
  def self.all
    return @@all_users
  end

  #Cherche un utilisateur a partir de son email
  def self.find_by_email(email)
    @@all_users.each do |user|
      if (user.email == email)
        return user
      end
    end
  end

end
