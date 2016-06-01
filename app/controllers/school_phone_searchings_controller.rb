class SchoolPhoneSearchingsController < ApplicationController
    def new
        @search = SchoolPhoneSearching.new
        @campus = ["죽전", "천안"]
    end
    def create
        @search = SchoolPhoneSearching.create(search_params)
        redirect_to @search
    end
    def show
        @search = SchoolPhoneSearching.find(params[:id])
    end

	private

	def search_params
		params.require(:school_phone_searching).permit(:campus, :belong, :name, :phone)
	end
end
