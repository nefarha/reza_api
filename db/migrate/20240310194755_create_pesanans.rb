class CreatePesanans < ActiveRecord::Migration[7.1]
  def change
    create_table :pesanans do |t|
      t.string :nama_pemesan
      t.bigint  :nomor_pemesan
      t.string :nama_rekening_pemesan
      t.string :nama_bank_pemesan
      t.bigint :nomor_rekening_pemesan
      t.integer :wisata
      t.integer :rekening_penerima
      t.integer :jumlah_ticket
      t.string :total_harga
      t.string :image
      t.integer :owner_id
      t.string :status
      t.string :creator

      t.timestamps
    end
  end
end
