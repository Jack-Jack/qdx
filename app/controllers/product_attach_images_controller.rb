class ProductAttachImagesController < ApplicationController
  # GET /product_attach_images
  # GET /product_attach_images.json
  def index
    @product_attach_images = ProductAttachImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_attach_images }
    end
  end

  # GET /product_attach_images/1
  # GET /product_attach_images/1.json
  def show
    @product_attach_image = ProductAttachImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_attach_image }
    end
  end

  # GET /product_attach_images/new
  # GET /product_attach_images/new.json
  def new
    @product_attach_image = ProductAttachImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_attach_image }
    end
  end

  # GET /product_attach_images/1/edit
  def edit
    @product_attach_image = ProductAttachImage.find(params[:id])
  end

  # POST /product_attach_images
  # POST /product_attach_images.json
  def create
    @product_attach_image = ProductAttachImage.new(params[:product_attach_image])

    respond_to do |format|
      if @product_attach_image.save
        format.html { redirect_to @product_attach_image, notice: 'Product attach image was successfully created.' }
        format.json { render json: @product_attach_image, status: :created, location: @product_attach_image }
      else
        format.html { render action: "new" }
        format.json { render json: @product_attach_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_attach_images/1
  # PUT /product_attach_images/1.json
  def update
    @product_attach_image = ProductAttachImage.find(params[:id])

    respond_to do |format|
      if @product_attach_image.update_attributes(params[:product_attach_image])
        format.html { redirect_to @product_attach_image, notice: 'Product attach image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_attach_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_attach_images/1
  # DELETE /product_attach_images/1.json
  def destroy
    @product_attach_image = ProductAttachImage.find(params[:id])
    @product_attach_image.destroy

    respond_to do |format|
      format.html { redirect_to product_attach_images_url }
      format.json { head :no_content }
    end
  end

  def product_images
    @product_images = ProductAttachImage.where("product_id = #{params[:product_id]}").all

    respond_to do |format|
      format.html # product_images.html.erb
      format.json { render json: @product_images }
    end
  end
end
