class Friendrequest < ApplicationRecord


  validates :sent, presence: true
  validates :receive, presence: true
  validates :status, presence: true

end


# Friendrequest
#   sent: integer
#   receive: integer
#   status: integer