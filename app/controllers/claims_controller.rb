class ClaimsController < ApplicationController
  def index
    render json: current_user.claims,
           serializer: ActiveModel::Serializer::CollectionSerializer,
           each_serializer: ClaimSerializer
  end

  private

  def current_user
    @current_user ||= User.new
  end
end
