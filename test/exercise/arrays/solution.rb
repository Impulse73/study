module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]
        array.each { |num| num > max ? (max = num) : (0) }
        result = array.map { |num| num < 0 ? num : max }
      end

      def search(array, query)
        if array.is_a?(Array)
          len = array.length
          binary_search(array, 0, len - 1, query)
        else
          if array == query
            0
          else
            -1
          end
        end
      end

      # binary search if array = true
      def binary_search(arr, left, right, val)
        if right >= left
          mid = left + (right - left) / 2
          if arr[mid] == val
            return mid
          elsif arr[mid] > val
            return binary_search(arr, left, mid - 1, val)
          else
            return binary_search(arr, mid + 1, right, val)
          end
        end
        return -1
      end
    end
  end
end
