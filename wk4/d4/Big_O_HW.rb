
# time complexity = n^2 
def sluggish_octopus(arr)
    longest_str = ''

    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            if arr[i].length < arr[j].length && longest_str.length < arr[j].length
                longest_str = arr[j]
            elsif longest_str.length < arr[i].length 
                longest_str = arr[i]
            end
        end
    end

    longest_str
end

def quick_sort(arr)
    return arr if arr.length <= 1
    pivot = arr.first

    left = []
    right = []

    (1...arr.length).each do |i|
        if arr[i].length < pivot.length
            left << arr[i]
        else
            right << arr[i]
        end
    end

    left_sort = quick_sort(left)
    right_sort = quick_sort(right)

    left_sort + [pivot] + right_sort
end

#using quicksort n log n
def dominant_octopus(arr)
    sorted_arr = quick_sort(arr)
    sorted_arr[-1]
end

# using hash 
def clever_octopus(arr)
    hash = Hash.new
    #debugger
    arr.each_with_index do |el, idx|
        hash[el] = arr[idx].length
    end
    fish = ""

    hash.each_pair do |key,value|
        if value > fish.length
            fish = key
        end      
    end
    fish
end


def slow_dance(move, arr)
    (0...arr.length).each do |i|
        if arr[i] == move
            return i
        end
    end
end

def constant_dance(move, arr)
    hash = Hash.new
    arr.each_with_index do |val, idx|
        hash[val] = idx
    end

    return hash[move]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
#fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
#p sluggish_octopus(fish_arr)
#p dominant_octopus(fish_arr)
#p fish_arr.quick_sort

#p clever_octopus(fish_arr)
p slow_dance("up", tiles_array)