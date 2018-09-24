namespace :db do
  task prod_seed_bp_rivp_2018: :environment do
    load(Rails.root.join("db", "prod_seed_bp_rivp_2018.rb"))
  end
  desc "Resets the database and loads it from db/dev_seeds.rb"
  task dev_seed: :environment do
    load(Rails.root.join("db", "dev_seeds.rb"))
  end
  task dev_seed_fr: :environment do
    load(Rails.root.join("db", "dev_seeds_fr.rb"))
  end
  task dev_seed_budget_fr: :environment do
    load(Rails.root.join("db", "dev_seeds_budget_fr.rb"))
  end
  task prod_seed_budget_fr: :environment do
    load(Rails.root.join("db", "prod_seeds_budget_fr.rb"))
  end
end
