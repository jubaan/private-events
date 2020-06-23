class Appointment < ApplicationRecord
  belongs_to :attendee, foreign_key: 'attendee_id', class_name: 'User'
  belongs_to :event, foreign_key: 'event_id', class_name: 'Event'
  scope :past_accepted, Event.where("status = confirmed").where('date <?', Date.today).where('appointment_id =?', id)

  # scope :past_accepted, -> { where "status = 'accepted' AND event.date < Date.today" }
end
