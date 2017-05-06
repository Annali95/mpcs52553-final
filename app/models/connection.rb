class Connection < ApplicationRecord

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :group, class_name: 'Group', foreign_key: 'group_id'
  validates :group_id, presence: true
  validates :user_id, presence: true

end


# Connection
#   group_id: integer
#   user_id: integer
#   detail: text