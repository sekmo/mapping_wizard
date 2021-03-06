class MappingsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :set_mapping, only: %i[ show edit update destroy ]

  # GET /mappings or /mappings.json
  def index
    @partner = Partner.find(params[:partner_id])
    @mappings = Mapping.all.order(:id)
  end

  # GET /mappings/1 or /mappings/1.json
  def show
  end

  # GET /mappings/new
  def new
    @mapping = Mapping.new
  end

  # GET /mappings/1/edit
  def edit
  end

  # POST /mappings or /mappings.json
  def create
    @mapping = Mapping.new(mapping_params)

    respond_to do |format|
      if @mapping.save
        format.html { redirect_to @mapping, notice: "Mapping was successfully created." }
        format.json { render :show, status: :created, location: @mapping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mappings/1 or /mappings/1.json
  def update
    respond_to do |format|
      if @mapping.update(mapping_params)
        format.html { redirect_to @mapping, notice: "Mapping was successfully updated." }
        format.json { render :show, status: :ok, location: @mapping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  def batch_update
    ids_to_update = params[:ids]
    property_to_update = params[:property_to_update]
    value = params[:value]
    Mapping.where(id: ids_to_update).update_all(property_to_update.to_sym => value)
  end

  # DELETE /mappings/1 or /mappings/1.json
  def destroy
    @mapping.destroy
    respond_to do |format|
      format.html { redirect_to mappings_url, notice: "Mapping was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mapping
      @mapping = Mapping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mapping_params
      params.require(:mapping).permit(:partner_id, :dalia_key, :dalia_value, :partner_key, :partner_value)
    end
end
