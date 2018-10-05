require 'pp'

DIMENSIONS = 14

MATRIX = [
  [7, 53, 183, 439, 863, 497, 383, 563, 79, 973, 287, 63, 343, 169, 583],
  [627, 343, 773, 959, 943, 767, 473, 103, 699, 303, 957, 703, 583, 639, 913],
  [447, 283, 463, 29, 23, 487, 463, 993, 119, 883, 327, 493, 423, 159, 743],
  [217, 623, 3, 399, 853, 407, 103, 983, 89, 463, 290, 516, 212, 462, 350],
  [960, 376, 682, 962, 300, 780, 486, 502, 912, 800, 250, 346, 172, 812, 350],
  [870, 456, 192, 162, 593, 473, 915, 45, 989, 873, 823, 965, 425, 329, 803],
  [973, 965, 905, 919, 133, 673, 665, 235, 509, 613, 673, 815, 165, 992, 326],
  [322, 148, 972, 962, 286, 255, 941, 541, 265, 323, 925, 281, 601, 95, 973],
  [445, 721, 11, 525, 473, 65, 511, 164, 138, 672, 18, 428, 154, 448, 848],
  [414, 456, 310, 312, 798, 104, 566, 520, 302, 248, 694, 976, 430, 392, 198],
  [184, 829, 373, 181, 631, 101, 969, 613, 840, 740, 778, 458, 284, 760, 390],
  [821, 461, 843, 513, 17, 901, 711, 993, 293, 157, 274, 94, 192, 156, 574],
  [34, 124, 4, 878, 450, 476, 712, 914, 838, 669, 875, 299, 823, 329, 699],
  [815, 559, 813, 459, 522, 788, 168, 586, 966, 232, 308, 833, 251, 631, 107],
  [813, 883, 451, 509, 615, 77, 281, 613, 459, 205, 380, 274, 302, 35, 805]
]

# DIMENSIONS = 4

# MATRIX = [
#   [7, 53, 183, 439, 863],
#   [497, 383, 563, 79, 973],
#   [287, 63, 343, 169, 583],
#   [627, 343, 773, 959, 943],
#   [767, 473, 103, 699, 303]
# ]

def find_largest(matrix)
  largest = {
    number: 0,
    row: -1,
    col: -1
  }
  0.upto(DIMENSIONS) do |row|
    0.upto(DIMENSIONS) do |col|
      number = matrix[row][col]
      if number > largest[:number]
        largest = {
          number: number,
          row: row,
          col: col
        }
      end
    end
  end
  largest
end

def best_sum(matrix, best, step)
  return find_largest(matrix)[:number]+best if step == DIMENSIONS
  bests = []

  matrix_1 = clone_matrix(matrix)
  matrix_2 = clone_matrix(matrix)

  # Find Largest
  largest_1 = find_largest(matrix_1)
  sum_1 = largest_1[:number] + best
  bests << best_sum(wipe_matrix(matrix_1, largest_1[:row], largest_1[:col]), sum_1, step+1)

  # Find Second Largest
  matrix_2[largest_1[:row]][largest_1[:col]] = 0
  largest_2 = find_largest(matrix_2)
  sum_2 = largest_2[:number] + best
  bests << best_sum(wipe_matrix(matrix_2, largest_2[:row], largest_2[:col]), sum_2, step+1)

  return bests.max
end

def wipe_matrix(matrix, row, col)
  matrix[row] = [0]*(DIMENSIONS+1)
  0.upto(DIMENSIONS) do |i|
    matrix[i][col] = 0
  end
  matrix
end

def clone_matrix(matrix)
  Marshal.load(Marshal.dump(matrix))
end

pp best_sum(clone_matrix(MATRIX), 0, 0)
