require 'minitest/autorun'

class SolverTest < Minitest::Test
        def test_valid_return
                triangle = [[1], [2, 3], [4, 5, 6]]
                assert Solver.solve(triangle) != nil
        end

	def test_base_case
		triangle = [[5],[1, 2]]
		assert Solver.solve(triangle) == 7
	end

	def test_sum_adjacent
		triangle = [[1], [10, 1], [1, 1, 20]]
		assert Solver.solve(triangle) == 22
	end

	def test_example
		triangle = [[6], [3, 5], [9, 7, 1], [4, 6, 8, 4]]
		assert Solver.solve(triangle) == 26
	end
end


class Solver
	def self.solve(triangle)
		if triangle.size == 2
			return triangle[0][0] + max(triangle[1][0], triangle[1][1])
		end	
		
		return triangle[0][0] + 
			max( self.solve( self.left(triangle) ), self.solve( self.right(triangle) ))
	end 

	private
	def self.left (triangle)
		return triangle.drop(1).map {|line| line.drop(1) }
	end

	def self.right (triangle)
		return triangle.drop(1).map {|line| line.take( line.size - 1 ) }
	end

	def self.max (a, b)
		return a >= b ? a : b
	end
end

