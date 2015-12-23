class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :phrase
      t.text :explanation

      t.timestamps null: false
    end
  end
end
