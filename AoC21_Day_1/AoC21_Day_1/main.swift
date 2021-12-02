//
//  main.swift
//  AoC21_Day_1 - Part 1
//
//  Created by Clement Hathaway on 12/1/21.
//

import Foundation

let inputFile = "/Users/clement/Github/AdventOfCode21/AoC21_Day_1/AoC21_Day_1/input/input.txt"
let path = FileManager.default.currentDirectoryPath
print(path)

var increasedCounter:Int = 0
let kernelSize = 3

//
// PART 1
//
// Main reading of file and operating on data section - weo swift type safety... or something
//do {
//    let inputData = try String(contentsOfFile: inputFile)
//    let dataPoints = inputData.split(separator:"\n")
//    let dataPointLength = dataPoints.count
//
//    for index in 0 ..< dataPointLength-1{
//        let optFutureDataPoint:Int?  = Int(dataPoints[index + 1])
//        let optCurrentDataPoint:Int? = Int(dataPoints[index])
//
//        if let futureDataPoint = optFutureDataPoint,
//           let currentDataPoint = optCurrentDataPoint {
//
//            if futureDataPoint > currentDataPoint{
//                increasedCounter += 1
//            }
//
//        }else{
//            print("failed to unwrap optionals")
//        }
//    }
//
//} catch{
//    print("Error info: \(error)")
//}
//
//print("Increased count: \(increasedCounter)")

//
// PART 2
//
do {
    let inputData = try String(contentsOfFile: inputFile)
    let dataPoints = inputData.split(separator:"\n")
    
    // Convert the [String] to [Int] skipping the nil and optional rubbish via compactMap
    let intDataPoints:[Int] = dataPoints.compactMap {str in Int(str)} // Pass in a closure - honestly midly confusing https://developer.apple.com/documentation/swift/sequence/2950916-compactmap
    let dataPointLength = intDataPoints.count
    var summedArray:[Int] = []
    
    // Generate summed array
    for index in 0 ..< dataPointLength-(kernelSize-1){
        var windowedSum = 0
        
        for subIndex in 0..<kernelSize{
            windowedSum += intDataPoints[index+subIndex]
        }
        summedArray.append(windowedSum)
    }
    
    //print(summedArray)
    
    // Run another for loop to check slope - ik this is slow but im tired rn
    for index in 0..<summedArray.count-1{
        if summedArray[index + 1] > summedArray[index]{
            //print("\(summedArray[index + 1]) is larger than \(summedArray[index])")
            increasedCounter += 1
        }
    }
    
}catch{
    print("Error info: \(error)")
}

print("Increased count: \(increasedCounter)")
