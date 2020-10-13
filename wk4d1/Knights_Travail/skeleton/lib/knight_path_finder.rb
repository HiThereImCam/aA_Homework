require_relative "00_tree_node"

class KnightPathFinder

    attr_reader :start_pos, :consider_pos
    attr_accessor :root_node
    
    def self.valid_moves(pos)
        possible_moves = []
        current_x, current_y = pos

        all_move = [[-1, -2], [-1,2], [1,2], [1,-2], [2,-1], [2,1], [-2,-1], [-2,1]]

        all_move.each do |move|
            new_pos = [current_x + move.first, current_y + move.last]

            if new_pos.all? {|position| position >= 0 && position < 8}
                possible_moves << new_pos
            end
        end

        return possible_moves
    end

    def initialize(start_pos)
        #@board = Array.new(8){Array.new(8)}
        @start_pos = start_pos
        @consider_pos = [start_pos]

        build_move_tree
    end

    #find the right and shortest path
    def find_path(end_pos)
        end_node = self.root_node.dfs(end_pos)
        final_arr = trace_back(end_node).map{ |el| el.value }
        final_arr.reverse
    end
    
    #filter out the step we alrady took

       #all the possible path in the tree
    def build_move_tree
       self.root_node = PolyTreeNode.new(start_pos) #instance variable
     
        queue = [root_node]
        until queue.empty?
            #pop,queue
            cur_node = queue.shift
            move_list = new_move_positions(cur_node.value)
            move_list.each do |pos|
                child_node = PolyTreeNode.new(pos)
                cur_node.add_child(child_node)
                queue << child_node
            end
        end
    end

    def new_move_positions(pos)

        result = KnightPathFinder.valid_moves(pos)
        new_move = result.reject{|ele|consider_pos.include?(ele)}
        consider_pos.concat(new_move)
        new_move
    end
    

    def trace_back(end_node)
        trace_arr = []
        current_node = end_node

        until  current_node.nil?
            trace_arr << current_node
            current_node = current_node.parent
        end
        
        return trace_arr 
    end
end

# knight = KnightPathFinder.new([3,5])
# knight.new_move_positions([4,6])
# kight.find_path([end_pos])
kpf = KnightPathFinder.new([0, 0])
kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
p kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]
