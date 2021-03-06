require 'rails/generators'
require 'rails/generators/active_record'

module ExchangeRate
  class InstallGenerator < ::Rails::Generators::Base
    include ::Rails::Generators::Migration

    source_root File.expand_path("../templates", __FILE__)

    desc 'Generates (but does not run) a migration to add a exchange_rates table.'

    def create_migration_file
      migration_template 'create_rates.rb', 'db/migrate/create_rates.rb'
    end

    def self.next_migration_number(dirname)
      ::ActiveRecord::Generators::Base.next_migration_number(dirname)
    end
  end
end
