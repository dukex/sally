module Sally
  class Parser
    TARGET = /My target '(.*)'/

    def self.target(string)
      TARGET.match(string).captures[0]
    end
  end
end
