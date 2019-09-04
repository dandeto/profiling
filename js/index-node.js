var actual_pi = 3.1415926535897932384626433832795028841971693993751058209749445923078164062;

function nilakantha(m) {
	var pi = one_fourth_pi = n = 0;

	const NS_PER_SEC = 1e9;
	var time = process.hrtime();

	while(Math.abs(pi - actual_pi) > Math.pow(10,-m)) {
		for (var i = 0; i < n + 1; i++) {
			one_fourth_pi += Math.pow(-1,i) / (Math.pow(2*i+3,3) - (2*i+3));
		}
		one_fourth_pi += 3/4;
		pi = one_fourth_pi * 4;
		one_fourth_pi = 0;
		++n;
	}

	var diff = process.hrtime(time);
	return (diff[0] * NS_PER_SEC + diff[1]) / 10000000; //time in ms
}

function profile(n,m) { //n: # trials; m: precision to pass to nilakantha function.
	var arr = [];

	for (var i = 0; i < n; i++) {
		arr.push(nilakantha(m));
	}
	var sum = 0;
	for (var i = 0; i < arr.length; i++) {
		sum += arr[i];
	}
	var average = sum / n;
	console.log(`Average time to compute to a precision of ${m} with ${n} trials: ${average.toFixed(2)}ms.`);
	process.exit();
}

function main() {
	var standard_input = process.stdin;
	standard_input.setEncoding('utf-8');

	console.log("Please enter a precision to calculate pi at: ");
	var n = m = i = 0;

	standard_input.on('data', data => { //capture input
		if (i == 0) {
			m = Number(data);
			i++;
			console.log("Please enter the number of iterations to profile at: ");
		}
		else if (i == 1) {
			n = Number(data);
			profile(n,m);
			i++;
		}
	});
}
main();
