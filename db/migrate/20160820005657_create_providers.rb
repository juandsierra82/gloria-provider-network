class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :provider_name
      t.string :provider_phone
      t.string :provider_email
      t.datetime :cpr_completion_date
      t.datetime :cpr_expiration_date
      t.timestamps
    end
  end
end
