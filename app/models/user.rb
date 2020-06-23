class User < ApplicationRecord
  has_many :events, foreign_key: 'host_id', class_name: 'Event'
  has_many :appointments, foreign_key: 'attendee_id'

  has_many :confirmed_events,
    -> { where('status =?', 'confirmed') },
    through: :appointments,
    class_name: 'Event',
    source: :event

  has_many :invited_events,
    -> { where('status =?', 'invited') },
    through: :appointments,
    class_name: 'Event',
    source: :event

  has_many :related_events,
    through: :appointments,
    class_name: 'Event',
    source: :event

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  def invitable?(event_id)
    (!confirmed_events.ids.include?(event_id) && invited_events.ids.include?(event_id)) && !related_events.ids.include?(event_id)
  end

  def past_participations
    invited_events.past + events.past
  end
end
