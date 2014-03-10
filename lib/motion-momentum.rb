Motion::Project::App.setup do |app|
  app.files += Dir.glob(File.join(File.dirname(__FILE__), 'motion-momentum/**/*.rb'))
  app.files += Dir.glob(File.join(File.dirname(__FILE__), "motion-momentum-#{app.template}/**/*.rb"))
end