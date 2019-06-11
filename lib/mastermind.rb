require_relative "code"

class Mastermind

    def initialize(code_length)
        @secret_code = Code.random(code_length)
    end

    def print_matches(chars)
         print "Exact Matches = "
         puts @secret_code.num_exact_matches(chars)
         print "Near Marches = "
         p @secret_code.num_near_matches(chars)
    end

    def ask_user_for_guess()
        puts "Enter a code"
        guess = Code.from_string(gets.chomp)
        self.print_matches(guess)
        @secret_code == guess
    end 
end
