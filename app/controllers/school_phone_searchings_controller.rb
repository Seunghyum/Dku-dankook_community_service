class SchoolPhoneSearchingsController < ApplicationController

  def new
      @campus = ["죽전", "천안"]
      # @new_search = SchoolPhoneSearching.new
      if params[:search]
        @result = SchoolPhoneSearching.search(params[:search],params[:campus]).order("created_at DESC")
      else
        @result = SchoolPhoneSearching.all.order('created_at DESC')
      end
      @result = @result.page(params[:page]).per(20)
  end


	private

	def search_params
		params.require(:school_phone_searching).permit(:campus, :belong, :name, :phone)
	end

end
