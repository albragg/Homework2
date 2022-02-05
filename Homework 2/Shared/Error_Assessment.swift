//
//  Error_Assessment.swift
//  Homework 2
//
//  Created by Alyssa Bragg on 2/4/22.
//

import Foundation

// 2.3.1
// equation for sin(x)
func sinX(x: Double, N: Int) -> Double{
    var sinX = 0.0
    for i in 1...N {
        let n = Double(i)
        let nthTerm = pow(-1.0, n-1.0) * pow(x, 2.0*n-1.0)
        sinX += nthTerm
    }
    return sinX
}
// compare equation to built in function, plot
func compareSinX(x: Double) -> (Double, Double){
    // find N to stop at so next term is less than 10^-7 of the result
    var N = 1
    while sinX(x: x, N: N+1) > pow(10, -7)*sinX(x: x, N: N){
        N += 1
    }
    return (sinX(x: x, N: N), sin(x))
}

