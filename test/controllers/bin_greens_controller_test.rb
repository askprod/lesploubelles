require 'test_helper'

class BinGreensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bin_green = bin_greens(:one)
  end

  test "should get index" do
    get bin_greens_url
    assert_response :success
  end

  test "should get new" do
    get new_bin_green_url
    assert_response :success
  end

  test "should create bin_green" do
    assert_difference('BinGreen.count') do
      post bin_greens_url, params: { bin_green: {  } }
    end

    assert_redirected_to bin_green_url(BinGreen.last)
  end

  test "should show bin_green" do
    get bin_green_url(@bin_green)
    assert_response :success
  end

  test "should get edit" do
    get edit_bin_green_url(@bin_green)
    assert_response :success
  end

  test "should update bin_green" do
    patch bin_green_url(@bin_green), params: { bin_green: {  } }
    assert_redirected_to bin_green_url(@bin_green)
  end

  test "should destroy bin_green" do
    assert_difference('BinGreen.count', -1) do
      delete bin_green_url(@bin_green)
    end

    assert_redirected_to bin_greens_url
  end
end
