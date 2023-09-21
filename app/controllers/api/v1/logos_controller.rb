class Api::V1::LogosController < ApplicationController
  def create
    result = Logos::Create.new(review_params, request).call
    render_response(result)
  end

  private

  def logo_params
    params.require(:logo).permit(:company_name, :industry_id, :slogan,
                                 :icon_required, icon_ids: [])
  end
end