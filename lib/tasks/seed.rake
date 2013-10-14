namespace :seed do
  desc "Updates data base."
  task :update => :environment do

    Route.where(:branch_id => 1).each do |route|
      total_due = 0
      route.orders.each do |order|
        order.update_attribute(:loaded_to_route, true)
        total_due = order.total_due + total_due
      end
      route.update_attributes(:total_route_due => total_due, :current_route_due => 0.0, :total_route_import => 0.0)
    end
    
    Route.where(:branch_id => 2).each do |route|
      total_due = 0
      route.orders.each do |order|
        order.update_attribute(:loaded_to_route, true)
        total_due = order.total_due + total_due
      end
      route.update_attributes(:total_route_due => total_due, :current_route_due => 0.0, :total_route_import => 0.0)
    end
    
  end
  
  desc 'Drop, create, migrate then seed the database.'
  task :reset => :environment do
    p "Deleting db/schema.rb"
    system("rm -f db/schema.rb")
    p "Dropping DB"
    Rake::Task['db:drop'].invoke
    p "Creating DB"
    Rake::Task['db:create'].invoke
    p "Migrating DB"
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:migrate:reset'].invoke # It is assumed that this command performs the same as the commented code.
    p "Seeding DB"
    Rake::Task['db:seed'].invoke
  end
  
end