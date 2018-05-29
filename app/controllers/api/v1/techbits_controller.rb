require 'open-uri'
class API::V1::TechbitsController < ApiController
  before_action :load_json_file

   # Get all the records in the JSON file
  def all
    render json: @json_array
  end

  # Get only records which have active field set to true
  def active
    result = @json_array.select do |record|
      record["active"] == true
    end
    render json: result
  end

  private

  # Load the file from public assets directory
  # The json url is taken based on environment
  def load_json_file
    @json_array = Techbit.all
  end

  def techupdate_params
    params.permit(:techupdate).permit(:title, :description, :url, :active)
  end
end
