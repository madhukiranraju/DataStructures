import UIKit



var numbers = [2,6,7,19,11,45,9,23,0,56,78,99]

//Bubble Sorting
// best = O(n)
//avg and worst = O(n^2)

func bubbleSort(_ arr : inout [Int])->[Int]{
    
    for i in 0...arr.count-1{
        for j in i...arr.count-1{
            if arr[i] < arr[j]{
                var temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
            }
        }
    }
    
    return arr
}


print(bubbleSort(&numbers))



