class PolyTreeNode
    attr_reader :children, :value, :parent
    attr_writer :parent
    
    def initialize(value)
        @children = []
        @value = value
        @parent = nil
    end

    def parent=(new_parent) 
        #if the new_parent == current, just return 
        return self if new_parent == parent
        

        if self.parent != nil
            self.parent.children.delete(self)
        end

        @parent = new_parent

        #change the current node to root 
        new_parent.children << self if !new_parent.nil?
          
        #returning self so that user cannot change parent
        self
    end
    
    def add_child(child_node)
        if !child_node.children.include?(self) || @parent != child_node
            child_node.parent = self
        end
    end

    def remove_child(child_node)
        if self.children.include?(child_node)
            child_node.parent = nil
        else
            raise "error"
        end
    end
    
    def dfs(target)
        return self if target == self.value
        #return nil if 
        children.each do |child|
            search_result = child.dfs(target)
            return search_result unless search_result.nil?
        end

        return nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            cur_node = queue.shift
            return cur_node if cur_node.value == target
            queue += cur_node.children
        end
        nil
    end
end


