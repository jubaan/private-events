# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :host, foreign_key: 'host_id', class_name: 'User'
  has_many :appointments, foreign_key: 'event_id', dependent: :destroy
  has_many :attendees, through: :appointments

  scope :upcoming, -> { where('date >=?', Date.today) }
  scope :past, -> { where('date <?', Date.today) }
end
