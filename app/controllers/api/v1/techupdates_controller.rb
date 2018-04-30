require 'open-uri'
class API::V1::TechupdatesController < ApiController
  before_action :load_json_file

  # GET api/v1/techupdates
  def index
    @techupdates = Techupdate.all
  end

  # GET api/v1/techudpates/:id
  def show
    @techupdate = Techupdate.find(params[:id])
  end

  # GET api/v1/techupdates/new
  def new
    @techupdate = Techupdate.new
  end

  # POST api/v1/techupdates
  def create
    @techupdate = Techupdate.new(techupdate_params)
    if @techupdate.save
      redirect_to @techupdate
    else
      render 'new'
    end
  end

  # GET api/v1/techupdates/:id/edit
  def edit
    @techudpate = Techupdate.find(params[:id])
  end

  # PATCH api/v1/techupdates/:id
  def update
    @techupdate = Techupdate.find(params[:id])
    if @techupdate.update(techupdate_params)
      redirect_to @techupdate
    else
      render 'edit'
    end
  end

  # DELETE api/v1/techupdates/:id
  def destroy
    @techupdate = Techupdate.find(params[:id])
    @techupdate.destroy

    redirect_to api_v1_techupdates_path
  end

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
    @json_array = JSON.parse(open(Rails.configuration.json_url).read.force_encoding("ISO-8859-1").encode("UTF-8"))
  end
end
