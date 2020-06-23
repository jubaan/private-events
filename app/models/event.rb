class Event < ApplicationRecord
  validates_uniqueness_of :title
  validates_length_of :description, within: 50..2000
  validates_length_of :location, within: 50..255
  validates_presence_of :date, :title, :description, :location

  belongs_to :host, foreign_key: 'host_id', class_name: 'User'
  has_many :appointments, dependent: :destroy
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
