class Notification < ApplicationRecord
  scope :undelivered, -> (user_id) { where('user_id=? AND delivered=?', user_id, false) }
end
