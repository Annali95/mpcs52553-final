class Article < ApplicationRecord
  
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :pictures
  has_many :comments, class_name: 'Comment'

  validates :content, presence: true  
  validates :title, presence: true
  validates :user_id, presence: true



end

# Article
#   category: text
#   title: text
#   content: text  
#   post_time: text
#   user_id: integer
