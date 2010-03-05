class GetRandomRecommendation < AppKernel::Function
  def execute()
    Recommendation.approved[(rand * Recommendation.approved.length).floor]
  end
end
