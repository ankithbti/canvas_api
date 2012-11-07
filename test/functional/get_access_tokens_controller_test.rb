require 'test_helper'

class GetAccessTokensControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => GetAccessToken.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    GetAccessToken.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    GetAccessToken.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to get_access_token_url(assigns(:get_access_token))
  end

  def test_edit
    get :edit, :id => GetAccessToken.first
    assert_template 'edit'
  end

  def test_update_invalid
    GetAccessToken.any_instance.stubs(:valid?).returns(false)
    put :update, :id => GetAccessToken.first
    assert_template 'edit'
  end

  def test_update_valid
    GetAccessToken.any_instance.stubs(:valid?).returns(true)
    put :update, :id => GetAccessToken.first
    assert_redirected_to get_access_token_url(assigns(:get_access_token))
  end

  def test_destroy
    get_access_token = GetAccessToken.first
    delete :destroy, :id => get_access_token
    assert_redirected_to get_access_tokens_url
    assert !GetAccessToken.exists?(get_access_token.id)
  end
end
