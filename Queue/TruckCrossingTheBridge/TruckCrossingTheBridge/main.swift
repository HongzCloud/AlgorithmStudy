//
//  main.swift
//  TruckCrossingTheBridge
//
//  Created by 오킹 on 2021/07/15.
// 문제 : 

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var myTruckWeights = truck_weights
    var time = 1
    var terminal = [(Int, Int)]()
    terminal.append((myTruckWeights.removeFirst(),0))
    
    while true {
        if let truck = myTruckWeights.first {
            var test = terminal.reduce((0,0)) {($0.0 + $1.0, 0)}
            if truck + test.0 > weight {
                
                print(terminal)
           
            } else {
                terminal.append((myTruckWeights.removeFirst(),0))
            }
        }
        time += 1
        terminal = terminal.map{($0.0, $0.1 + 1)}
        terminal = terminal.filter{$0.1 < bridge_length}
        if terminal.isEmpty &&  myTruckWeights.isEmpty {
            print(terminal)
        
            time += 1
            print(time)
            break
        }
    }

    return time
}

//solution(2, 10, [7,4,5,6])
solution(100, 100,    [10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
