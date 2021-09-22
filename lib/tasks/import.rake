require 'csv'

namespace :import do
  task :csv, [:klass, :filename] => :environment do |t, args|
    return unless args[:klass]
    return unless args[:filename]

    klass = args[:klass].camelize.constantize
    CSV.foreach(args[:filename], :headers => true) do |row|
      klass.create!(row.to_hash)
    end
  end
end
