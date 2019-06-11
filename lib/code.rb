class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(characters)

    #before and after watching video
    characters.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
    
    # characters.each do |char|
    #  return false if !POSSIBLE_PEGS.include?(char.upcase) 
    # end
    # true
  end

  def self.random(length)
    array = []
    length.times do |idx|
      array << POSSIBLE_PEGS.keys.sample
    end
    @pegs = Code.new(array)
  end

  def self.from_string(pegs)
    pegs_t_array = pegs.split("")
    return Code.new(pegs_t_array)
  end


  def initialize(char_pegs)
  
   if !Code.valid_pegs?(char_pegs)
    error "Not Valid Pegs"
   else
    #before and after watching video
    @pegs = char_pegs.map{ |chars| chars.upcase }
    #@pegs = char_pegs.join("").upcase.split("")
   end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0 

    #code academey solutiom, mine next, mine below
    # (0...guess.length).each do |i|
    #   count += 1 if guess[i] == self[i]

    guess.pegs.each.with_index do |char, idx|
     count += 1 if char == self.pegs[idx]
    end
    return count
   end


   def ==(guess)
    guess.pegs == self.pegs
   end


   def num_near_matches(guess)
      count = 0
      guess.pegs.each.with_index do |char, idx|
        if self.pegs.include?(char) && char != self.pegs[idx]
          count += 1
        end
      end
      return count
   end


end
