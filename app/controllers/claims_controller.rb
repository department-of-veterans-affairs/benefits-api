class ClaimsController < ApplicationController
  def create
    claim = Claim.new(claim_params)
    render json: claim, serializer: ClaimSerializer
  end

  private

  def claim_params
    params.require(:claim).permit(:id)
  end
end
