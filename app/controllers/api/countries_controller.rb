class Api::CountriesController < ApiController

  def index
     countries = Country.order(:name)
     render json: { data: countries }.to_json, status: 200
  end

  def show
    country = Country.find(params[:id])
    render json: { data: country }.to_json, status: 200
  rescue ActiveRecord::RecordNotFound
    render json: { errors: "Country with id #{params[:id]} does not exist" }, status: 404
  end

  def create
    country = Country.new(country_params)
    if country.save
      render json: { data: country }.to_json, status: :created
    else
      render json: { errors: country.errors.full_messages }, status: 422
    end
  end

  def update
    country = Country.find(params[:id])

    if country.update(country_params)
      render json: { data: country }.to_json, status: 204
    else
      render json: { errors: country.errors.full_messages }, status: 422
    end
  rescue ActiveRecord::RecordNotFound
    render json: { errors: "Country with id #{params[:id]} does not exist" }, status: 404
  end

  def destroy
    country = Country.find(params[:id])
    country.destroy
    render json: { data: country }.to_json, status: 200
  rescue ActiveRecord::RecordNotFound
    render json: { errors: "Country with id #{params[:id]} does not exist" }, status: 404
  end

  protected

  def country_params
    params.require(:data).permit(:name, :code)
  end
end
