class CreatePhoneNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :phone_numbers do |t|
      t.string :phone
      t.references :guest

      t.timestamps
    end
  end
end
