class CreateReactions < ActiveRecord::Migration[5.0]
  def change
    create_table :reactions do |t|
      t.integer :reactable_id
      t.string :reactable_type
      t.integer :user_id
      t.string :reaction_type

      t.timestamps
    end
  end
end
