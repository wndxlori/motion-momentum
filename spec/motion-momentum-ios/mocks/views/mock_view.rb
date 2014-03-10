class MockView < UIView
  attr_accessor :delegate, :dataSource

  def delegate=(delegate)
    @delegate = WeakRef.new(delegate)
  end

  def dataSource=(dataSource)
    @dataSource = WeakRef.new(dataSource)
  end
end