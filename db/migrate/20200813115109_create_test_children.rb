class CreateTestChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :test_children do |t|
      t.string :name
      t.references :test
      t.timestamps
    end
  end
end
