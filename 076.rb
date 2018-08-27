require 'pp'

def possibilities(decomposition)
  if decomposition.size > 2
    combinations = decomposition.combination(2).to_a.uniq
    combinations.each do |c|
      composition = decomposition.clone
      composition.delete_at(composition.index(c[0]))
      composition.delete_at(composition.index(c[1]))
      composition << (c[0] + c[1])
      composition_string = composition.sort.join
      unless $found[composition_string]
        $found[composition_string] = true
        possibilities(composition)
      end
    end
  end
end

answers = []
3.upto(15) do |target|
  decomposition = Array.new(target) { 1 }
  $found = {decomposition.join => true}

  start_time = Time.now
  possibilities(decomposition)
  answers << $found.size
end
pp answers.join(',')
