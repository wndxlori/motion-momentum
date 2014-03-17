class MockController < Momentum::ViewController
  attr_accessor :post

  title "Mock"

  def setup
    CallbackHelper.shared.data[:setup_called] = true
    self.title = "Custom"
    self.stylesheet.data = { title: 'Title Label' }
  end
end