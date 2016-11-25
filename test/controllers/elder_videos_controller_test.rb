require 'test_helper'

class ElderVideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @elder_video = elder_videos(:one)
  end

  test "should get index" do
    get elder_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_elder_video_url
    assert_response :success
  end

  test "should create elder_video" do
    assert_difference('ElderVideo.count') do
      post elder_videos_url, params: { elder_video: { name: @elder_video.name } }
    end

    assert_redirected_to elder_video_url(ElderVideo.last)
  end

  test "should show elder_video" do
    get elder_video_url(@elder_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_elder_video_url(@elder_video)
    assert_response :success
  end

  test "should update elder_video" do
    patch elder_video_url(@elder_video), params: { elder_video: { name: @elder_video.name } }
    assert_redirected_to elder_video_url(@elder_video)
  end

  test "should destroy elder_video" do
    assert_difference('ElderVideo.count', -1) do
      delete elder_video_url(@elder_video)
    end

    assert_redirected_to elder_videos_url
  end
end
