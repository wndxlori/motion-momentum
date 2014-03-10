class CallbackHelper
  attr_accessor :data

  def self.shared
    Dispatch.once do
      @shared = self.new
      @shared.data = {}
    end
    @shared
  end
end