require 'test_helper'

class ProductAttachImagesControllerTest < ActionController::TestCase
  setup do
    @product_attach_image = product_attach_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_attach_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_attach_image" do
    assert_difference('ProductAttachImage.count') do
      post :create, product_attach_image: { image: @product_attach_image.image, product_id: @product_attach_image.product_id }
    end

    assert_redirected_to product_attach_image_path(assigns(:product_attach_image))
  end

  test "should show product_attach_image" do
    get :show, id: @product_attach_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_attach_image
    assert_response :success
  end

  test "should update product_attach_image" do
    put :update, id: @product_attach_image, product_attach_image: { image: @product_attach_image.image, product_id: @product_attach_image.product_id }
    assert_redirected_to product_attach_image_path(assigns(:product_attach_image))
  end

  test "should destroy product_attach_image" do
    assert_difference('ProductAttachImage.count', -1) do
      delete :destroy, id: @product_attach_image
    end

    assert_redirected_to product_attach_images_path
  end
end
