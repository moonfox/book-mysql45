require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'yaml'

config = YAML::load_file File.expand_path("../database.yml", __FILE__)

ActiveRecord::Base.establish_connection(config["development"])
