# frozen_string_literal: true

# improt data of tradelog
class ImportTradelog
  def self.import(date)
    # 导入30天的数据
    30.times do |offset|
      datas = init_data(date + (60 * 60 * 24) * offset)
      puts datas

      # 批量插入， 每1000条插入一次，效率很高，用时7.99秒
      # 5.54s user 0.54s system 77% cpu 7.799 total
      # 5.38s user 0.48s system 78% cpu 7.452 total
      Tradelog.bulk_insert set_size: 1000, values: datas
    end
  end

  # 每天导入1000条数据
  def self.init_data(day)
    datas = []
    1000.times do |index|
      # 插入效率很低，30 * 1000 条记录用时 1分钟
      # date = {tradeid: tradeid, operator: operator, t_modified: t_modified}
      # Tradelog.create(date)
      datas << {
        tradeid: "#{day.strftime('%Y%m%d')}#{format('%04d', (index + 1))}",
        operator: rand(50),
        t_modified: (day + 60 * index)
      }
    end

    datas
  end
end
