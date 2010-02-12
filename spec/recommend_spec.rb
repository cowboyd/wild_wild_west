require 'rubygems'
require 'spec'
$: << File.dirname(__FILE__) + '/../lib'
require 'recommendations'

describe 'recommendations' do
  before(:each) do
    Recommendation.approved.clear
    Recommendation.pending.clear
  end
  it 'can accept a new recommendation' do
    recommendation = add_recommendation :person => 'Lenny Kravitz', :job_title => 'CEO', :company => 'Google', :homepage => 'http://www.google.com', :body => 'Rainbow shittin'
    recommendation.person.should == 'Lenny Kravitz'
    recommendation.job_title.should == 'CEO'
    recommendation.company.should == 'Google'
    recommendation.homepage.should == 'http://www.google.com'
    recommendation.body.should == 'Rainbow shittin'
    get_pending_recommendations.length.should == 1
    get_approved_recommendations.length.should == 0
  end
  it 'will grab a random approved recommendation' do
    r = add_recommendation :person => 'Lenny Kravitz', :job_title => 'CEO', :company => 'Google', :homepage => 'http://www.google.com', :body => 'Rainbow shittin'
    approve_recommendation(r)
    get_random_recommendation.should be(r)
  end
  it 'requires a recommendation body, a job title, company name, and site link' do
    proc do
      add_recommendation :person => 'Lenny Kravitz', :job_title => 'CEO', :company => 'Google', :homepage => 'http://www.google.com'
    end.should raise_error
  end
  it 'will not return a recommendation that has not been approved' do
    add_recommendation :person => 'Lenny Kravitz', :job_title => 'CEO', :company => 'Google', :homepage => 'http://www.google.com', :body => 'Rainwob shittin'
    get_random_recommendation.should be(nil)
  end
end

