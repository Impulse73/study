module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        selected = array.select { |film|
          film['country'].to_s.split(',').length > 1 && film['rating_kinopoisk'].to_f.positive?
        }
        subarray = selected.map { |film| film['rating_kinopoisk'].to_f }
        summary = subarray.reduce(:+)
        summary / subarray.length
      end

      def chars_count(films, threshold)
        selected = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        films_arr = selected.map { |value| value['name'].to_s }
        films_arr.reduce(0) { |sum, n| sum + n.count('и') }
      end
    end
  end
end
