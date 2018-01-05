module Import::Xlsx
  class Resource
    def initialize(file)
      @file = file
    end

    def extract
      xlsx  = Roo::Spreadsheet.open(file)
      sheet = xlsx.sheet(0) # What an assumption ^_^
      attrs = sheet.row(1)
      data = sheet.parse(header_search: attrs).map do |d|
        d.map {|k, v| [k.parameterize.underscore.to_sym , v] }.to_h.except :id
      end
    end

    private
    attr_reader :file
  end
end
