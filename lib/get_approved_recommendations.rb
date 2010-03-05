class GetApprovedRecommendations < AppKernel::Function
  def execute
    Recommendation.approved
  end
end
