module GrapeJumper
  class Accounts < Grape::API
    format :json

    desc 'Create an account'
    post '/' do
      {:msg => 'Success!'}
    end

    desc 'Login an account'
    get 'login' do
      {:msg => 'Success!'}
    end
  end
end
