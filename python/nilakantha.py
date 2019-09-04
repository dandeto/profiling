import time;

#initialize wolfram-alpha's pi approximation for comparision
actual_pi = 3.1415926535897932384626433832795028841971693993751058209749445923078164062;

def main(m):
    pi = one_fourth_pi = n = 0; #initialize to 0

    init_time = time.process_time();

    while(abs(pi - actual_pi) > 10**-m): #stops loop if the difference between the calculated pi and wolfram-alpha pi is <= 10**-m
        for i in range(0, n+1): #begin series from 0 to the next value of n
            one_fourth_pi += (-1)**i / (((2*i+3)**3) - (2*i+3)); #one iteration of the series performed n times
        one_fourth_pi += 3/4; #add 3/4 according to the equation
        pi = one_fourth_pi * 4; #multiply by 4 to get the value for pi
        one_fourth_pi = 0; #reset
        n += 1; #increment n
    return time.process_time() - init_time;

def profile(n,m):
    arr = [];

    for i in range(0,n):
        arr.append(main(m));

    _sum = 0;
    for i in range(0,n):
        _sum += arr[i];
    average = _sum / n * 100; # *100 to get from s to ms.

    print("Average time to compute to a precision of " + str(m) + " with " + str(n) + " trials: " + str(average) + "ms.");

