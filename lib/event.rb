require 'pry' 
require 'time'

class User

	#@@user_name = self.class
	attr_accessor :email, :age
	@@all_users = Array.new
	
	def initialize(user_email, user_age)
		@email = user_email
		@age = user_age
		@@all_users << self
	end

	def self.all
		return @@all_users
	end

	def find_by_email(email)
		return User
	end

end

class Event
	#create a list of attendees
	attr_accessor :start_date
	attr_accessor :duration
	attr_accessor :title
	attr_accessor :attendees
	attr_accessor :end_date

	def initialize(date, event_duration, event_title, event_attendees)
		#get a start date
		@start_date = Time.parse("#{date}")
		puts "#{@start_date}"
		#get the duration of the event in min 
		@duration = event_duration
		#get the title
		@title = event_title
		#get an array of attendees
		#@attendees = event_attendees
		@attendees = Array.new(event_attendees)

	end

	def postpone_24h
		#Change the date to a day after the inital start date
		@start_date = @start_date + (24*60*60)
	end

	def end_date
		#get the time of end
		@end_date = @start_date + @duration
	end

	def is_past?
		#say true if the event is past, false if it's not
		if @start_date < Time.now
			return true
		else
			return false
		end
	end

	def is_futur?
		#say true if the event is in the futur, false if not
		if @start_date > Time.now
			return true
		else
			return false
		end
	end

	def is_soon?
		#say true if the event is in less than 30min
		time_in_30_min = Time.now + (30*60)
			if @start_date <= time_in_30_min && @start_date >= Time.now
				return true
			else
				return false
			end
	end

	def to_s
		list = @attendees*", "
		puts "Titre : #{@title}"
		puts "Date de début : #{@start_date}"
		puts "Durée : #{@duration} minutes"
		puts "Invités : #{list}"
	end


end

binding.pry
