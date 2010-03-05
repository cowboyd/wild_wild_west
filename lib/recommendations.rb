def approve_recommendation(r)
  ApproveRecommendation.call(r)
end

def get_random_recommendation
  GetRandomRecommendation.call()
end

def get_pending_recommendations
  GetPendingRecommendations.call()
end

def get_approved_recommendations
  GetApprovedRecommendations.call()
end

class Recommendation
  attr_reader :person, :job_title, :company, :homepage, :body

  @pending = []
  def self.pending
    @pending
  end
  @approved = []
  def self.approved
    @approved
  end

  def initialize(options)
    @person = options[:person]
    @job_title = options[:job_title]
    @company = options[:company]
    @homepage = options[:homepage]
    @body = options[:body]
  end
end
