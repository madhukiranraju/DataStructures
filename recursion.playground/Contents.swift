import UIKit

/**
 Recursive function is process of calling itself.
 
 It contains
 1. Base case
 2. Recursive case
 
 Note : without the base case the function will loop for infinite time
 
 The Time complexity of the factorial function is O(2^n)
 The space comlexity is O(n)
 
 **/


func fact(_ num : Int)->Int{
   
    //Base case
    if num == 0 {
        return 1
    }
    
    return num * fact(num-1)
}

print(fact(5))


// Some other Recusive functions is fibanacci series

func fib(_ num : Int)->Int{
    
    //Base case
    if num == 0 || num == 1{
        return 1
    }
    
    return num + fib(num-1)
    
}

print(fib(5))

//power(of: 2 , times:3) ----> 8

/*
    Stack
    ---------
    2 * power(2,2) = 2 * 4 = 8
    2 * power(2,1) = 2 * 2
    2 * power(2,0) = 2 * 1
 
 */
func power(of number: Int, with times: Int)->Int{
    if times == 0{
        return 1
    }else{
        return number * power(of: number, with: times-1)
    }
}


print(power(of: 2, with: 3))
