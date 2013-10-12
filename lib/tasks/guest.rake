namespace :guests do
  desc "Remove guest accounts more than a day old."
  task cleanup: :environment do
    User.where(guest: :true).where("created_at < ?", 1.day.ago).destroy_all
  end
end