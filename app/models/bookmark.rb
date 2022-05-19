class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  # validates :comment, uniqueness: { scope: [:movie, :list] }
  validates_uniqueness_of :movie, scope: :list
  # validates_uniqueness_of :list, scope: :movie
end
