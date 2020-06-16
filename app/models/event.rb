# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :host, foreign_key: 'host_id', class_name: 'User'
  has_many :appointments, foreign_key: 'event_id', dependent: :destroy
  has_many :attendees, through: :appointments
  has_many :invitable_users, through: :appointments, class_name: 'User'
  # has_many :invited_users, through: :appointments, -> { where status: false }
  has_many :confirmed_users, -> { where('status =?', 'confirmed') }, through: :appointments, class_name: 'User', source: :attendee
  # has_many :confirmed_appointments, foreign_key: proc{"SELECT * FROM appointments WHERE appointment.event_id = #{id} AND appointments.status = confirmed"}

  scope :upcoming, -> { where('date >=?', Date.today) }
  scope :past, -> { where('date <?', Date.today) }

  # scope :confirmed_users, -> { where('attendee.appointment.status =?', 'confirmed')}

  def appointments_by_status(status)
    Appointment.where("event_id = #{self.id} and status = #{status}")
  end

  def invitable_users
    User.all - [self.attendees, self.host]
  end
end
