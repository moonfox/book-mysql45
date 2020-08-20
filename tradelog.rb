require File.expand_path('../conn_db', __FILE__)

class Tradelog < ActiveRecord::Base
  self.table_name = "tradelog"
end
