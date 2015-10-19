#
class Url < ActiveRecord::Base
  before_create do
    self.click_count = 0
  end

  def self.build_from_params(params)
    url = nil
    if params.key?(:id)
      url = Url.find_by_id(params[:id])
    elsif params.key?(:unmatched_route)
      url = Url.find_by_shortened("/#{params[:unmatched_route]}")
    end
    url
  end
end
