require 'spec'
$: << File.dirname(__FILE__) + '/../lib'
require 'wild_wild_west'

describe 'recommendations' do
  before(:each) do
    Recommendation.approved.clear
    Recommendation.pending.clear
  end
  it 'can accept a new recommendation' do
    recommendation = AddRecommendation.call :person => 'Lenny Kravitz', :job_title => 'CEO', :company => 'Google', :homepage => 'http://www.google.com', :body => 'Rainbow shittin'
    recommendation.person.should == 'Lenny Kravitz'
    recommendation.job_title.should == 'CEO'
    recommendation.company.should == 'Google'
    recommendation.homepage.should == 'http://www.google.com'
    recommendation.body.should == 'Rainbow shittin'
    get_recommendations(:pending).length.should == 1
    get_recommendations(:approved).length.should == 0
  end
  it 'will grab a random approved recommendation' do
    r = AddRecommendation.call :person => 'Lenny Kravitz', :job_title => 'CEO', :company => 'Google', :homepage => 'http://www.google.com', :body => 'Rainbow shittin'
    approve_recommendation(r)
    get_recommendations(:random).first.should be(r)
  end
  it 'requires a recommendation body, a job title, company name, and site link' do
    proc do
      AddRecommendation.call :person => 'Lenny Kravitz', :job_title => 'CEO', :company => 'Google', :homepage => 'http://www.google.com'
    end.should raise_error
  end
  it 'will not return a recommendation that has not been approved' do
    AddRecommendation.call :person => 'Lenny Kravitz', :job_title => 'CEO', :company => 'Google', :homepage => 'http://www.google.com', :body => 'Rainwob shittin'
    get_recommendations(:random).first.should be(nil)
  end
  it 'is an error to try and do a get that is not a valid get-type'
end

