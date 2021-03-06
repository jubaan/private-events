class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :date
      t.string :location
      t.references :host, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
