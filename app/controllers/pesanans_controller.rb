class PesanansController < ApplicationController
  before_action :set_pesanan, only: %i[ show update destroy ]

  # GET /pesanans
  def index
    if params["creator"] == "user"
      @pesanans = Pesanan.all.where(creator: params['creator'])
      data = {"data" => @pesanans,"status" => 200}
      render json: data
    else
      @pesanans = Pesanan.all
      data = {"data" => @pesanans,"status" => 200}
      render json: data
    end

  end

  # GET /pesanans/1
  def show
    @wisata = Wisatum.find(@pesanan.wisata)
    @rekening = Rekening.find(@pesanan.rekening_penerima)
    @new_model = @pesanan.attributes.except("wisata", "rekening_penerima")
    data = {
      "data"=> {
        "wisata"=> @wisata,
        "rekening_penerima"=>@rekening,
  }.merge(@new_model),
      "status"=> 200
    }
    render json: data
  end

  # POST /pesanans
  def create
    @pesanan = Pesanan.new(pesanan_params)
    if @pesanan.save
      data = {"data" => @pesanan,"status" => 201}
      render json: data, location: @pesanan
    else
      data = {"data" => "something went wrong","status" => 401}
      render json: data
    end
  end

  # PATCH/PUT /pesanans/1
  def update
    if @pesanan.update(pesanan_params)
      render json: @pesanan
    else
      render json: @pesanan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pesanans/1
  def destroy
    @pesanan.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pesanan
      @pesanan = Pesanan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pesanan_params
      params.require(:pesanan).permit(:nama_bank_pemesan, :nama_pemesan, :nomor_pemesan, :nama_rekening_pemesan, :nomor_rekening_pemesan, :wisata, :rekening_penerima, :jumlah_ticket, :total_harga, :image, :owner_id, :status, :creator)
    end
end
