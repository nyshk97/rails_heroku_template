class Test < ApplicationRecord
  has_many :test_children, dependent: :destroy # or :nullify
  validates :name, length: { minimum: 5 }, presence: true
end
