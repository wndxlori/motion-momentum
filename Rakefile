$:.unshift("/Library/RubyMotion/lib")
if ENV['osx']
  require 'motion/project/template/osx'
else
  require 'motion/project/template/ios'
end

require 'bundler'
Bundler.require(:development)

require 'motion-momentum'

module Motion
  module Project
    class Config
      def spec_files=(spec_files)
        @spec_files = spec_files
      end
    end
  end
end

Motion::Project::App.setup do |app|
  app.name = 'MomentumTest'
  app.identifier = 'tv.motioninmotion.MomentumTest'
  app.version = Momentum::VERSION
  app.redgreen_style = :full
  app.detect_dependencies = true

  # Get correct files for iOS or OS X
  app.files -= Dir.glob('./app/**/*.rb')
  app.files += Dir.glob("./app/#{app.template}/**/*.rb")
  app.spec_files -= Dir.glob('./spec/**/*.rb')
  app.spec_files += Dir.glob('./spec/motion-momentum/**/*.rb')
  app.spec_files += Dir.glob("./spec/motion-momentum-#{app.template}/**/*.rb")
end