module Exercise
  module Arrays
    class << self
      def replace(array)
        max = find_max(array)
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

      # search maximum element in array
      def find_max(array)
        if array.length == 1
          array[0]
        else
           mid = array.length / 2
           leftmax = find_max(array[0, mid])
           rightmax = find_max(array[mid, array.length])
           if leftmax > rightmax
             leftmax
           else
             rightmax
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
