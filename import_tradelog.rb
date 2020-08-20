# frozen_string_literal: true

require File.expand_path('tradelog', __dir__)

class ImportTradelog
  class << self
    def import(date)
      30.times do |offset|
        day = date + (60 * 60 * 24) * offset
        datas = []
        puts day

        1000.times do |index|
          operator = rand(50)
          num = format('%04d', (index + 1))
          tradeid = "#{day.strftime('%Y%m%d')}#{num}"
          t_modified = day + 60 * index

          # 插入效率很低，30 * 1000 条记录用时 1分钟
          # Tradelog.create(tradeid: tradeid, operator: operator, t_modified: t_modified)
          datas << { tradeid: tradeid, operator: operator, t_modified: t_modified }
          p [tradeid, operator, t_modified]
        end

        # 批量插入， 每1000条插入一次，效率很高，用时7.99秒
        # 5.54s user 0.54s system 77% cpu 7.799 total
        Tradelog.bulk_insert set_size: 1000, values: datas
      end
    end
  end
end

date = Time.parse('2020-06-01 00:01:01')
ImportTradelog.import(date)
