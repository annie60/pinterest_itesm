class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :board, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
