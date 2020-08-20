# frozen_string_literal: true

require File.expand_path('init', __dir__)

# Import Data of Mysql45 needed
class ImportData
  def self.tradelog(date)
    ImportTradelog.import(Time.parse(date))
  end
end

ImportData.tradelog('2019-07-01 00:01:01')
