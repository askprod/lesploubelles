require 'test_helper'

class BinRecyclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bin_recycle = bin_recycles(:one)
  end

  test "should get index" do
    get bin_recycles_url
    assert_response :success
  end

  test "should get new" do
    get new_bin_recycle_url
    assert_response :success
  end

  test "should create bin_recycle" do
    assert_difference('BinRecycle.count') do
      post bin_recycles_url, params: { bin_recycle: {  } }
    end

    assert_redirected_to bin_recycle_url(BinRecycle.last)
  end

  test "should show bin_recycle" do
    get bin_recycle_url(@bin_recycle)
    assert_response :success
  end

  test "should get edit" do
    get edit_bin_recycle_url(@bin_recycle)
    assert_response :success
  end

  test "should update bin_recycle" do
    patch bin_recycle_url(@bin_recycle), params: { bin_recycle: {  } }
    assert_redirected_to bin_recycle_url(@bin_recycle)
  end

  test "should destroy bin_recycle" do
    assert_difference('BinRecycle.count', -1) do
      delete bin_recycle_url(@bin_recycle)
    end

    assert_redirected_to bin_recycles_url
  end
end
