require 'test_helper'

class BinWastesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bin_waste = bin_wastes(:one)
  end

  test "should get index" do
    get bin_wastes_url
    assert_response :success
  end

  test "should get new" do
    get new_bin_waste_url
    assert_response :success
  end

  test "should create bin_waste" do
    assert_difference('BinWaste.count') do
      post bin_wastes_url, params: { bin_waste: {  } }
    end

    assert_redirected_to bin_waste_url(BinWaste.last)
  end

  test "should show bin_waste" do
    get bin_waste_url(@bin_waste)
    assert_response :success
  end

  test "should get edit" do
    get edit_bin_waste_url(@bin_waste)
    assert_response :success
  end

  test "should update bin_waste" do
    patch bin_waste_url(@bin_waste), params: { bin_waste: {  } }
    assert_redirected_to bin_waste_url(@bin_waste)
  end

  test "should destroy bin_waste" do
    assert_difference('BinWaste.count', -1) do
      delete bin_waste_url(@bin_waste)
    end

    assert_redirected_to bin_wastes_url
  end
end
