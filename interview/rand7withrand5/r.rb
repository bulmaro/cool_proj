def rand5()
	return rand(5) + 1
end

def rand7()
	x = 0
	begin
		x = rand5 + 5*rand5 - 6
	end while x > 20
	# now we have equal probability of 0 to 20

	return x / 3
end

h = [0,0,0,0,0,0,0]
(1..10000000).each do |i| 
	x = rand7
	h[x-1] += 1
end

(0...h.size).each { |f| puts "f[#{f+1}]:#{h[f]}" }
