class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name, null: false
      t.string :class, null: false
      t.belongs_to :user
      t.integer :wins, default: 0
      t.integer :losses, default: 0
      t.timestamps
    end
  end
end
