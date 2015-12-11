require 'test/unit'

def same_elements?(array_one, array_two)
	puts "array_one:#{array_one}" if $DEBUG
	puts "array_two:#{array_two}" if $DEBUG
  ((array_one - array_two) + (array_two - array_one)).empty?
end

def findDuplicates(arrayBig)
	arrayToReturn = []
	#create bit vector
	bitVectorMap = Array.new(4000, 0)
	#read each in input array
	arrayBig.each do | element |
		which_byte = element / 8
		which_bit = (1 << (element % 8 - 1))
		puts "#{element}:#{which_byte}/#{which_bit.to_s(2)}" if $DEBUG
		if bitVectorMap[which_byte] & which_bit != 0 && !arrayToReturn.include?(element)
			arrayToReturn << element
		else
			bitVectorMap[which_byte] |= which_bit
		end 
	end
	# for each read mark in bit vector
	# if trying to mark a 1, add to returnArray
	return arrayToReturn
end

class TestDuplicateWriter < Test::Unit::TestCase
	def test_empty
		arrayBig = []
		expectedDuplicates = []
		foundDuplicates = findDuplicates(arrayBig)
		assert_true(same_elements?(expectedDuplicates, foundDuplicates))
	end

	def test_single_1
		arrayBig = [1]
		expectedDuplicates = []
		foundDuplicates = findDuplicates(arrayBig)
		assert_true(same_elements?(expectedDuplicates, foundDuplicates))
	end

	def test_single_2
		arrayBig = [2]
		expectedDuplicates = []
		foundDuplicates = findDuplicates(arrayBig)
		assert_true(same_elements?(expectedDuplicates, foundDuplicates))
	end
	def test_single_3
		arrayBig = [3]
		expectedDuplicates = []
		foundDuplicates = findDuplicates(arrayBig)
		assert_true(same_elements?(expectedDuplicates, foundDuplicates))
	end
	def test_simple_repeat
		arrayBig = [1,1]
		expectedDuplicates = [1]
		foundDuplicates = findDuplicates(arrayBig)
		assert_true(same_elements?(expectedDuplicates, foundDuplicates))
	end

	def test_simple_no_repeat
		arrayBig = [1,2]
		expectedDuplicates = []
		foundDuplicates = findDuplicates(arrayBig)
		assert_true(same_elements?(expectedDuplicates, foundDuplicates))
	end

	def test_simple_repeat1
		arrayBig = [1,2,2]
		expectedDuplicates = [2]
		foundDuplicates = findDuplicates(arrayBig)
		assert_true(same_elements?(expectedDuplicates, foundDuplicates))
	end

	def test_simple_repeat2
		arrayBig = [1,1,2]
		expectedDuplicates = [1]
		foundDuplicates = findDuplicates(arrayBig)
		assert_true(same_elements?(expectedDuplicates, foundDuplicates))
	end

	def test_simple_in_not_order
		arrayBig = [1,2,1]
		expectedDuplicates = [1]
		foundDuplicates = findDuplicates(arrayBig)
		assert_true(same_elements?(expectedDuplicates, foundDuplicates))
	end

	def test_long_no_repeat
		arrayBig = [1,2,3,4,5]
		expectedDuplicates = []
		foundDuplicates = findDuplicates(arrayBig)
		assert_true(same_elements?(expectedDuplicates, foundDuplicates))
	end

	def test_long_repeat_1
		arrayBig = [1,2,3,2,4,6,2,2,3]
		expectedDuplicates = [2,3]
		foundDuplicates = findDuplicates(arrayBig)
		assert_true(same_elements?(expectedDuplicates, foundDuplicates))
	end

	def test_long_repeat_2
		arrayBig = [1,2,3,2,4,6]
		expectedDuplicates = [2]
		foundDuplicates = findDuplicates(arrayBig)
		assert_true(same_elements?(expectedDuplicates, foundDuplicates))
	end
end
