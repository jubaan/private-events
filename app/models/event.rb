# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :host, foreign_key: 'host_id', class_name: 'User'
  has_many :appointments, foreign_key: 'event_id', dependent: :destroy
  has_many :attendees, through: :appointments
  has_many :invitable_users, through: :appointments, class_name: 'User'
  # has_many :invited_users, through: :appointments, -> { where status: false }
  # has_many :confirmed_users, through: :appointments, -> { where status: true }
  # has_many :confirmed_appointments, foreign_key: proc{"SELECT * FROM appointments WHERE appointment.event_id = #{id} AND appointments.status = confirmed"}

  scope :upcoming, -> { where('date >=?', Date.today) }
  scope :past, -> { where('date <?', Date.today) }

  def self.appointments_by_status(event_id, status)
    Appointment.where("event_id = #{event_id} and status = #{status}")
  end

  def invitable_users
    User.all - self.attendees
  end
end
