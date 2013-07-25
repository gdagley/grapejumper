module GrapeJumper
  class API < Grape::API
    format :json
    mount ::GrapeJumper::Accounts
  end
end
