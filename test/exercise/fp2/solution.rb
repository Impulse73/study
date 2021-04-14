module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        array = self
        return array if array.empty?

        head, *tail = array

        func.call(head)

        MyArray.new(tail).my_each(&func)

        array
      end

      # Написать свою функцию my_map
      def my_map
        func = ->(sum, val) { sum << yield(val) }

        empty_arr = MyArray.new

        my_reduce(empty_arr, &func)
      end

      # Написать свою функцию my_compact
      def my_compact
        func = ->(sum, val) { val.nil? ? sum : sum << val }

        empty_arr = MyArray.new

        my_reduce(empty_arr, &func)
      end

      # Написать свою функцию my_reduce
      def my_reduce(sum = nil)
        arr = self

        arr.my_each do |val|
          sum = if sum.nil?
                  arr.first
                else
                  yield(sum, val)
                end
        end
        sum
      end
    end
  end
end
