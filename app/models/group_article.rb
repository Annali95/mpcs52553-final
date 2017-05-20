class GroupArticle < ApplicationRecord

  has_many :article, class_name: 'Article', foreign_key: 'article_id'
  belongs_to :group, class_name: 'Group', foreign_key: 'group_id'
  validates :group_id, presence: true
  validates :article_id, presence: true

end


# Grouparticle
#   group_id: integer
#   article_id: integer