class Job < ApplicationRecord
  belongs_to :user, :autosave => true

  has_many :clocks
end
