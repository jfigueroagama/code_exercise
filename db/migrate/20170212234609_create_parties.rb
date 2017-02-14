class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.string :host_name
      t.string :host_email
      t.integer :numgsts
      t.text :guest_names
      t.string :venue
      t.string :location
      t.string :theme
      t.datetime :when
      t.datetime :when_its_over
      t.text :descript

      t.timestamps
    end
    add_index :parties, :host_name
    add_index :parties, :host_email
  end
end
