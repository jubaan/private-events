# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: 'host_id', class_name: 'Event'
  has_many :appointments, foreign_key: 'attendee_id'
  has_many :attended_events, through: :appointments, source: :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def appointments_by_status(status)
    attendee_id = self.id
    self.appointments.where('status =?', "#{status}")
  end

  def invitable?(event_id)
    Appointment.where("attendee_id = #{self.id} and event_id = #{event_id}").empty?
  end
end
