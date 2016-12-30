def insertion_sort(array)
	n = array.size
	i = 1
	loop do
		j = i
		element_to_insert = array[i]
		while (j > 0 && array[j-1] > element_to_insert)
			if (element_to_insert < array[j-1])
				array[j] = array[j-1]
			end
			j -= 1
		end
		array[j] = element_to_insert
		i += 1
		break if i == n
	end
	array
end

def bubble_sort(array)
	n = array.size
	i = 0
	loop do
		break if i == n - 1
		j = 0
		loop do
			break if j == n - 1
			if array[j] > array[j+1]
				temp = array[j+1]
				array[j+1] = array[j]
				array[j] = temp
			end
			j += 1
		end
		i += 1
	end
	array
end

def merge(array1, array2)
	i = 0
	j = 0
	k = 0
	merged_arr = []
	while(i < array1.size || j < array2.size)
		if(array1[i].nil?)
			merged_arr[k] = array2[j]
			k += 1
			j += 1
		elsif (array2[j].nil?)
			merged_arr[k] = array1[i]
			k += 1
			i += 1
		else
			if(array1[i] <= array2[j])
				merged_arr[k] = array1[i]
				k += 1
				i += 1
			else
				merged_arr[k] = array2[j]
				k += 1
				j += 1
			end
		end
	end
	merged_arr
end

def merge_sort(array)
	if(array.size == 1)
		return array
	else
		n = array.size
		half = n/2
		left_half = array[0..half-1]
		right_half = array[half..n-1]
		sorted_left = merge_sort(left_half)
		sorted_right = merge_sort(right_half)
		merged_arr = merge(sorted_left, sorted_right)
		merged_arr
	end
end

#p bubble_sort( [1,3,7,2,5] )

#p merge_sort([1,3,7,8,2,5])

very_big_array = (1..12321112).to_a.shuffle
puts "shuffle done"
time1 = Time.now
merge_sort(very_big_array)
time2 = Time.now
puts "Merge     sort took #{time2 - time1} seconds"
#insertion_sort(very_big_array)
#time3 = Time.now
#puts "Insertion sort took #{time3 - time2} seconds"
#bubble_sort(very_big_array)
#time4 = Time.now
#puts "Bubble    sort took #{time4 - time3} seconds"