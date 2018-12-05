class Puzzle < Prawn::Document

  def initialize(puzzle_name, words)
    super()

    #where my code will start

    font "Courier", :size => 24
    text puzzle_name, :align => :center
    font "Courier", :size => 10

    word_list = words.split("\n")

    word_list.each_with_index do |word, index |
      word_list[index] = word.chomp
    end

    word_list.each do |word|
      text word
    end

    generate_key
    generate_puzzle
    print_key
    start_new_page #prawn method
    print_puzzle

  end

  def generate_key

  end

end