class VinylsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :require_login   # Add this line
  before_action :set_vinyl, only: %i[show edit update destroy]


  # GET /vinyls or /vinyls.json
  def index
    @vinyls = Vinyl.all
    render json: @vinyls
  end

  # GET /vinyls/1 or /vinyls/1.json
  def show
    render json: @vinyl
  end

  # GET /vinyls/new
  def new
    @vinyl = Vinyl.new
  end

  # GET /vinyls/1/edit
  def edit
  end

  # POST /vinyls or /vinyls.json
  def create
    vinyl = Vinyl.new(vinyl_params)
    if vinyl.save
      render json: vinyl, status: :created
    else
      render json: vinyl.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vinyls/1 or /vinyls/1.json
  def update
    if @vinyl.update(vinyl_params)
      render json: @vinyl
    else
      render json: @vinyl.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vinyls/1 or /vinyls/1.json
  def destroy
    @vinyl.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vinyl
      @vinyl = Vinyl.find(params[:id])
    end

    def require_login
      unless session[:user_id]
        render json: { error: 'You must be logged in to access this section' }, status: :unauthorized
      end
    end

    # Only allow a list of trusted parameters through.
    def vinyl_params
      params.require(:vinyl).permit(:album_name, :artist_name, :album_art_url)
    end
end
