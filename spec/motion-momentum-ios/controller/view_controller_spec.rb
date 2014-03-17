describe Momentum::ViewController do

  context "normal controller" do

    before { @vc = MockController.new }

    it "starts with an empty params hash" do
      @vc.params.class.should == Hash
    end

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

    it "should use the stylesheet class as it's stylesheet when the view is loaded" do
      @vc.loadView
      @vc.stylesheet.class.should == MockStylesheet
    end

    it "does not set the delegate or data source on the view if it does not need one" do
      @vc.view_class = NoDelegateOrDataSourceMockView
      lambda { @vc.loadView }.should.not.raise(NoMethodError)
    end

    it "calls setup if it's defined when the view appears" do
      CallbackHelper.shared.data[:setup_called] = false
      @vc.loadView
      @vc.viewDidLoad
      CallbackHelper.shared.data[:setup_called].should == true
    end

    it "can set the title for the class" do
      @vc.title.should == "Mock"
    end

    it "will still use the title instance variable though" do
      @vc.loadView
      @vc.viewDidLoad
      @vc.title.should == "Custom"
    end

    it "configures the view after setup" do
      @vc.loadView
      @vc.viewDidLoad
      @vc.view.title_label.text.should == "Title Label"
    end

    it "can be initalized with options" do
      @vc = MockController.alloc.initWithAttributes(post: { title: "Testing" })
      @vc.post[:title].should == "Testing"
    end

  end

  context "no setup controller" do

    before { @vc = NoSetupMockController.new }

    it "does not call setup if it's not defined when the view appears" do
      lambda { @vc.viewDidLoad }.should.not.raise(NoMethodError)
    end

    it "will return nil with no class title or title instance variable" do
      @vc.title.should == nil
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

  context "no related classes" do
    
    before { @vc = NoRelatedClassesMockController.new }

    it "has a UIView as it's view" do
      @vc.loadView
      @vc.view.class.should == UIView
    end

    it "has a Momentum::Delegate as it's delegate" do
      @vc.loadView
      @vc.delegate.class.should == Momentum::Delegate
    end

    it "has a Momentum::Stylesheet as it's stylesheet" do
      @vc.loadView
      @vc.stylesheet.class.should == Momentum::Stylesheet
    end

  end
end