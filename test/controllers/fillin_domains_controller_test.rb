require "test_helper"

class FillinDomainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fillin_domain = fillin_domains(:one)
  end

  test "should get index" do
    get fillin_domains_url
    assert_response :success
  end

  test "should get new" do
    get new_fillin_domain_url
    assert_response :success
  end

  test "should create fillin_domain" do
    assert_difference('FillinDomain.count') do
      post fillin_domains_url, params: { fillin_domain: { name: @fillin_domain.name } }
    end

    assert_redirected_to fillin_domain_url(FillinDomain.last)
  end

  test "should show fillin_domain" do
    get fillin_domain_url(@fillin_domain)
    assert_response :success
  end

  test "should get edit" do
    get edit_fillin_domain_url(@fillin_domain)
    assert_response :success
  end

  test "should update fillin_domain" do
    patch fillin_domain_url(@fillin_domain), params: { fillin_domain: { name: @fillin_domain.name } }
    assert_redirected_to fillin_domain_url(@fillin_domain)
  end

  test "should destroy fillin_domain" do
    assert_difference('FillinDomain.count', -1) do
      delete fillin_domain_url(@fillin_domain)
    end

    assert_redirected_to fillin_domains_url
  end
end
