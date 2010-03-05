require 'appkernel'

class ApproveRecommendation < AppKernel::Function
  option :recommendation, :type => Recommendation, :index => 0

  def execute()
    if Recommendation.pending.member?(@recommendation)
      Recommendation.approved.push(Recommendation.pending.delete(@recommendation))
    end
  end
end
