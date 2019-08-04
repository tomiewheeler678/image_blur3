class Image
  attr_accessor :image

def initialize(blurb)
  @blurb = blurb
end

def output_image
  @blurb.each do |row|
    puts row.join
  end
end

def blur (distance=1)
    distance.times do
      blur!
    end
end

def blur!
    ones = []
    @blurb.each_with_index do |rows, row|
       rows.each_with_index do |num, col|
          ones << [row, col] if num == 1
    end
  end
    

  @blurb.each_with_index do |r, r_number|
    r.each_with_index do |c, c_number|
      ones.each do |row, col|
          if r_number == row && c_number == col
          @blurb[r_number -1][c_number]= 1 unless r_number == 1
          @blurb[r_number+1][c_number]= 1 unless r_number >= @blurb.length - 1
          @blurb[r_number][c_number-1]= 1 unless c_number == 1
          @blurb[r_number][c_number+1]= 1 unless c_number >= @blurb.length - 1
          end
        end
      end
    end
  end
end

image = Image.new([
  [1, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0],
  [0, 0, 1, 1, 0, 0]
])

image.output_image 
image.blur(2)
puts
image.output_image



