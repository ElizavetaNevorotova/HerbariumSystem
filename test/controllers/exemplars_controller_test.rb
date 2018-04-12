require 'test_helper'

class ExemplarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exemplar = exemplars(:one)
  end

  test "should get index" do
    get exemplars_url
    assert_response :success
  end

  test "should get new" do
    get new_exemplar_url
    assert_response :success
  end

  test "should create exemplar" do
    assert_difference('Exemplar.count') do
      post exemplars_url, params: { exemplar: { box_id: @exemplar.box_id, cupboard_id: @exemplar.cupboard_id, finded_at: @exemplar.finded_at, fund: @exemplar.fund, habitat: @exemplar.habitat, location: @exemplar.location } }
    end

    assert_redirected_to exemplar_url(Exemplar.last)
  end

  test "should show exemplar" do
    get exemplar_url(@exemplar)
    assert_response :success
  end

  test "should get edit" do
    get edit_exemplar_url(@exemplar)
    assert_response :success
  end

  test "should update exemplar" do
    patch exemplar_url(@exemplar), params: { exemplar: { box_id: @exemplar.box_id, cupboard_id: @exemplar.cupboard_id, finded_at: @exemplar.finded_at, fund: @exemplar.fund, habitat: @exemplar.habitat, location: @exemplar.location } }
    assert_redirected_to exemplar_url(@exemplar)
  end

  test "should destroy exemplar" do
    assert_difference('Exemplar.count', -1) do
      delete exemplar_url(@exemplar)
    end

    assert_redirected_to exemplars_url
  end
end
