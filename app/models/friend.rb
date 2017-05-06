class Friend < ApplicationRecord


  validates :friend1_id, presence: true
  validates :friend2_id, presence: true

end


# Friend
#   friend1_id: id
#   friend2_id: id