require 'rake'
require 'active_record'
require 'yaml/store'
require 'date'
require 'active_support/core_ext'


require 'bundler/setup'
Bundler.require

require_all 'app/models'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/library.db'
)
