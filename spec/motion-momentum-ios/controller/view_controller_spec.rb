describe Momentum::ViewController do

  context "normal controller" do

    before { @vc = MockController.new }

    it "should default to using MockView as it's view class" do
      @vc.view_class.should == MockView
    end

    it "should default to using MockDelegate as it's delegate class" do
      @vc.delegate_class.should == MockDelegate
    end

    it "should default to using MockStylesheet as it's stylesheet class" do
      @vc.stylesheet_class.should == MockStylesheet
    end

    it "should use the view class as it's view when the view is loaded" do
      @vc.loadView
      @vc.view.class.should == MockView
    end

    it "should use the delegate class as it's delegate when the view is loaded" do
      @vc.loadView
      @vc.delegate.class.should == MockDelegate
    end

    it "should use the delegate class as the view's delegate when the view is loaded" do
      @vc.loadView
      @vc.view.delegate.class.should == MockDelegate
    end

    it "should use the delegate class as the view's dataSource when the view is loaded" do
      @vc.loadView
      @vc.view.dataSource.class.should == MockDelegate
    end

    it "does not set the delegate or data source on the view if it does not need one" do
      @vc.view_class = NoDelegateOrDataSourceMockView
      lambda { @vc.loadView }.should.not.raise(NoMethodError)
    end

    it "calls setup if it's defined when the view appears" do
      CallbackHelper.shared.data[:setup_called] = false
      @vc.viewDidAppear(true)
      CallbackHelper.shared.data[:setup_called].should == true
    end

  end

  context "no setup controller" do

    it "does not call setup if it's not defined when the view appears" do
      @vc = NoSetupMockController.new
      lambda { @vc.viewDidAppear(true) }.should.not.raise(NoMethodError)
    end

  end

  context "custom related classes controller" do

    before { @vc = CustomMockController.new }

    it "uses the defined view" do
      @vc.view_class.should == CustomMockScrollView
    end

    it "uses the defined delegate" do
      @vc.delegate_class.should == CustomDataSource
    end

    it "uses the defined stylesheet" do
      @vc.stylesheet_class.should == CustomStyles
    end

  end
end