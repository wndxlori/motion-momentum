class MockController < Momentum::ViewController
  title "Mock"

  def setup
    CallbackHelper.shared.data[:setup_called] = true
    self.title = "Custom"
    self.stylesheet.data = { title: 'Title Label' }
  end
end