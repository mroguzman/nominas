class ContributionGroupsController < ApplicationController
  # GET /contribution_groups
  # GET /contribution_groups.json
  def index
    @contribution_groups = ContributionGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contribution_groups }
    end
  end

  # GET /contribution_groups/1
  # GET /contribution_groups/1.json
  def show
    @contribution_group = ContributionGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contribution_group }
    end
  end

  # GET /contribution_groups/new
  # GET /contribution_groups/new.json
  def new
    @contribution_group = ContributionGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contribution_group }
    end
  end

  # GET /contribution_groups/1/edit
  def edit
    @contribution_group = ContributionGroup.find(params[:id])
  end

  # POST /contribution_groups
  # POST /contribution_groups.json
  def create
    @contribution_group = ContributionGroup.new(params[:contribution_group])

    respond_to do |format|
      if @contribution_group.save
        format.html { redirect_to @contribution_group, notice: 'Contribution group was successfully created.' }
        format.json { render json: @contribution_group, status: :created, location: @contribution_group }
      else
        format.html { render action: "new" }
        format.json { render json: @contribution_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contribution_groups/1
  # PUT /contribution_groups/1.json
  def update
    @contribution_group = ContributionGroup.find(params[:id])

    respond_to do |format|
      if @contribution_group.update_attributes(params[:contribution_group])
        format.html { redirect_to @contribution_group, notice: 'Contribution group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contribution_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contribution_groups/1
  # DELETE /contribution_groups/1.json
  def destroy
    @contribution_group = ContributionGroup.find(params[:id])
    @contribution_group.destroy

    respond_to do |format|
      format.html { redirect_to contribution_groups_url }
      format.json { head :no_content }
    end
  end
end
