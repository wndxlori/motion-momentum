describe Momentum::Delegate do

  before { @delegate = GeneralMockDelegate.new }

  it "starts with an empty data hash" do
    @delegate.data.class.should == Hash
  end

end