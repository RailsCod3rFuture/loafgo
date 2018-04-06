namespace :clients do
  desc "Generate client tokens"
  task :generate_tokens => :environment do
    Client.all.each do |client|
      if client.token.blank?
        loop do
          client.token = Devise.friendly_token
          break token unless Client.where(token: token).first
        end
        client.save
        puts "Added Token to Managers #{client.full_name}"
      end
    end
  end
end