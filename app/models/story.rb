class Story < ActiveRecord::Base

	# this is an association in rails
	# our story has many comments AND has many votes

	has_many :comments
	has_many :votes

	# set up acts as taggable 
	acts_as_taggable

	validates :title, length: {minimum: 5}
	validates :description, presence: true
	validates :url, presence: true, uniqueness: {message: "has already been submitted"}

	 # I want to overwrite the url structure in activerecord
	 # activerecord is the rails way to manage models
	 # to_param is the method we want to overwrite
	 # i want my title to be something like 7-designer-new
	 # this is my id then my title as a url

	def to_param

		"#{id}-#{title.parameterize}"

	end

	# this is my own shortcut to make nice clean urls for our users
	# NB nice_url isn't part of rails, it's mine

	def nice_url

		# I want to take the url, remove http:// and remove www. 
		# gsub means global subsitution - replace all

		url.gsub("http://", "").gsub("www.", "")

	end

end
 