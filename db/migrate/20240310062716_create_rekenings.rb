class CreateRekenings < ActiveRecord::Migration[7.1]
  def change
    create_table :rekenings do |t|
      t.string :name
      t.string :bank_name
      t.string :owner_id
      t.string :number

      t.timestamps
    end
  end
end
