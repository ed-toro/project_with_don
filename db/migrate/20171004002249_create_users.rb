class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :trello_id
      t.string :slack_id

      t.timestamps
    end
  end
end
