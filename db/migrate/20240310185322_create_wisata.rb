class CreateWisata < ActiveRecord::Migration[7.1]
  def change
    create_table :wisata do |t|
      t.string :nama_wisata
      t.integer :harga

      t.timestamps
    end

    
  end
end
