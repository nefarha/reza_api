require "test_helper"

class PesanansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pesanan = pesanans(:one)
  end

  test "should get index" do
    get pesanans_url, as: :json
    assert_response :success
  end

  test "should create pesanan" do
    assert_difference("Pesanan.count") do
      post pesanans_url, params: { pesanan: { image: @pesanan.image, jumlah_ticket: @pesanan.jumlah_ticket, nama_pemesan: @pesanan.nama_pemesan, nama_rekening_pemesan: @pesanan.nama_rekening_pemesan, nomor_pemesan: @pesanan.nomor_pemesan, nomor_rekening_pemesan: @pesanan.nomor_rekening_pemesan, owner_id: @pesanan.owner_id, rekening_penerima: @pesanan.rekening_penerima, status: @pesanan.status, total_harga: @pesanan.total_harga, wisata: @pesanan.wisata } }, as: :json
    end

    assert_response :created
  end

  test "should show pesanan" do
    get pesanan_url(@pesanan), as: :json
    assert_response :success
  end

  test "should update pesanan" do
    patch pesanan_url(@pesanan), params: { pesanan: { image: @pesanan.image, jumlah_ticket: @pesanan.jumlah_ticket, nama_pemesan: @pesanan.nama_pemesan, nama_rekening_pemesan: @pesanan.nama_rekening_pemesan, nomor_pemesan: @pesanan.nomor_pemesan, nomor_rekening_pemesan: @pesanan.nomor_rekening_pemesan, owner_id: @pesanan.owner_id, rekening_penerima: @pesanan.rekening_penerima, status: @pesanan.status, total_harga: @pesanan.total_harga, wisata: @pesanan.wisata } }, as: :json
    assert_response :success
  end

  test "should destroy pesanan" do
    assert_difference("Pesanan.count", -1) do
      delete pesanan_url(@pesanan), as: :json
    end

    assert_response :no_content
  end
end
