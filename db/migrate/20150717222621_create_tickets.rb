class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :description
      t.string :text
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
