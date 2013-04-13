class ProfessionalCategoriesController < ApplicationController
  # GET /professional_categories
  # GET /professional_categories.json
  def index
    @professional_categories = ProfessionalCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @professional_categories }
    end
  end

  # GET /professional_categories/1
  # GET /professional_categories/1.json
  def show
    @professional_category = ProfessionalCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @professional_category }
    end
  end

  # GET /professional_categories/new
  # GET /professional_categories/new.json
  def new
    @professional_category = ProfessionalCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @professional_category }
    end
  end

  # GET /professional_categories/1/edit
  def edit
    @professional_category = ProfessionalCategory.find(params[:id])
  end

  # POST /professional_categories
  # POST /professional_categories.json
  def create
    @professional_category = ProfessionalCategory.new(params[:professional_category])

    respond_to do |format|
      if @professional_category.save
        format.html { redirect_to @professional_category, notice: 'Professional category was successfully created.' }
        format.json { render json: @professional_category, status: :created, location: @professional_category }
      else
        format.html { render action: "new" }
        format.json { render json: @professional_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /professional_categories/1
  # PUT /professional_categories/1.json
  def update
    @professional_category = ProfessionalCategory.find(params[:id])

    respond_to do |format|
      if @professional_category.update_attributes(params[:professional_category])
        format.html { redirect_to @professional_category, notice: 'Professional category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @professional_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professional_categories/1
  # DELETE /professional_categories/1.json
  def destroy
    @professional_category = ProfessionalCategory.find(params[:id])
    @professional_category.destroy

    respond_to do |format|
      format.html { redirect_to professional_categories_url }
      format.json { head :no_content }
    end
  end
end
