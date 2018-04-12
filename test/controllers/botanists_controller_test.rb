require 'test_helper'

class BotanistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @botanist = botanists(:one)
  end

  test "should get index" do
    get botanists_url
    assert_response :success
  end

  test "should get new" do
    get new_botanist_url
    assert_response :success
  end

  test "should create botanist" do
    assert_difference('Botanist.count') do
      post botanists_url, params: { botanist: { first_name: @botanist.first_name, last_name: @botanist.last_name, patronymic: @botanist.patronymic, position: @botanist.position } }
    end

    assert_redirected_to botanist_url(Botanist.last)
  end

  test "should show botanist" do
    get botanist_url(@botanist)
    assert_response :success
  end

  test "should get edit" do
    get edit_botanist_url(@botanist)
    assert_response :success
  end

  test "should update botanist" do
    patch botanist_url(@botanist), params: { botanist: { first_name: @botanist.first_name, last_name: @botanist.last_name, patronymic: @botanist.patronymic, position: @botanist.position } }
    assert_redirected_to botanist_url(@botanist)
  end

  test "should destroy botanist" do
    assert_difference('Botanist.count', -1) do
      delete botanist_url(@botanist)
    end

    assert_redirected_to botanists_url
  end
end
