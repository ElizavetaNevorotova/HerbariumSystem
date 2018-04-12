require 'test_helper'

class TaxonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taxon = taxons(:one)
  end

  test "should get index" do
    get taxons_url
    assert_response :success
  end

  test "should get new" do
    get new_taxon_url
    assert_response :success
  end

  test "should create taxon" do
    assert_difference('Taxon.count') do
      post taxons_url, params: { taxon: { botanist_id: @taxon.botanist_id, exemplar_id: @taxon.exemplar_id, level: @taxon.level, name: @taxon.name, parent_id: @taxon.parent_id } }
    end

    assert_redirected_to taxon_url(Taxon.last)
  end

  test "should show taxon" do
    get taxon_url(@taxon)
    assert_response :success
  end

  test "should get edit" do
    get edit_taxon_url(@taxon)
    assert_response :success
  end

  test "should update taxon" do
    patch taxon_url(@taxon), params: { taxon: { botanist_id: @taxon.botanist_id, exemplar_id: @taxon.exemplar_id, level: @taxon.level, name: @taxon.name, parent_id: @taxon.parent_id } }
    assert_redirected_to taxon_url(@taxon)
  end

  test "should destroy taxon" do
    assert_difference('Taxon.count', -1) do
      delete taxon_url(@taxon)
    end

    assert_redirected_to taxons_url
  end
end
