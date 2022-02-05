//
//  Recursion_Relations.swift
//  Homework 2
//
//  Created by Alyssa Bragg on 2/3/22.
//

import Foundation

// indices
// we want to calculate up to l = 25
let minL = 0
let maxL = 25


// increment l up
func jPlus(jL: Double, jLMinus1: Double, l: Int, x: Double) -> Double{
    let jLPlus1 = (2.0 * Double(l) + 1.0) / x * jL - jLMinus1
    return jLPlus1
}
// increment l down
func jMinus(jL: Double, jLPlus1: Double, l: Int, x: Double) -> Double{
    let jLMinus1 = (2.0 * Double(l) + 1.0) / x * jL - jLPlus1
    return jLMinus1
}
// calculate jL(x) for l from 0 to 25
func jUp(x: Double) -> [Double]{
    var jUpValues = Array(repeating: 0.0, count: maxL - minL + 1)
    jUpValues[0] = sin(x)/x
    jUpValues[1] = sin(x)/pow(x, 2) - cos(x)/x
    for n in (minL + 2)...maxL{
        let l = n-1
        let lMinus1 = n-2
        jUpValues[n] = jPlus(jL: jUpValues[l], jLMinus1: jUpValues[lMinus1], l: l, x: x)
    }
    return jUpValues
}
// calculate jL(x) for l from 25 to 0
func jDown(x: Double) -> [Double]{
    var jDownValues = Array(repeating: 0.0, count: maxL - minL + 1)
    let j0 = sin(x)/x
    jDownValues[maxL] = 1.0
    jDownValues[maxL - 1] = 1.0
    for n in minL...(maxL - 2){
        let m = (maxL - 2) - n
        let l = (maxL - 1) - n
        let lPlus1 = maxL - n
        jDownValues[m] = jMinus(jL: jDownValues[l], jLPlus1: jDownValues[lPlus1], l: l, x: x)
    }
    let normalizationConstant = j0 / jDownValues[0]
    for l in 0...25{
        jDownValues[l] *= normalizationConstant
    }
    return jDownValues
}
// calculate relative difference
func jRelativeDiff(x: Double, l:Int) -> Double{
    let jUpValues = jUp(x: x)
    let jDownValues = jDown(x: x)
    let jLUp = jUpValues[l]
    let jLDown = jDownValues[l]
    let diff = abs(jLUp - jLDown) / (abs(jLUp) + abs(jLDown))
    return diff
}
// calculate for x = 0.1, x = 1. x = 10
func calculateJL(){
    print("Section 2.2.2 Exercises")
    var x = 0.1
    print("x = ", x)
    for l in 0...25{
        print("l = ", l)
        let jUpL = jUp(x: x)[l]
        let jDownL = jDown(x: x)[l]
        print("j_l up = ", jUpL)
        print("j_l down = ", jDownL)
        print("relative difference = ", jRelativeDiff(x: x, l: l))
    }
    x = 1
    print("x = ", x)
    for l in 0...25{
        print("l = ", l)
        let jUpL = jUp(x: x)[l]
        let jDownL = jDown(x: x)[l]
        print("j_l up = ", jUpL)
        print("j_l down = ", jDownL)
        print("relative difference = ", jRelativeDiff(x: x, l: l))
    }
    x = 10
    print("x = ", x)
    for l in 0...25{
        print("l = ", l)
        let jUpL = jUp(x: x)[l]
        let jDownL = jDown(x: x)[l]
        print("j_l up = ", jUpL)
        print("j_l down = ", jDownL)
        print("relative difference = ", jRelativeDiff(x: x, l: l))
    }
}

