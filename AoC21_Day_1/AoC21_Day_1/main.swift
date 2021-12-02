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

// Main reading of file and operating on data section - weo swift type safety... or something
do {
    let inputData = try String(contentsOfFile: inputFile)
    let dataPoints = inputData.split(separator:"\n")
    let dataPointLength = dataPoints.count
    
    for index in 0 ..< dataPointLength-1{
        let optFutureDataPoint:Int?  = Int(dataPoints[index + 1])
        let optCurrentDataPoint:Int? = Int(dataPoints[index])
        
        if let futureDataPoint = optFutureDataPoint,
           let currentDataPoint = optCurrentDataPoint {
            
            if futureDataPoint > currentDataPoint{
                increasedCounter += 1
            }
            
        }else{
            print("failed to unwrap optionals")
        }
    }
    
} catch{
    print("Error info: \(error)")
}

print("Increased count: \(increasedCounter)")
