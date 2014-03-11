class MockView < UIView
  attr_accessor :delegate, :dataSource, :title_label

  def init
    super
    self.title_label = UILabel.new
    self
  end

  def delegate=(delegate)
    @delegate = WeakRef.new(delegate)
  end

  def dataSource=(dataSource)
    @dataSource = WeakRef.new(dataSource)
  end
end