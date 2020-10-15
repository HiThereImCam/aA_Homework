require "byebug"

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while self.game_over == false
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.round_success_message
    self.sequence_length += 1
    self.require_sequence
  end

  def show_sequence
    add_random_color
  end

  def sleep_and_clear
    sleep(2) #sleep for 3 seconds
    system "clear"
  end

  def require_sequence
    count = 0
    while self.game_over == false
      self.seq.each{|color| p "color sequence: #{color}" }
      self.sleep_and_clear

      print "Enter the sequence with every color seperated by a space: "
      input = gets.chomp.to_s
      input_colors = input.split(' ')

      (0...input_colors.length).each do |idx|
        if input_colors[idx] != self.seq[idx]
          self.game_over = true
        end
      end
      
      take_turn
    end

  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    p "ROUND OVER"
  end

  def game_over_message
    p "`IT'S OVER LADIES AND GENTLEMEN. LET'S GO HOME` - Kenny 'The Jet' Smith"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq.clear
  end
end

simon = Simon.new
simon.play