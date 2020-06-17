class Event < ApplicationRecord
  belongs_to :host, foreign_key: 'host_id', class_name: 'User'
  has_many :appointments, foreign_key: 'event_id', dependent: :destroy
  has_many :attendees, through: :appointments

  has_many :confirmed_users,
           -> { where('status =?', 'confirmed') },
           through: :appointments,
           class_name: 'User',
           source: :attendee

  has_many :invited_users,
           -> { where('status =?', 'invited') },
           through: :appointments,
           class_name: 'User',
           source: :attendee

  scope :upcoming, -> { where('date >=?', Date.today) }
  scope :past, -> { where('date <?', Date.today) }

  def invitable_users(current_user)
    User.all - [attendees, host, current_user]
  end
end
