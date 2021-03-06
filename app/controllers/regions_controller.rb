class RegionsController < InheritedResources::Base
  respond_to :xml, :json, :only => [:index, :show]

  def index
    respond_with(@regions = Region.all, :methods => [:subdir, :emailContact])
  end

  def show
    respond_with(@region = Region.find(params[:id]))
  end

  def four_square_export
    @regions = Region.all
  end
end
