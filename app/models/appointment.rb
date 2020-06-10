# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :attendee, foreign_key: 'attendee_id', class_name: 'User'
  belongs_to :event, foreign_key: 'event_id', class_name: 'Event'
end
