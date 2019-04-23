import UIKit

/*
 Complexity :
    The time or space required to compute a particular algorithm.
 
 Types of Algorithm:
 1. Time Complexity. (Time reuired)
 2. Space Complexity. (Space required)
 
 
 Note :  complexities in Time and Space, Denoted by "O"(Big O) notation

 */


/*
 
 Constant Time complexity 0(1):
    Time required to execute a single operation.
 
 
 Example: function to get the first element in an n array element
 */
print(".......Constant Time complexity....")


func getFirstElement<T>(arr : [T]){
    if arr.count == 0{
        print("No element")
    }else{
        print(arr[0])
    }
}
getFirstElement(arr: [])
getFirstElement(arr: [1,2,3,4,5,6])
getFirstElement(arr: ["a","b","c","d","e"])

print("------------------------------------------")
/*
 
 Linear Time complexity 0(n):
 Time required to execute all element in an array.
 
 
 Example: function to print all elements in an n array element
 */

print(".......Linear Time complexity....")

func printAllElements<T>(arr : [T]){
    if arr.count == 0{
        print("No element")
    }else{
        for ele in arr{
            print(ele)
        }
    }
}
printAllElements(arr: [])
printAllElements(arr: [1,2,3,4,5,6])
printAllElements(arr: ["a","b","c","d","e","f","g"])

/*
 Quadratic Time complexity 0(n power 2):
 Time required to execute all element in an array.
 
 
 Example: function to print all elements in an n array element with an n times ()
 */
print(".......Quadratic Time complexity....")

func printAllElementsNtimes<T>(arr : [T]){
    if arr.count == 0{
        print("No element")
    }else{
        let n = arr.count
        for _ in 0...n-1{
            print("====")
            for ele in arr{
                print(ele)
            }
        }
    }
}

printAllElementsNtimes(arr: [])
printAllElementsNtimes(arr: [1,2,3,4,5,6])
printAllElementsNtimes(arr: ["a","b","c","d","e","f","g"])

/*
 logarthimic Time complexity 0(logn):
 Time required to execute all element in an array, but here the array is halved every iteration.
 
 
 Example: function to show logarthmic Time complexity
 perfect example is the binary search
 */
print(".......logarthimic Time complexity....")

func binarySearch<T: Comparable>(_ arr: [T], key: T) -> Bool {
    var lowerBound = 0
    var upperBound = arr.count
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if arr[midIndex] == key {
            return true
        } else if arr[midIndex] < key {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return false
}

let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
print("Index is \(binarySearch(numbers, key: 50))")




/*
 Quasi Linear Time complexity 0(n logn) :
 
 Also called as log linear O(n logn)
 
 Example: function to show Quasi Linear Time complexity
 perfect example is the Quick Sort
 */



func quickSort<T:Comparable>(newArray: [T])->[T] {
    
    var less = [T]()
    var equal = [T]()
    var greater = [T]()
    
    if newArray.count > 1{
        var pivot = newArray[(newArray.count-1)/2]
        
        for x in newArray {
            if x < pivot{
                less.append(x)
            }
            if x == pivot {
                equal.append(x)
            }
            if x > pivot {
                greater.append(x)
            }
        }
        return (quickSort(newArray:less)+equal+quickSort(newArray:greater))
        
    }
        
    else {
        return newArray
    }
    
}
let randomNumbers = [42, 12, 88, 62, 63, 56, 1, 77, 88, 97, 97, 20, 45, 91, 62, 2, 15, 31, 59, 5]
let x = quickSort(newArray: randomNumbers)
print(x)


/**
 
 Final observation is
 
 O(1)     <     O(n)    < O(logn) < O(nlogn) < O(n power 2) < O(n power 3)
 
 Constant <     Linear  <   Logarthmic   <  QuasiLinear / Log Linear
 
 **/





