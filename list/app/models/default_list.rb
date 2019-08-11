class DefaultList < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :list_items
end
