var actual_pi = 3.1415926535897932384626433832795028841971693993751058209749445923078164062;

function nilakantha(m) {
	var pi = one_fourth_pi = n = 0;

	var time = performance.now();

	while(Math.abs(pi - actual_pi) > Math.pow(10,-m)) {
		for (var i = 0; i < n + 1; i++) {
			one_fourth_pi += Math.pow(-1,i) / (Math.pow(2*i+3,3) - (2*i+3));
		}
		one_fourth_pi += 3/4;
		pi = one_fourth_pi * 4;
		one_fourth_pi = 0;
		++n;
	}

	return performance.now() - time; //time in ms.
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
	alert(`Average time to compute to a precision of ${m} with ${n} trials: ${average.toFixed(2)}ms.`);
}

function main() {
	var m = Number(prompt("Please enter a precision to calculate pi at: "));
	var n = Number(prompt("Please enter the number of iterations to profile at: "));
	profile(n,m);
}
main();
