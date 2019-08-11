class User < ApplicationRecord
  has_and_belongs_to_many :default_lists

  scope :ascending_id, lambda { order("users.id ASC") }
  scope :username_like, lambda {|query|
    where(["username LIKE ?", "%#{query}%"])
  }
end
