class Test < ApplicationRecord
  validates :name, length: { minimum: 30 }, presence: true
end
