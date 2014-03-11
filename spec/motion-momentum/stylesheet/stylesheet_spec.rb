describe Momentum::Stylesheet do

  before { @stylesheet = Momentum::Stylesheet.new }

  it "starts with an empty data hash" do
    @stylesheet.data.class.should == Hash
  end

end