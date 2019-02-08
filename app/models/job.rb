class Job < ApplicationRecord
  belongs_to :user, :autosave => true
end
