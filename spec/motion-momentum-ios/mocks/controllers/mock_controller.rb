class MockController < Momentum::ViewController
  def setup
    CallbackHelper.shared.data[:setup_called] = true
  end
end