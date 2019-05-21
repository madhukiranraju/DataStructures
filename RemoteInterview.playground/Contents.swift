import UIKit

//var str = "Hello playground"
//str = String(str.reversed())
//let result = str
//    .components(separatedBy: " ")
//    .map { $0.reversed() }
//    .joined(separator: " ")

//print(String(result))
//let result2 = str.split(separator: " ").map { $0.reversed() }
////    .joined(separator: " "))
//let result3 = String(str.components(separatedBy: " ")//.map { $0.reversed() }
//    .joined(separator: " "))
////.map{$0.reversed()})//.joined(separator: " ")
//print(result2)
////print(result3)
//
//
//let array = ["Madhu","Kiran", "Raju"]
//print(array.joined(separator: " "))
//
//
//var a = [1,2,3,4,5,6]
//var b = a.map{pow(Double($0), 3.0)}
//print(b)
//
//
//let numSeries = Array(0...100)
////print(numSeries)
//let evenNums = numSeries.filter{$0%2 == 0}
//print(evenNums)


var str = "Hello world"
str = String(str.reversed())
var result = str
            .components(separatedBy: " ")
            .map{$0.reversed()}
            .joined(separator: " " )
//needed to convert the reversed collection to String
print(String(result))


//declaring 1--100 array

let arr100 = Array(1..<100)
//print(arr100)
print(arr100.filter{ $0 % 5 == 0 })
let arrMul5 = arr100.filter{$0 % 5 == 0}.map{$0*5}
print(arrMul5)


/*
 John works at a clothing store. He has a large pile of socks that he must pair by color for sale. Given an array of integers representing the color of each sock, determine how many pairs of socks with matching colors there are.
 For example, there are  socks with colors . There is one pair of color  and one of color . There are three odd socks left, one of each color. The number of pairs is .
 Function Description
 Complete the sockMerchant function in the editor below. It must return an integer representing the number of matching pairs of socks that are available.
 sockMerchant has the following parameter(s):
 n: the number of socks in the pile
 ar: the colors of each sock
 Input Format
 The first line contains an integer , the number of socks represented in .
 The second line contains  space-separated integers describing the colors  of the socks in the pile.
 Constraints
 
 where
 Output Format
 Return the total number of matching pairs of socks that John can sell.
 Sample Input
 9
 10 20 20 10 10 30 50 10 20
 Sample Output
 3
 */

// Complete the sockMerchant function below.
//func sockMerchant(n: Int, ar: [Int]) -> Int {
//
//        var leftItems = 0
//        var arr = ar
//        let len = arr.count
//        for item in Set(ar){
//
//            if ar.contains(item){
//                let copyArr = arr
//    //            print("CopyArr = \(copyArr) for \(item)")
//                let copyLen = (copyArr.filter{$0 == item}).count
//    //            print("Copy Len = \(copyLen)")
//                if copyLen % 2 != 0{
//                    leftItems = leftItems+1
//                }
//            }
//        }
//    
//        return leftItems
//    }

func sockMerchant(n: Int, ar: [Int]) -> Int {
    var count = 0
    var arr = ar
    arr.sort()
    arr.append(99999)
    var i = 0
    while i<n{
        if arr[i] == arr[i+1]{
            count = count+1
            i+=2
        }else{
            i+=1
        }
    }
    return count
}
    
print(sockMerchant(n: 7, ar: [1,2,1,2,1,3,2]))
print(sockMerchant(n: 9, ar: [10,20,20,10,10,30,50,10,20]))
print(sockMerchant(n: 10, ar: [1, 1 ,3, 1, 2, 1, 3, 3, 3 ,3]))

let sam = [1, 1 ,3, 1, 2, 1, 3, 3, 3 ,3]//1 and 2
print(Set(sam))

func countingValleys(n: Int, s: String) -> Int {
    
    var valley = 0
    var level = 0

    for i in s{
        //print(i)
        if(i=="U"){
            level+=1
            if(level==0){
                valley+=1
            }
        }
        else{
            level-=1
        }

    }

    
    return valley
}


print(countingValleys(n: 8, s: "UDDDUDUU"))


func jumpingOnClouds(c: [Int]) -> Int {
    var jumps = 0
    
    var current = 0
    let end = c.count - 1

    while current < end{
        if ((current + 2) <= end) && (c[current + 2] == 0){
            current += 2
            jumps += 1
        }
        else if c[current + 1] == 0{
            current += 1
            jumps += 1
        }
    }
    return jumps
}
print(jumpingOnClouds(c: [0, 0, 1, 0, 0, 1, 0]))
//0 0 0 1 0 0
print(jumpingOnClouds(c: [0, 0, 0, 1, 0, 0]))

print("===========")
func repeatedString(s: String, n: Int) -> Int {
    
    var repeated = 0
    let strLen = s.count
    let repeattimes = n/strLen+1
    
    var repeatedString = String(repeating: s, count: repeattimes)
    repeatedString = String(repeatedString.prefix(n))

    repeated = repeatedString.filter{$0 == "a"}.count
    //repeated = (repeatedString.filter{$0 == 'a'}).count
    
    return repeated
}


print(repeatedString(s: "aba", n: 10))
print(repeatedString(s: "a", n: 10000))

