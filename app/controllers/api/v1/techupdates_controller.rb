class API::V1::TechupdatesController < ApplicationController
  before_action :load_json_file

  # Get all the records in the JSON file
  def get_all
    render json: @json_array 
  end

  # Get only records which have active field set to true
  def get_active
    result = @json_array.select do |record|
      record["active"] == true
    end
    render json: result
  end

  private 

  # Load the file from public assets directory
  def load_json_file
    @json_array = JSON.parse(File.read("#{Rails.root}/public/labornet-update.json"))
  end
end