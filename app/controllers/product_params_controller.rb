class ProductParamsController < ApplicationController
  before_filter :authenticate_admin!

  # GET /product_params
  # GET /product_params.json
  def index
    @product_params = ProductParam.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_params }
    end
  end

  # GET /product_params/1
  # GET /product_params/1.json
  def show
    @product_param = ProductParam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_param }
    end
  end

  # GET /product_params/new
  # GET /product_params/new.json
  def new
    @product_param = ProductParam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_param }
    end
  end

  # GET /product_params/1/edit
  def edit
    @product_param = ProductParam.find(params[:id])
  end

  # POST /product_params
  # POST /product_params.json
  def create
    @product_param = ProductParam.new(params[:product_param])

    respond_to do |format|
      if @product_param.save
        format.html { redirect_to @product_param, notice: 'Product param was successfully created.' }
        format.json { render json: @product_param, status: :created, location: @product_param }
      else
        format.html { render action: "new" }
        format.json { render json: @product_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_params/1
  # PUT /product_params/1.json
  def update
    @product_param = ProductParam.find(params[:id])

    respond_to do |format|
      if @product_param.update_attributes(params[:product_param])
        format.html { redirect_to @product_param, notice: 'Product param was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_params/1
  # DELETE /product_params/1.json
  def destroy
    @product_param = ProductParam.find(params[:id])
    @product_param.destroy

    respond_to do |format|
      format.html { redirect_to product_params_url }
      format.json { head :no_content }
    end
  end
end
