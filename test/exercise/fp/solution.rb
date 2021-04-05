module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        subarr = []
        array.map { |value|
          if value['country'].nil?
            0
          else
            str = value['country']
            if str.include?','
              subarr.append(value)
            else
              0
            end
          end
        }
        subarr.map! { |value| value['rating_kinopoisk'].nil? ? 0 : value }
        subarr.delete(0)
        subarr.map! { |value|
          str = value['rating_kinopoisk']
          if (str.length == 1) && (str == '0')
            0
          else
            value
          end
        }
        subarr.delete(0)
        summ =  subarr.reduce(0) { |sum, n|
          str = n['rating_kinopoisk']
          sum += str.to_f
        }
        summ / subarr.length
      end

      def chars_count(films, threshold)
        subarr = []
        films.map { |value|
          if value['rating_kinopoisk'].nil?
            0
          end
          rating = value['rating_kinopoisk'].to_f
          if rating >= threshold
            subarr.append(value)
          end
        }
        subarr.reduce(0) { |sum, n|
          str = n['name']
          sum += str.scan('и').size
        }
      end
    end
  end
end
