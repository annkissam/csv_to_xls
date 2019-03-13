require "csv_to_xls/version"
require 'spreadsheet'
require 'csv'

module CsvToXls
  class Error < StandardError; end

  def self.call(input_path, output_path)
    book = Spreadsheet::Workbook.new

    sheet_1 = book.create_worksheet

    header_format = Spreadsheet::Format.new(
      :weight => :bold,
      :horizontal_align => :left,
      :bottom => :thin,
      :locked => true
    )

    sheet_1.row(0).default_format = header_format

    #escaped quotes caused CSV.open(input_path, 'r') { |csv| csv.each_with_index { |row, i| ... }} to crash. Need to sub them out
    csv_text = File.read(input_path).gsub(/\\"/,'""')
    i = 0
    CSV.parse(csv_text) do |row|
      # set the width of each column to the length of its header
      if i == 0
        row.each_with_index do |header, k|
          sheet_1.column(k).width = header.length
        end
      end
      sheet_1.row(i).replace(row)
      i += 1
    end

    book.write output_path
  end
end
