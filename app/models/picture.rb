class Picture < ApplicationRecord

  belongs_to :article, class_name: 'Article', foreign_key: 'article_id'

  validates :url, presence: true
  validates :article_id, presence: true

end
# Picture
#   article_id: text
#   url: text