//
//  Complex.swift
//  prog3.3
//
//  Created by Ashleigh Ross on 7/25/17.
//  Copyright © 2017 Ashleigh Ross. All rights reserved.
//

import Foundation

/**
 Represents a complex number
 
 */
final class Complex : CustomStringConvertible, StringConvertibleNum {
    
    /**
     Converts string to a Complex object.  Supports string
     syntax of the following format:
     "a" - converts it to complex number a+0i
     "ai" - converts it to complex number 0+ai
     
     - parameter string: String to convert
     - returns: Complex? Complex object read from string, nil if
     syntax error in the string
     */
    static func readFromString(_ string: String) -> Complex? {
        // Break the string into tokens separated by i symbol
        var tokens = string.components(separatedBy: "i")
        
        // If there is at least one token, then there is
        // a numerator value
        if tokens.count > 0 {
            // The token is the number without the i, so can convert it
            // to a float value
            let numToken = tokens[0]
            let numFromStr : Float? = (numToken as NSString).floatValue;
            
            // If the conversion of the number to float worked...
            if let num = numFromStr {
                // Check if the token is the same as argument string...
                if numToken == string {
                    // If yes, then it means there was no i in the string...
                    return Complex(real: num, imag: 0.0)
                } else {
                    // If the passed in string had "i" at the end, the
                    // separate by string would have removed the i, so the
                    // token is not the same as the argument string.
                    // The number then is imaginary
                    return Complex(real: 0.0, imag: num);
                }
            }
        }
        return nil
    }
    
    
    // STORED PROPERTIES
    
    var real: Float;   // Real part of the number
    var imag: Float;   // Imaginary part of the number
    
    // COMPUTED PROPERTIES
    
    /**
     - returns: Float Magnitude of the complex number
     */
    var magnitude: Float {
        return (self.real * self.real) + (self.imag * self.imag)
    }
    
    /**
     - returns: String String representation of a complex number
     */
    var description: String {
        if(self.imag > 0){
            return "\(self.real)+\(self.imag)i"
        } else {
            return "\(self.real)\(self.imag)i"
        }
    }
    
    // INITIALISERS
    
    
    /**
     Designated initialiser
     
     Real and imaginary parts are passed in the arguments of the initialiser.
     
     - parameter real Real part of the numerator
     - parameter imag Imaginary part of the number
     */
    init(real : Float, imag : Float) {
        self.real = real
        self.imag = imag
    }
    
    /**
     Default initialiser
     
     Sets complex number to 0
     */
    convenience init() {
        self.init(real:0,imag:0)
    }
    
    // METHODS
    
    /**
    Creates a new object with copied state of another.
    - returns: New instance of the class
    */
    func copy() -> Complex {
        return Complex(real: self.real, imag: self.imag)
    }
    
    /**
     Adds two complex numbers.
     
     - parameter c1: Complex number to add to
     - parameter c2: Complex number to be added
     
     - returns: The result of c1 + c2.
     */
    static func add(c1: Complex, to c2: Complex) -> Complex {
        return Complex(real: c1.real + c2.real, imag: c1.imag + c2.imag)
    }
    
    /**
     Subtract a complex number from a complex number.
     
     - parameter c1: Complex number to subtract
     - parameter c2: Complex number to subtract from
     
     - returns: The result of c2 - c1.
     */
    static func subtract(c1: Complex, from c2: Complex) -> Complex {
        return Complex(real: c1.real - c2.real, imag: c1.imag - c2.imag)
    }
    
    /**
     Multiply a complex number by a complex number.
     
     - parameter c1: Complex number to multiply
     - parameter c2: Complex number to multiply by
     
     - returns: The result of c1*c2.
     */
    static func multiply(c1: Complex, by c2: Complex) -> Complex {
        return Complex(real: (c1.real * c2.real) - (c1.imag * c2.imag), imag:
            (c1.real * c2.imag) + (c1.imag * c2.real))
    }
    
    /**
     Divide a complex number by a complex number.
     
     - parameter c1: Complex number to divide
     - parameter c2: Complex number to divide by
     
     - returns: The result of c1/c2.
     */
    static func divide(c1: Complex, by c2: Complex) -> Complex {
        return Complex(real:(((c1.real * c2.real) + (c1.imag * c2.imag)) / c2.magnitude), imag:
        (((c1.imag * c2.real) - (c1.real * c2.imag)) / c2.magnitude))
    }
}

/**
 + operator between two Complex numbers
 */
func +(c1: Complex, c2: Complex) -> Complex {
    return Complex.add(c1: c1, to: c2)
}

/**
 - operator between two Complex numbers
 */
func -(c1: Complex, c2: Complex) -> Complex {
    return Complex.subtract(c1: c1, from: c2)
}

/**
 * operator between two Complex numbers
 */
func *(c1: Complex, c2: Complex) -> Complex {
    return Complex.multiply(c1: c1, by: c2)
}

/**
 / operator between two Complex numbers
 */
func /(c1: Complex, c2: Complex) -> Complex {
    return Complex.divide(c1: c1, by: c2)
}

/**
 + operator between a Complex number and a Float
 */
func +(c: Complex, x: Float) -> Complex {
    return Complex.add(c1: c, to: Complex(real: x,imag: 0))
}

/**
 - operator between a Complex number and a Float
 */
func -(c: Complex, x: Float) -> Complex {
    return Complex.subtract(c1: c, from: Complex(real: x,imag: 0))
}

/**
 * operator between a Complex number and a Float
 */
func *(c: Complex, x: Float) -> Complex {
    return Complex.multiply(c1: c, by: Complex(real: x, imag:0))
}

/**
 / operator between a Complex number and a Float
 */
func /(c: Complex, x: Float) -> Complex {
    return Complex.divide(c1: c, by: Complex(real: x, imag: 0))
}
