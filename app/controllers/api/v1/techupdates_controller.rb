require 'open-uri'
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
  # The json url is taken based on environment
  def load_json_file
    @json_array = JSON.parse(open(Rails.configuration.json_url).read.force_encoding("ISO-8859-1").encode("UTF-8"))
  end
end