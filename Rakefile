# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'
require 'app/models/region'
require 'pony'

Pbm::Application.load_tasks

desc "Email admins about empty locations"
task :report_empty_locations => :environment do
  #Region.all.each do |r|
  r = Region.find(1)
    machineless_locations = r.machineless_locations
    if machineless_locations.size
      Pony.mail(
        :to => r.users.collect {|u| u.email},
        :from => 'admin@pinballmap.com',
        :subject => "PBM - List of empty locations",
        :body => ["The following locations don't have machines at them anymore. You may want to consider removing them from the map. This check will happen again, automatically, in one week", machineless_locations.each.map {|ml| ml.name}.join {"\n"}].join("\n")
      )
    end
#  end
end
