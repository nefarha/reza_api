require "test_helper"

class WisataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wisatum = wisata(:one)
  end

  test "should get index" do
    get wisata_url, as: :json
    assert_response :success
  end

  test "should create wisatum" do
    assert_difference("Wisatum.count") do
      post wisata_url, params: { wisatum: { harga: @wisatum.harga, nama_wisata: @wisatum.nama_wisata } }, as: :json
    end

    assert_response :created
  end

  test "should show wisatum" do
    get wisatum_url(@wisatum), as: :json
    assert_response :success
  end

  test "should update wisatum" do
    patch wisatum_url(@wisatum), params: { wisatum: { harga: @wisatum.harga, nama_wisata: @wisatum.nama_wisata } }, as: :json
    assert_response :success
  end

  test "should destroy wisatum" do
    assert_difference("Wisatum.count", -1) do
      delete wisatum_url(@wisatum), as: :json
    end

    assert_response :no_content
  end
end
