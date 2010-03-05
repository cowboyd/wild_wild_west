require 'appkernel'

class AddRecommendation < AppKernel::Function
  # :person :job_title :company :homepage :body
  option :person, :type => String, :required => true
  option :job_title, :type => String, :required => true
  option :company, :type => String, :required => true
  option :homepage, :type => String, :required => true
  option :body, :type => String, :required => true

  def execute()
    Recommendation.new(:person => @person, :job_title => @job_title, :company => @company, :homepage => @homepage, :body => @body).tap do |r|
      Recommendation.pending.push(r)
    end
  end
end
