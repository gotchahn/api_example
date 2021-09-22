class Api::InternetUsagesController < ApiController
  def index
    usages = InternetUsage.filter(params[:q], params[:year])
    render json: { data: usages }, status: 200
  end

  def show
    usage = InternetUsage.find(params[:id])
    render json: { data: usage }, status: 200
  rescue ActiveRecord::RecordNotFound
    render json: { errors: "Usage with id #{params[:id]} does not exist" }, status: 404
  end


end
