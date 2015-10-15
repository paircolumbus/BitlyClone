class Url < ActiveRecord::Base

  def self.build_from_params params
    url = nil
    if params.has_key?(:id)
      url = Url.find_by_id(params[:id])
    elsif params.has_key?(:unmatched_route)
      url = Url.find_by_shortened("/#{params[:unmatched_route]}")
    end
    url
  end

end
