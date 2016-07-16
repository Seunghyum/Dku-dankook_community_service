class SchoolPhoneSearchingsController < ApplicationController
  def new
      @new_search = SchoolPhoneSearching.new
      @campus = ["죽전", "천안"]
  end

  def create
      @search = SchoolPhoneSearching.create(search_params)
      redirect_to @search
  end


  def show
      @campus = ["죽전", "천안"]
      @new_search = SchoolPhoneSearching.new
      @search = SchoolPhoneSearching.find(params[:id])
      @search_school_phone = @search.search_school_phone
  end

  def update
      @search = SchoolPhoneSearching.create(search_params)
      redirect_to @search
  end

	private

	def search_params
		params.require(:school_phone_searching).permit(:campus, :belong, :name, :phone)
	end
end
