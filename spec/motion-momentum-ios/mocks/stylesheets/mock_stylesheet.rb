class MockStylesheet < Momentum::Stylesheet
  def root(v)
    title_label(v.title_label)
  end

  def title_label(v)
    v.text = self.data[:title]
  end
end