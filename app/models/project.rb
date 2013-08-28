class Project < ActiveRecord::Base
	validates_presence_of :name
	attr_accessible :name
	has_many :tickets, :dependent => :delete_all
end
