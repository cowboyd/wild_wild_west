class GetPendingRecommendations < AppKernel::Function
  def execute
    Recommendation.pending
  end
end
