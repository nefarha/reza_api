class RekeningsController < ApplicationController
  before_action :set_rekening, only: %i[ show update destroy ]

  # GET /rekenings
  def index
    @rekenings = Rekening.all
    data = {"data" => @rekenings,"status" => 200}

    render json: data
  end

  # GET /rekenings/1
  def show
    render json: @rekening
  end

  # POST /rekenings
  def create
    @rekening = Rekening.new(rekening_params)

    if @rekening.save
      data = {"data" => @rekening,"status" => 201}
      render json: data, location: @rekening
    else
      data = {"data" => "something went wrong","status" => 401}
      render json: data
    end
  end

  # PATCH/PUT /rekenings/1
  def update
    if @rekening.update(rekening_params)
      render json: @rekening
    else
      render json: @rekening.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rekenings/1
  def destroy
    @rekening.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rekening
      @rekening = Rekening.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rekening_params
      params.require(:rekening).permit(:name, :bank_name, :owner_id, :number)
    end
end
