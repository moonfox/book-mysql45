# frozen_string_literal: true

require 'yaml'

config = YAML.load_file File.expand_path('../config/database.yml', __dir__)

ActiveRecord::Base.establish_connection(config['development'])
