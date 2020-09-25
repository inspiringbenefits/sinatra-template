# frozen_string_literal: true

require_relative '../sinatra_template'

module SinatraTemplate
  # App
  class App
    def app
      ::Rack::Builder.new do
        run SinatraTemplate::Routes
      end
    end
  end
end
