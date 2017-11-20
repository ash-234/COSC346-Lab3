//
//  main.swift
//  prog3.2
//
//  Created by Ashleigh Ross on 7/25/17.
//  Copyright © 2017 Ashleigh Ross. All rights reserved.
//

import Foundation

// Declare variable x as an optional Int
var x: Int?

// Assign nil to x
x = nil

// print x
print("x=\(x)")

// check if x has a value or not
if x == nil {
    print("x has no value")
} else {
    // if x has a value, unwrap that value and print it
    print("x has a value of \(x!)")
}

// assign a value of 3 to x
x = 3

// print x
print("x=\(x)")

// Check if x has a value or not
if let xunwrapped = x{
    // checking through a let will automatically
    // unwrap a non-nil optional into a constant, 
    // so no need to unwrap
    print("x has a value of \(xunwrapped)")
} else {
    print("x has no value")
}

// declare variable z as an optional Fraction
var z: Fraction!

// Assign a Fraction object 1/3 to z
z = Fraction(num: 1, den:3)

// print z
print("z=\(z)")

// check if z has a value or not
if let zunwrapped = z{
    // checking through a let will automatically 
    // unwrap a non-nil optional into a constant, 
    // so no need to unwrap
    print("z has a value of \(zunwrapped)")
    print("The decimal property of z's value is \(zunwrapped.decimal)")
} else {
    print("z has no value")
}
