require "test_helper"

class RekeningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rekening = rekenings(:one)
  end

  test "should get index" do
    get rekenings_url, as: :json
    assert_response :success
  end

  test "should create rekening" do
    assert_difference("Rekening.count") do
      post rekenings_url, params: { rekening: { bank_name: @rekening.bank_name, name: @rekening.name, number: @rekening.number, owner_id: @rekening.owner_id } }, as: :json
    end

    assert_response :created
  end

  test "should show rekening" do
    get rekening_url(@rekening), as: :json
    assert_response :success
  end

  test "should update rekening" do
    patch rekening_url(@rekening), params: { rekening: { bank_name: @rekening.bank_name, name: @rekening.name, number: @rekening.number, owner_id: @rekening.owner_id } }, as: :json
    assert_response :success
  end

  test "should destroy rekening" do
    assert_difference("Rekening.count", -1) do
      delete rekening_url(@rekening), as: :json
    end

    assert_response :no_content
  end
end
