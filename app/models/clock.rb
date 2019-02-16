class Clock < ApplicationRecord
  belongs_to :user, :autosave => true
  belongs_to :job, :autosave => true

  cattr_accessor :current_user

end
