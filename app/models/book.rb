# == Schema Information
# Schema version: 20110404193009
#
# Table name: books
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  author     :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Book < ActiveRecord::Base
  attr_accessible :title, :author
  
  belongs_to :user
  
  default_scope :order => "title"
  
  validates :title, :presence => true
  validates :author, :presence => true
  validates :user_id, :presence => true
end
