module Exercise
  module Arrays
    class << self
      def replace(array)
        max = find_max(array)
        result = array.map {|num| num < 0 ? num : max}
        return result
      end
      
      def search(_array, _query)
        if _array.is_a?(Array)
          len = _array.length
          return binary_search(_array,0, len - 1, _query)
        else
          if _array == _query
            return 0
          else
            return -1 
          end
        end
      end
      
      #search maximum element in array
      def find_max(array)
        if array.length == 1
           return array[0]
        else
           mid = array.length / 2
           leftmax = find_max(array[0,mid])
           rightmax = find_max(array[mid,array.length])
           if leftmax > rightmax
              return leftmax
           else
              return rightmax
           end  
        end
      end
      #binary search if array = true
      def binary_search arr,l,r,x
        if r >= l
          mid = l + (r - l) / 2
          if arr[mid] == x
            return mid
          elsif arr[mid] > x
            return binary_search(arr,l,mid - 1,x)
          else
            return binary_search(arr,mid + 1,r,x)
          end
        end
        return -1
      end
    end
  end
end
