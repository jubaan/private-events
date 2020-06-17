class User < ApplicationRecord
  has_many :events, foreign_key: 'host_id', class_name: 'Event'
  has_many :appointments, foreign_key: 'attendee_id'
  has_many :confirmed_events,
           -> { where('status =?', 'confirmed') },
           through: :appointments,
           class_name: 'Event',
           source: :event

  has_many :invitated_events,
           -> { where('status =?', 'invited') },
           through: :appointments,
           class_name: 'Event',
           source: :event

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def invitable?(event_id)
    Appointment.where("attendee_id = #{id} and event_id = #{event_id}").empty?
  end
end
