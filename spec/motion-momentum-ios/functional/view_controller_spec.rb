describe "Momentum::ViewController functional spec" do
  tests Momentum::ViewController

  def controller
    rotate_device to: :portrait, button: :bottom
    @controller ||= MockController.new
  end

  after do
    @controller = nil
  end

  it "displays the label with the right text" do
    @controller.view.title_label.text.should == "Title Label"
  end
end