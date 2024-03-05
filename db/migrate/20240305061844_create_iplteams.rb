class CreateIplteams < ActiveRecord::Migration[7.1]
  def change
    create_table :iplteams do |t|
      t.string :name
      t.string :cup
      t.string :rank

      t.timestamps
    end
  end
end
