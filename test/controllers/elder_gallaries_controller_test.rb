require 'test_helper'

class ElderGallariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @elder_gallary = elder_gallaries(:one)
  end

  test "should get index" do
    get elder_gallaries_url
    assert_response :success
  end

  test "should get new" do
    get new_elder_gallary_url
    assert_response :success
  end

  test "should create elder_gallary" do
    assert_difference('ElderGallary.count') do
      post elder_gallaries_url, params: { elder_gallary: { name: @elder_gallary.name } }
    end

    assert_redirected_to elder_gallary_url(ElderGallary.last)
  end

  test "should show elder_gallary" do
    get elder_gallary_url(@elder_gallary)
    assert_response :success
  end

  test "should get edit" do
    get edit_elder_gallary_url(@elder_gallary)
    assert_response :success
  end

  test "should update elder_gallary" do
    patch elder_gallary_url(@elder_gallary), params: { elder_gallary: { name: @elder_gallary.name } }
    assert_redirected_to elder_gallary_url(@elder_gallary)
  end

  test "should destroy elder_gallary" do
    assert_difference('ElderGallary.count', -1) do
      delete elder_gallary_url(@elder_gallary)
    end

    assert_redirected_to elder_gallaries_url
  end
end
