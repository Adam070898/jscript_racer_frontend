class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.float :score
      t.boolean :win
    end
  end
end
