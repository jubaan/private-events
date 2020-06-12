# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :host, foreign_key: 'host_id', class_name: 'User'
  has_many :appointments, foreign_key: 'event_id', dependent: :destroy
  has_many :attendees, through: :appointments
  # has_many :confirmed_appointments, foreign_key: proc{"SELECT * FROM appointments WHERE appointment.event_id = #{id} AND appointments.status = true"}

  scope :upcoming, -> { where('date >=?', Date.today) }
  scope :past, -> { where('date <?', Date.today) }
  # scope :confirmed_appointments, -> { joins(:attendees).where('attendees.appointments.status = true') }
  # scope :not_confirmed_appointments, -> { joins(:attendees).where('attendees.appointments.status = false') }
end
