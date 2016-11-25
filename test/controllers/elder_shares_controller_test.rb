require 'test_helper'

class ElderSharesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @elder_share = elder_shares(:one)
  end

  test "should get index" do
    get elder_shares_url
    assert_response :success
  end

  test "should get new" do
    get new_elder_share_url
    assert_response :success
  end

  test "should create elder_share" do
    assert_difference('ElderShare.count') do
      post elder_shares_url, params: { elder_share: { elder_gallary_id: @elder_share.elder_gallary_id, receiver_id: @elder_share.receiver_id, sender_id: @elder_share.sender_id } }
    end

    assert_redirected_to elder_share_url(ElderShare.last)
  end

  test "should show elder_share" do
    get elder_share_url(@elder_share)
    assert_response :success
  end

  test "should get edit" do
    get edit_elder_share_url(@elder_share)
    assert_response :success
  end

  test "should update elder_share" do
    patch elder_share_url(@elder_share), params: { elder_share: { elder_gallary_id: @elder_share.elder_gallary_id, receiver_id: @elder_share.receiver_id, sender_id: @elder_share.sender_id } }
    assert_redirected_to elder_share_url(@elder_share)
  end

  test "should destroy elder_share" do
    assert_difference('ElderShare.count', -1) do
      delete elder_share_url(@elder_share)
    end

    assert_redirected_to elder_shares_url
  end
end
