module LG
  module V1
    class Sessions < Grape::API
      # #<$ client Sign In API $>##
      desc 'Authenticate client and return client object / access token'

      params do
        requires :email, type: String, desc: 'client email'
        requires :password, type: String, desc: 'client Password'
      end

      post do
        email = params[:email]
        password = params[:password]

        if email.nil? || password.nil?
          error!({error_code: 404, error_message: 'Invalid Email or Password.'}, 401)
          return
        end

        client = Client.where(email: email.downcase).first
        if client.nil?
          error!({error_code: 404, error_message: 'Invalid Email or Password.'}, 401)
          return
        end

        if !client.valid_password?(password)
          error!({error_code: 404, error_message: 'Invalid Email or Password.'}, 401)
          return
        else
          client.ensure_authentication_token
          client.save
          {status: 'ok', auth_token: client.authentication_token}
        end
      end

      desc 'Destroy the access token'
      params do
        requires :auth_token, type: String, desc: 'client Access Token'
      end
      delete ':auth_token' do
        auth_token = params[:auth_token]
        client = Client.where(authentication_token: auth_token).first
        if client.nil?
          error!({error_code: 404, error_message: 'Invalid access token.'}, 401)
          return
        else
          client.reset_authentication_token
          {status: 'ok'}
        end
      end
    end
  end
end