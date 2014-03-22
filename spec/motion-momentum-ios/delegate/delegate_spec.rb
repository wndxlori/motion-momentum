describe Momentum::Delegate do

  before do
    @vc = MockController.new
    @vc.loadView
    @vc.viewDidLoad
    @delegate = @vc.delegate
  end

  describe ".controller_from_view:" do

    it "can find a view's controller" do
      @delegate.controller_from_view(@vc.view.title_label).should == @vc
    end

  end

end