import UIKit


/*
 1 Bubble Sort
 2 Selection Sort
 3 Insertion Sort
 4 Shell Sort
 5 Merge Sort
 6 Heap Sort
 7 Quick Sort
 8 Tree Sort
 9 Comparison of Sorting Algorithms
 10 Linear Sorting Algorithms
 11 Counting Sort
 12 Bucket Sort (or Bin Sort)
 13 Radix Sort
 14 Topological Sort
 15 External Sorting
 
 */


var arrSample = NSMutableArray(array: [543, 246, 933, 127, 277, 321, 454, 565, 220])


func swapTwoValues(_ a : inout Int, _ b : inout Int) {
    print(a)
    print(b)
    let temporaryA = a
    a = b
    b = temporaryA
}

func bubbleSort()->[Int]{

    for i in 0..<arrSample.count {
        for j in 1..<arrSample.count - i {
            if (arrSample[j] as! Int) < (arrSample[j-1] as! Int){
                swap(&arrSample[j], &arrSample[j-1])
            }
        }
    }
    //converting the nsmutable array to array
    return arrSample as! [Int]
}
print("Buble sort.......")
print(bubbleSort())

///////or

func simpleBubbleSort(_ array : [Int]) -> [Int]{
    
    var array = array// making mutable

    for i in 0..<array.count {
        for j in 1..<array.count - i {
            if array[j] < array[j-1] {
                let tmp = array[j-1]
                array[j-1] = array[j]
                array[j] = tmp
            }
        }
    }
    return array
}

print("Bubble simple sort.......")
print(simpleBubbleSort([543, 246, 933, 127, 277, 321, 454, 565, 220]))
//Best time = O(n) //only if the arr is already sorted
//Average time = O(n^2)
//Worst time = O(n^2)

//arrSample = NSMutableArray(array: [543, 246, 933, 127, 277, 321, 454, 565, 220])

func selectionSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }  // 1

    var array = array
     for i in 0..<array.count {
        var minIndex = i

        for j in i+1..<array.count{
            if array[j] < array[minIndex]{
                minIndex = j
            }
        }
        if i != minIndex{
            array.swapAt(i, minIndex)
        }
    }
    return array
}

print("\n\nSelection Sort......")
print(selectionSort([543, 246, 933, 127, 277, 321, 454, 565, 220]))

//Best time = O(n^2)
//Average time = O(n^2)
//Worst time = O(n^2)

func insertionSort(_ array: [Int]) -> [Int] {
    
    var array = array
    for i in 0..<array.count{
        let key = array[i]
        var j = i-1
        
        while (j >= 0 && array[j] > key) {
            array[j+1] = array[j]
            j = j-1
        }
//        print(j)
        array[j+1] = key
    }
    
    return array
}

print("\n\ninsertion Sort......")
//                          j   key
print(insertionSort([543, 246 , 933, 127, 277, 321, 454, 565, 220]))

//Best time = O(n)
//Average time = O(n^2)
//Worst time = O(n^2)





func quickSort(array: [Int])->[Int] {
    
    var less = [Int]()
    var equal = [Int]()
    var greater = [Int]()
    
    var array = array
    
    if array.count > 1{
        var pivot = array[(array.count-1)/2]
        
        for x in array {
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
        return (quickSort(array:less)+equal+quickSort(array:greater))
        
    }else {
        return array
    }
    
}

print("\n\nQuick sort.....")
print(quickSort(array : [543, 246 , 933, 127, 277, 321, 454, 565, 220]))

// Best time = O(nlogn)
//Average time = O(nlogn)
//Worst time = O(n^2)

//Split Arrays
func mergeSort(array: [Int]) -> [Int] {
    
    guard array.count > 1 else {
        return array
    }
    
    let leftArray  = Array(array[0..<array.count/2])
    let rightArray = Array(array[array.count/2..<array.count])
    
    return merge(left: mergeSort(array: leftArray), right: mergeSort(array: rightArray))
}

//Merge Arrays
func merge(left: [Int], right: [Int]) -> [Int] {
    
    var mergedArray = [Int]() 
    var left = left
    var right = right
    
    while left.count > 0 && right.count > 0 {
        
        if left.first! < right.first! {
            mergedArray.append(left.removeFirst())
        } else {
            mergedArray.append(right.removeFirst())
        }
    }
    
    return mergedArray + left + right
}


print("\n\nmerge Sort.....")
print(mergeSort(array : [543, 246 , 933, 127, 277, 321, 454, 565, 220]))
// Best time = O(nlogn)
//Average time = O(nlogn)
//Worst time = O(nlogn)
