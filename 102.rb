require 'pp'

triangles = Array.new

rows = IO.readlines('triangles_102.txt')
rows.each do |row|
  triangles << row.split(',').map(&:to_i)
end

def area_of_triangle(x1, y1, x2, y2, x3, y3)
  (((x1 * (y2 - y3)) + (x2 * (y3 - y1)) + (x3 * (y1 - y2))) / 2.0).abs
end

valid_triangles = 0

triangles.each do |triangle|
  x1 = triangle[0]
  y1 = triangle[1]
  x2 = triangle[2]
  y2 = triangle[3]
  x3 = triangle[4]
  y3 = triangle[5]

  total_area = area_of_triangle(x1, y1, x2, y2, x3, y3)
  area_1 = area_of_triangle(0, 0, x2, y2, x3, y3)
  area_2 = area_of_triangle(x1, y1, 0, 0, x3, y3)
  area_3 = area_of_triangle(x1, y1, x2, y2, 0, 0)

  valid_triangles += 1 if total_area == area_1 + area_2 + area_3
end

pp valid_triangles
