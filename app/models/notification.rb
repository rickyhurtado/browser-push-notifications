class Notification < ActiveRecord::Base
  scope :undelivered, -> (id, user_id) { where('id > ? AND user_id=? AND delivered=?', id, user_id, false) }
end
