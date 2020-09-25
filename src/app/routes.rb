# frozen_string_literal: true

module SinatraTemplate
  # Routes for the applications
  class Routes < Sinatra::Base
    set :raise_errors, false

    get '/' do
      @message = 'Hello World!!'
      haml :hello_world
    end
  end
end
