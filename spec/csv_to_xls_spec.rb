require 'pathname'

RSpec.describe CsvToXls do
  it "has a version number" do
    expect(CsvToXls::VERSION).not_to be nil
  end

  before do
    `rake install`
  end

  module Shell
    ERROR_MESSAGE_FORMAT = <<ERRORFORMAT
Command failed: `%s`
output: %s
exit: %d
ERRORFORMAT

    def self.run(command, allow_failures = false)
      output = `#{command} 2>&1`
      status = $CHILD_STATUS
      unless status.success? || allow_failures
        message = format ERROR_MESSAGE_FORMAT, command, output.chomp, status.exitstatus
        raise message
      end

      [output, status.exitstatus]
    end
  end

  context "call" do
    let(:root)            { Pathname.new(__dir__).join('..').realpath }
    let(:tmp)             { root.join('tmp') }
    let(:csv_headers)     { ["Header 1", "Header 2", "Header 3", "Header 4"] }
    let(:csv_row)         { ["data1", "data2", "data3", "data4"] }
    let(:test_csv_path)   { tmp.join('example.csv') }
    let(:test_ouput_path) { tmp.join('example.xls') }
    let!(:csv) do
      FileUtils.rmtree(tmp) if tmp.exist?
      FileUtils.mkpath(tmp)

      CSV.open(test_csv_path, "wb") do |csv|
        csv << csv_headers
        csv << csv_row
      end
    end

    it "should correctly build and save an xls file" do
      output, exit_code = Shell.run("csv_to_xls #{test_csv_path} #{test_ouput_path}")

      expect(output).to eq("")
      expect(exit_code).to eq(0)

      book = Spreadsheet.open test_ouput_path

      sheet = book.worksheet 0
      headers = sheet.row 0
      row = sheet.row 1

      expect(headers).to eq csv_headers
      expect(row).to eq csv_row
    end
  end
end
