require "open-uri"
class GamesController < ApplicationController
  def new
    array_of_letters = Array('A'..'Z')
    @letters = Array.new(9) { array_of_letters.sample }.join(' ')
  end

  def score
    @word = (params[:attemp] || "").upcase # word es un string que no sabemos si viene en mayúsculas o minúsculas.
    @letters = params[:letters]
    @included = included_in_grid?(@word, @letters)
    @english_word = english_word?(@word)
  end

  def included_in_grid?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
    # toma la palabra y la parte por letras separadas por coma en un array (chars).
    # .all? itera letra por letra, y le pasa la condición.
    # cuenta cuantas letras hay en word y compara que sea igual o menor
    # que la cuenta de cuantas letras hay en grid.

  end

  def english_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    response = URI.open(url).read
    parsed_response = JSON.parse(response)
    parsed_response["found"]
  end
end
