namespace :db do
   desc "Purge stale entries from dinner table"
   task remove_old_suppr: :environment do
       puts "Purging old dinners..."
       Dinner.remove_old
  end
end