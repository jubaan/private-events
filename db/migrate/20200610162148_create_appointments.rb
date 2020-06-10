# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :attendee, null: false, foreign_key: { to_table: :users }
      t.references :event, null: false, foreign_key: { to_table: :events }
      t.timestamps
    end
  end
end