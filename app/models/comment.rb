class Comment < ApplicationRecord

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :article, class_name: 'Article', foreign_key: 'article_id'
  
  validates :content, presence: true  
  validates :user_id, presence: true  
  validates :article_id, presence: true  


end
# Comment
#   user_id: text
#   article_id: text
#   content: text