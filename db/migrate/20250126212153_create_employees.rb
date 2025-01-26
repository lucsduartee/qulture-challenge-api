class CreateEmployees < ActiveRecord::Migration[7.2]
  def change
    create_table :employees do |t|
      t.integer :manager_id
      t.string :email
      t.string :name
      t.string :picture
      t.references :company, null: false, foreing_key: true

      t.timestamps
    end
  end
end
