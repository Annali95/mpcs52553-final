class User < ApplicationRecord
  has_many :article
  has_many :connection
  has_many :comment
  has_many :groups, through: :connection

  validates :name, presence: true
  validates :mail, presence: true
  validates :password, presence: true
  
  validates :mail, uniqueness: { message: "This e-mail address have been used, please try to sign in!	" }
  validates :name, uniqueness: { message: "This username have been used" }
end
# User
#   name: string
#   mail: text
#   password: text
#   profile: text