class WisataController < ApplicationController
  before_action :set_wisatum, only: %i[ show update destroy ]

  # GET /wisata
  def index
    @wisata = Wisatum.all
    data = {"data" => @wisata,"status" => 200}

    render json: data
  end

  # GET /wisata/1
  def show
    render json: @wisatum
  end

  # POST /wisata
  def create
    @wisatum = Wisatum.new(wisatum_params)

    if @wisatum.save
      data = {"data" => @wisatum,"status" => 201}
      render json: data, location: @wisatum
    else
      data = {"data" => "something went wrong","status" => 401}
      render json: data
    end
  end

  # PATCH/PUT /wisata/1
  def update
    if @wisatum.update(wisatum_params)
      render json: @wisatum
    else
      render json: @wisatum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wisata/1
  def destroy
    @wisatum.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wisatum
      @wisatum = Wisatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wisatum_params
      params.require(:wisatum).permit(:nama_wisata, :harga)
    end
end
