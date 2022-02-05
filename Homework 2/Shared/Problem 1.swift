//
//  Problem 1.swift
//  Homework 2
//
//  Created by Alyssa Bragg on 2/3/22.
//
// Problem 1 Subtractive Cancellation Section 2.1.2

import Foundation

func calculateX(a: Double, b: Double, c: Double) -> (Double, Double, Double, Double){
// calc solutions x to the two forms of the quadratic equation
//                     ___________                               - 2c
//                   | /  2                       x'     = -----------------------
//            - b pm |/  b   -  4ac                1,2                 ___________
//  x     =   -----------------------                               | /  2
//   1,2                2a                                   - b pm |/  b   -  4ac
    let x1 = (-b + sqrt(pow(b, 2) - 4*a*c)) / (2*a)
    let x2 = (-b - sqrt(pow(b, 2) - 4*a*c)) / (2*a)
    let xPrime1 = -2*c/(b + sqrt(pow(b, 2) - 4*a*c))
    let xPrime2 = -2*c/(b - sqrt(pow(b, 2) - 4*a*c))
    return (x1, x2, xPrime1, xPrime2)
}

func calcErrorsP1(n: Int){
// for a=b=1, calc x for differenc values of c, c=10^-n, n from 1 to max, print diff between two forms
    print("Section 2.1.2 Exercise 1")
    for i in 1...n{
        let c: Double = pow(10.0, -1.0*Double(i))
        print("a = 1, b = 1, c =", c)
        print("x1, x2, x'1, x'2:")
        let x = calculateX(a: 1.0, b: 1.0, c: c)
        print(x)
        let diffx1 = (abs(x.2 - x.0))/((abs(x.2) + abs(x.0)))
        let diffx2 = (abs(x.3 - x.1))/((abs(x.3) + abs(x.1)))
        print("relative error between x1 and x'1: ", diffx1)
        print("relative error between x2 and x'2: ", diffx2)
    }
}
