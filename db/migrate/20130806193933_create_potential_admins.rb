class CreatePotentialAdmins < ActiveRecord::Migration
  def change
    create_table :potential_admins do |t|
      t.string :email
      t.string :generated_number

      t.timestamps
    end
  end
end
