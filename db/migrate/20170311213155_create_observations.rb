class CreateObservations < ActiveRecord::Migration[5.0]
  def change
    create_table :observations do |t|
      t.decimal :temperature
      t.decimal :pressure
      t.decimal :humidity
      t.timestamps
    end
  end
end
