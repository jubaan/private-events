# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: 'host_id', class_name: 'Event'
  has_many :appointments, foreign_key: 'attendee_id'
  has_many :attended_events, through: :appointments, source: :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
