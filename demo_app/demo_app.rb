require 'sinatra/base'

class DemoApp < Sinatra::Base
  set :public_folder, 'public'

  get '/' do
    File.read(File.expand_path(File.join('..', 'public', 'index.html'), File.dirname(__FILE__)))
  end

  get '/ruby-info' do
    "#{RUBY_PLATFORM} - #{RUBY_ENGINE} - #{RUBY_VERSION}p#{RUBY_PATCHLEVEL}"
  end

  get '/items' do
    "items"
  end
end