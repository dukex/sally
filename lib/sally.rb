module Sally
  class Run
    attr_accessor :target

    def initialize(file)

      File.open(file).each_line do |line|
        @target = Parser.target line
      end
    end

  end
end
