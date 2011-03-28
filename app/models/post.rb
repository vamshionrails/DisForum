class Post < ActiveRecord::Base
  validates_presence_of :title, :content
  validates_length_of :title, :within => 2..30
  belongs_to :forum
  belongs_to :user
  has_many :comments
end
