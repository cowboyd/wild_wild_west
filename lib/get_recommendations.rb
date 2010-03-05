class GetRecommendations < AppKernel::Function
  option :type, :type => Symbol, :index => 0

  def execute()
    case @type
      when :random # will take number later
      [Recommendation.approved[(rand * Recommendation.approved.length).floor]]
      when :approved
      Recommendation.approved
      when :pending
      Recommendation.pending
      else
      raise "unknown type"
    end
  end
end
