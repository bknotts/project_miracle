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
  
  validates :title, :presence => true
  validates :author, :presence => true
  validates :user_id, :presence => true
  
  default_scope :order => 'books.created_at DESC'
  scope :from_users_followed_by, lambda { |user| followed_by(user) }
  
  private
  
    def self.followed_by(user)
      followed_ids = %(SELECT followed_id FROM relationships 
                       WHERE follower_id = :user_id)
      where("user_id IN (#{followed_ids}) OR user_id = :user_id",
            { :user_id => user})
    end
end
