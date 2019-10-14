require 'pry'

class User

	attr_accessor :email, :age
	@@all_users = Array.new
	@@name = self
	
	def initialize(user_email, user_age)
		@email = user_email
		@age = user_age
		@@all_users = @@all_users << self
	end

	def show_itself
		return self.email
	end 

	def self.all
		return @@all_users
	end

	def self.find_by_email(email_to_find)
		@@all_users.find{|user| user.email == email_to_find}
	end

end

binding.pry
puts "end of prog"
