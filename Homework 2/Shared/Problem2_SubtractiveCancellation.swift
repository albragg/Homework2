//
//  Problem2_SubtractiveCancellation.swift
//  Homework 2
//
//  Created by Alyssa Bragg on 2/3/22.
//

import Foundation

// PROBLEM 2 - uses single precision
func calcSSums(N: Int)->(Float, Float, Float){
 //                            n
 //   (1)       __ 2N     ( - 1)  n
 //  S     =   \         ----------
 //   N        /__ n = 1    n + 1
 // summing even and odd separately:
 //     (2)          __ N      2n - 1      __ N        2n
 //    S     =    - \         -------  +  \          ------
 //     N           /__ n = 1   2n        /__ n = 1  2n + 1
 // combining:
 //   (3)        __ N           1
 //   S     =    \          ----------
 //    N         /__ n = 1  2n(2n + 1)
    var S1 = Float(0)
    for n in 1...2*N {
        let n = Float(n)
        let nthTerm = pow(-1.0, n) * n / (n + 1)
        S1 += nthTerm
    }
    var S2Pos = Float(0)
    var S2Neg = Float(0)
    var S3 = Float(0)
    for n in 1...N {
        let n = Float(n)
        let nthTermPos = 2*n/(2*n + 1)
        let nthTermNeg = (2.0*n - 1.0)/(2.0*n)
        S2Pos += nthTermPos
        S2Neg += nthTermNeg
        let nthTerm3 = 1.0 / (2.0 * n * (2.0 * n + 1.0))
        S3 += nthTerm3
    }
    let S2 = S2Pos - S2Neg
    return (S1, S2, S3)
}
// PLOT THIS relative n
func calcErrorS1(N: Int) -> (Float, Float){
    let S = calcSSums(N: N)
    let sDifference = (S.0 - S.2)/S.2
    let relativeError = log(abs(sDifference))/log(10)
    let logN = log(Float(N))/log(10)
    return (relativeError, logN)
}
