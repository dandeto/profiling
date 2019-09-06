#initialize wolfram-alpha's pi approximation for comparision
$actual_pi = 3.1415926535897932384626433832795028841971693993751058209749445923078164062

def nilakantha(m)
	pi = 0.0
	one_fourth_pi = 0.0
	n = 0 #initialize to 0

	t = Process.clock_gettime(Process::CLOCK_MONOTONIC);

	while((pi+3 - $actual_pi).abs > 10**-m) #stops loop if the difference between the calculated pi and wolfram-alpha pi is <= 10**-m
		for i in 0..n+1 #begin series from 0 to the next value of n
			one_fourth_pi += (-1.0)**i / (((2.0*i+3.0)**3.0) - (2.0*i+3.0)); #one iteration of the series performed n times
		end
		one_fourth_pi += 3/4; #add 3/4 according to the equation
		pi = one_fourth_pi * 4; #multiply by 4 to get the value for pi
		one_fourth_pi = 0; #reset
		n += 1; #increment n
	end

	return Process.clock_gettime(Process::CLOCK_MONOTONIC) - t;
end

def profile(n,m)
	arr = [];

	for i in 0..n
		arr.push(nilakantha(m));
	end

	sum = 0;
	for i in 0..n
		sum += arr[i];
	end
	average = sum / n * 1000; # *1000 to get from s to ms.

	str = "Average time to compute to a precision of #{m} with #{n} trials: #{'%.2f' % average}ms."

	puts "\n" + str
	output = File.open("out.part", "a")
	output << str + "\n"
	output.close
end

def main()
	n = 0
	m = 0
	print "Please enter a precision to calculate pi at: "
	m = gets.to_i
	print "\nPlease enter the number of iterations to profile at: "
	n = gets.to_i
	profile(n,m)
end
main()
