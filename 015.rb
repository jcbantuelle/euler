paths = Array.new
paths[2] = {:routes => 6, :edges => {1 => 1, 2 => 2, 3 => 6}}
paths[3] = {:routes => 20, :edges => {1 => 1, 2 => 3, 3 => 6, 4 => 20}}
4.upto(20) do |dimension|
  paths[dimension] = {}
  routes = 1
  paths[dimension][:edges] = {1 => 1}
  2.upto(dimension-1) do |edge|
    edge_routes = paths[dimension][:edges][edge-1] + paths[dimension-1][:edges][edge]
    paths[dimension][:edges][edge] = edge_routes
    routes += edge_routes
  end
  paths[dimension][:edges][dimension] = paths[dimension-1][:edges][dimension]
  routes += paths[dimension][:edges][dimension]
  paths[dimension][:edges][dimension+1] = routes*2
  paths[dimension][:routes] = routes*2
end

2.upto(20) do |i|
  puts "Routes #{i}: #{paths[i][:routes]}"
end