require 'backup'

namespace :backup do
  desc "Create a backup of the PassTy database"
  task create: :environment do
    puts "Dumping database ... "
    Backup::Database.new.dump
    puts "done"
  end

  task restore: :environment do
    puts "Restoring database ... "
    Backup::Database.new.restore
    puts "done"
  end
end
