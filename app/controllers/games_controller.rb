class GamesController < ApplicationController
  def new
    array_of_letters = Array('A'..'Z')
    @letters = Array.new(9) { array_of_letters.sample }.join(' ')
    @word = params[:attemp]
  end

  def score
    @word = params[:attemp] # word es un string que no sabemos si viene en mayúsculas o minúsculas.
    # queremos saber si word está en la grid (método privado "word" in grid)
    # si no lo esta (false) devolvemos mensaje que "la palabra no esta en la grid"
    # si lo esta: (true)
    # queremos saber que la word sea valida en ingles. (metodo privado valid?)
    # si lo está (true damos puntaje)
    # si no lo está devolvemos mensaje "que no es una palabra valida en ingles"
  end

  def word_in_grid?

  end
end
