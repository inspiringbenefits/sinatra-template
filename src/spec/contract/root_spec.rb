# frozen_string_literal: true

RSpec.describe 'GET root' do
  context '200' do
    it 'returns status 200' do
      get '/'
      expect last_response.ok?
      expect last_response.body.include?('Hello World!!')
    end
  end
end
