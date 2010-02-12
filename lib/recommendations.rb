def add_recommendation(options)
  Recommendation.new(options).tap do |r|
    Recommendation.pending.push(r)
  end
end

def approve_recommendation(r)
  if Recommendation.pending.member?(r)
    Recommendation.approved.push(Recommendation.pending.delete(r))
  end
end

def get_random_recommendation
  Recommendation.approved[(rand * Recommendation.approved.length).floor]
end

def get_pending_recommendations
  Recommendation.pending
end

def get_approved_recommendations
  Recommendation.approved
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
    @person = options[:person] or raise 'Person required'
    @job_title = options[:job_title] or raise 'job_title required'
    @company = options[:company] or raise 'company required'
    @homepage = options[:homepage] or raise 'homepage required'
    @body = options[:body] or raise 'body required'
  end
end
