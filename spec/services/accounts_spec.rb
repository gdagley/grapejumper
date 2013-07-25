require 'spec_helper'
require 'fdoc/spec_watcher'

describe GrapeJumper::Accounts do
  include Rack::Test::Methods
  include Fdoc::SpecWatcher

  def app
    @app ||= GrapeJumper::API.new
  end

  context 'POST / ' do
    it 'should be successful' do
      post '/'
      last_response.status.should == 201
      parse_json(last_response.body, "msg").should == "Success!"
    end
  end
end
