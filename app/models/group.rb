class Group < ApplicationRecord

  has_many :connection
  has_many :grouparticle
  has_many :members, class_name: 'User', through: :connection
  has_many :articles, class_name: "Article", through: :grouparticle

  # validates :name, uniqueness: { message: "The group name must be unique" }

end


# Group
#   name: string
#   create_time: text
#   detail: text