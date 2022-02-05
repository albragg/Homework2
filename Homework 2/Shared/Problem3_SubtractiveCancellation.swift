//
//  Problem3_SubtractiveCancellation.swift
//  Homework 2
//
//  Created by Alyssa Bragg on 2/3/22.
//

import Foundation


// PROBLEM 3

//   (up)        __ N        1
//   S      =    \           --
//               /__ n = 1   n
//   (down)      __ 1        1
//   S      =    \           --
//               /__ n = N   n


func calcSUpAndSDown(N: Int)->(Double, Double){
    var SUp = 0.0
    var SDown = 0.0
    for n in 1...N{
        let nUp = Double(n)
        let nDown = Double(N-n+1)
        SUp += 1/nUp
        SDown += 1/nDown
    }
    return (SUp, SDown)
}
// Plot relative error
func calcErrorSUpDown(N: Int) -> (Double, Double){
    let S = calcSUpAndSDown(N: N)
    let sDiff = (S.0 - S.1)/(abs(S.0)+abs(S.1))
    let relativeError = log(abs(sDiff))/log(10)
    let logN = log(Double(N))/log(10)
    return (relativeError, logN)
}

