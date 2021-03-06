class Project < ActiveRecord::Base
	
	attr_accessible :name

	validates :name, :presence => true, :uniqueness => true
	
	has_many :permissions, :as => :thing
	scope :readable_by, lambda { |user| 
		joins(:permissions).where(:permissions => { :action => "view",
			:user_id => user.id})  }
		
 	has_many :tickets, :dependent => :delete_all

 	def self.for(user)
 		user.admin? ? Project : Project.readable_by(user)
 	end
end
