require 'pp'

pp (1..10).to_a.permutation.to_a.select { |r|
	total = r[0]+r[1]+r[4]
	total == r[2]+r[4]+r[7] && total == r[5]+r[3]+r[1] && total == r[9]+r[6]+r[3] && total == r[8]+r[7]+r[6]
}.map{ |r|
	ring_string = ''
	external_nodes = [r[0],r[2],r[8],r[9],r[5]]
	start_position = external_nodes.find_index(external_nodes.min)
	nodes_to_end = 5 - start_position
	sequence = external_nodes.slice(start_position, nodes_to_end) + external_nodes.slice(0,5-nodes_to_end)

	sequence.each do |i|
		node_position = r.find_index(i)
		if node_position == 0
			ring_string += "#{r[0]}#{r[1]}#{r[4]}"
		elsif node_position == 2
			ring_string += "#{r[2]}#{r[4]}#{r[7]}"
		elsif node_position == 8
			ring_string += "#{r[8]}#{r[7]}#{r[6]}"
		elsif node_position == 9
			ring_string += "#{r[9]}#{r[6]}#{r[3]}"
		elsif node_position == 5
			ring_string += "#{r[5]}#{r[3]}#{r[1]}"
		end
	end
	ring_string
}.reject { |r|
	r.length == 17
}.map(&:to_i).max

#   O
#   0\
#     \
#      O     O
#     /1\   /2
#    /   \ /
#   O     O
#  /3\   /4
# O   O-O-O
# 5   6\7 8
#       \
#        O
#        9