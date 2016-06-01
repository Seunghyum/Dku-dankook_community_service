class PhoneSearchController < ApplicationController
  def search
  end

  def searching

  end

  def result
    #advanced search duㅇ상보고 따라하기
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:phone_search).permit(:phone, :name, :belong)
    end
end
