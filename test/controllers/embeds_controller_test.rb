require 'test_helper'

class EmbedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @embed = embeds(:one)
  end

  test "should get index" do
    get embeds_url
    assert_response :success
  end

  test "should get new" do
    get new_embed_url
    assert_response :success
  end

  test "should create embed" do
    assert_difference('Embed.count') do
      post embeds_url, params: { embed: { url: @embed.url } }
    end

    assert_redirected_to embed_url(Embed.last)
  end

  test "should show embed" do
    get embed_url(@embed)
    assert_response :success
  end

  test "should get edit" do
    get edit_embed_url(@embed)
    assert_response :success
  end

  test "should update embed" do
    patch embed_url(@embed), params: { embed: { url: @embed.url } }
    assert_redirected_to embed_url(@embed)
  end

  test "should destroy embed" do
    assert_difference('Embed.count', -1) do
      delete embed_url(@embed)
    end

    assert_redirected_to embeds_url
  end
end
