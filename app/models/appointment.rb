# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :attendee, foreign_key: 'attendee_id', class_name: 'User'
  belongs_to :event, foreign_key: 'event_id', class_name: 'Event'

  def self.exists?(event, attendee)
    not find_by_event_id_and_attendee_id(event, attendee).nil?
  end

  def self.confirmed?(event, status = true, attendee)
    find_by_event_id_and_status_and_attendee_id(event, status, attendee)
  end

end
