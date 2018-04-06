namespace :managers do
  desc "Generate manager tokens"
  task :generate_tokens => :environment do
    Manager.all.each do |manager|
      if manager.token.blank?
        loop do
          manager.token = Devise.friendly_token
          break token unless Manager.where(token: token).first
        end
        manager.save
        puts "Added Token to Managers #{manager.full_name}"
      end
    end
  end
end