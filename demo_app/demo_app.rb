require 'sinatra/base'
require 'json'

class DemoApp < Sinatra::Base
  set :public_folder, 'public'

  # Helper method for generating fully qualified paths
  def self.relative_path(*path)
    File.expand_path(File.join(path), File.dirname(__FILE__))
  end

  # Make sure our JAR files are on the classpath
  $CLASSPATH << relative_path('..', 'lib', 'poi-3.11-20141221.jar')
  $CLASSPATH << relative_path('..', 'lib', 'poi-scratchpad-3.11-20141221.jar')


  get '/' do
    File.read(File.expand_path(File.join('..', 'public', 'index.html'), File.dirname(__FILE__)))
  end

  get '/ruby-info' do
    "#{RUBY_PLATFORM} - #{RUBY_ENGINE} - #{RUBY_VERSION}p#{RUBY_PATCHLEVEL}"
  end

  # generate a slideshow from the provided JSON data
  # using the POI HSLF library
  post '/slideshow' do
    slide_data = JSON.parse(request.body.read)
    file_name = "slideshow-#{Time.now.to_i}.ppt"
    file = DemoApp.relative_path('..', 'public', file_name)
    ppt = Java::OrgApachePoiHslfUsermodel::SlideShow.new

    slide_data.each do |slide|
      s = ppt.create_slide
      t = s.add_title
      t.set_text(slide['title'])
    end

    File.open(DemoApp.relative_path(file), 'w+') do |f|
      ppt.write(f.to_outputstream)
    end

    file_name
  end
end