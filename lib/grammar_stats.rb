class GrammarStats
    def initialize
        @succesful_checks = 0
    end

    def check(text)
        result = text[0].match?(/[A-Z]/) && text[-1].match?(/[.?!]/)
        @succesful_checks += 1 if result == true
        result
    end

    def percentage_good
        return @succesful_checks
    end
end