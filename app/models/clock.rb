class Clock < ApplicationRecord
  belongs_to :user, :job_id, :autosave => true
end
