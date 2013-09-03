class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  attr_accessor :asset
  attr_accessible :description, :title, :asset
  validates :title, :presence => true
  validates :description, :presence => true,
  						  :length => { :minimum => 10 }
has_attached_file :asset
end
