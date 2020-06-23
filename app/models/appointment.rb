class Appointment < ApplicationRecord
  belongs_to :attendee, foreign_key: 'attendee_id', class_name: 'User'
  belongs_to :event, foreign_key: 'event_id', class_name: 'Event'
  scope :accepted, -> { where "status = 'accepted'" }
  scope :rejected, -> { where "status = 'rejected'" }
  scope :invited, -> { where "status = 'invited'" }
end
