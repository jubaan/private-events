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

  def host?(event_id)
    events.ids.include?(event_id)
  end

  def current_user?(current_user)
    current_user == self
  end

  def invited?(event_id)
    (!confirmed_events.ids.include?(event_id) &&
     invited_events.ids.include?(event_id))
  end

  def show_im_going_btn(event_id, current_user)
    !host?(event_id) && current_user?(current_user) && invited?(event_id)
  end

  def related?(event_id)
    related_events.ids.include?(event_id) || events.ids.include?(event_id)
  end

  def past_participations
    (confirmed_events.past + events.past).to_set
  end
end
