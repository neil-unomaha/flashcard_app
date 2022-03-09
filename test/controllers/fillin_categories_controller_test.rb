require "test_helper"

class FillinCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fillin_category = fillin_categories(:one)
  end

  test "should get index" do
    get fillin_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_fillin_category_url
    assert_response :success
  end

  test "should create fillin_category" do
    assert_difference('FillinCategory.count') do
      post fillin_categories_url, params: { fillin_category: { name: @fillin_category.name } }
    end

    assert_redirected_to fillin_category_url(FillinCategory.last)
  end

  test "should show fillin_category" do
    get fillin_category_url(@fillin_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_fillin_category_url(@fillin_category)
    assert_response :success
  end

  test "should update fillin_category" do
    patch fillin_category_url(@fillin_category), params: { fillin_category: { name: @fillin_category.name } }
    assert_redirected_to fillin_category_url(@fillin_category)
  end

  test "should destroy fillin_category" do
    assert_difference('FillinCategory.count', -1) do
      delete fillin_category_url(@fillin_category)
    end

    assert_redirected_to fillin_categories_url
  end
end
