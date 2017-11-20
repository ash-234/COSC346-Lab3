//
//  Fraction.swift
//  prog2.1
//
//  Created by Ashleigh Ross on 7/19/17.
//  Copyright © 2017 Ashleigh Ross. All rights reserved.
//

import Foundation

/**
 Represents a number as a fraction of two integers
 
 */
class Fraction : CustomStringConvertible{
    
    // STORED PROPERTIES
    private let num: Int; // Numerator
    private let den: Int; // Denominator
    
    // COMPUTED PROPERTIES
    /** Converts fraction to a Float value
     - returns: Float decimal value of fraction
     */
    var decimal: Float{
        get{
            // num and den are of type Int, therefore, need to
            // explicitly be converted to Floats.
            return Float(self.num)/Float(self.den);
        }
    }
    /** Converts object to a string description
     - returns: String string representation of fraction
     */
    var description: String{
        if(self.num == 0){
            return "0"
        }else if(self.den == 1){
            return "\(self.num)"
        }
        //print("\(self.num%self.den) % \(self.num/self.den) /")
        if(self.num > self.den){
            return "\(self.num/self.den) \(self.num%self.den)/\(self.den)"
        }
        return "\(self.num)/\(self.den)"
    }
    
    // INITIALISERS
    /** Default initialiser, Numerator gets set
     to 0 and denominator gets set to 1.
     */
    init(){
        self.num = 0
        self.den = 1
    }
    
    /**
     Designated Initialiser
     Numerator and Denominator values are passed in the arguments of the initialiser.
     - parameter num: Fraction's numerator
     - parameter den: Fraction's denominator
     */
    init(num: Int, den: Int){
        // check the denominator
        assert(den != 0, "Denominator cannot be zero")
        var num = num
        var den = den
        
        if(den < 0){
            // if the denominator is negative
            // multiply the numerator and
            // denominator by -1 this
            // ensures the denominator is
            // always positive, and numerator
            // carries the appropriate sign
            num = -num
            den = -den
        }
        
        // Find greatest common denominator
        for gcd in (1...den).reversed() {
            if(num%gcd == 0 && den%gcd == 0){
                // common denominator found,
                // divide numerator and denominator
                num /= gcd
                den /= gcd
                break
            }
        }
        self.num = num
        self.den = den
    }
    
    /**
     Convenience initialiser
     Numerator is set to some value, denominator set to 1.
     - parameter num: Fraction's numerator
     */
    convenience init(num: Int){
        self.init(num: num, den:1);
    }
    
    // METHODS
    
    /** Adds a fraction to self.
     - parameter f: Fraction to add to self
     - returns: Fraction, result of adding f to self.
     */
    func add(_ f: Fraction) -> Fraction{
        return Fraction(num: self.num*den + self.den*f.num,
                        den: self.den*f.den)
    }
    
    /** Subtracts fraction from self.
     - parameter f: Fraction to subtract from self.
     - returns: Fraction the result of subtracting f from self.
     */
    func subtract(_ f: Fraction ) -> Fraction {
        return Fraction(num: self.num*f.den - self.den*f.num,
                        den: self.den*f.den)
    }
    
    /** Multiplies self by fraction
     - parameter f: Fraction to multiply self by
     - returns: fraction the result of multipling self by f.
     */
    func multiply(_ f: Fraction) -> Fraction{
        return Fraction(num: self.num*f.num, den: self.den*f.den)
    }
    
    /** Divides self by a fraction
     - parameter f: Fraction to divide self by
     - returns: Fraction the result of dividing self by f
     */
    func divide(_ f: Fraction) -> Fraction{
        return Fraction(num: self.num*f.den, den: self.den*f.num)
    }
    
    /** Add a fraction to fraction.
     - parameter f1: fraction to add to
     - parameter f2: fraction to be added
     - returns: the result of f1 + f2
     */
    static func add(_ f1: Fraction, to f2: Fraction) -> Fraction{
        return Fraction(num: f1.num*f2.den + f1.den*f2.num,
                        den: f1.den*f2.den)
    }
    
    /** Subtract a fraction from fraction.
     - parameter f1: fraction to subtract
     - parameter f2: fraction to subtract from
     - returns: the result of f1- f2.
     */
    static func subtract(_ f1: Fraction, from f2: Fraction) -> Fraction{
        return f2.subtract(f1);
    }
    
    /** Multiply a fraction by fraction
     - parameter f1: fraction to multiply
     - parameter f2: fraction to multiply by
     - returns: result f1 * f2
     */
    static func multiply(_ f1: Fraction, by f2: Fraction) -> Fraction{
        return f1.multiply(f2)
    }
    
    /** Divide a fraction by fraction
     - parameter f1: fraction to divide
     - parameter f2: fraction to divide by
     - returns: the result of f1/f2
     */
    static func divide(_ f1: Fraction, by f2: Fraction) -> Fraction{
        return f1.divide(f2);
    }
    
    /** Adds an integer to self
     - parameter x: Integer to add to self
     - returns: Fraction: the result.
     */
    func add(_ x: Int) -> Fraction{
        return Fraction(num: self.num + self.den*x,
                        den: self.den)
    }
    
    /** Subtracts an integer from self
     - parameter x: Integer to subtract from self
     - returns: Fraction: result
     */
    func subtract(_ x: Int) -> Fraction{
        return Fraction(num: self.num - self.den*x,
                        den: self.den)
    }
    
    /** Multiplies self by an integer
     - parameter x: Integer to multiply self by
     - returns: Fraction result
     */
    func multiply(_ x: Int) -> Fraction{
        return Fraction(num: self.num*x, den: self.den)
    }
    
    /** Divides self by an integer
     - parameter s: Integer to divide self by
     - returns: Fraction result
     */
    func divide(_ x: Int) -> Fraction{
        return Fraction(num: self.num, den: self.den*x)
    }
}

/**
 + operator between two fractions
 */
func +(f1: Fraction, f2: Fraction) -> Fraction{
    return f1.add(f2)
}

func +(f: Fraction, x: Int) -> Fraction{
    return f.add(x)
}

/**
 - operator between two fractions
 */
func -(f1: Fraction, f2: Fraction) -> Fraction{
    return f1.subtract(f2)
}

func -(f: Fraction, x: Int) -> Fraction{
    return f.subtract(x)
}
/**
 * operator between two fractions
 */
func *(f1: Fraction, f2: Fraction) -> Fraction{
    return f1.multiply(f2)
}

func *(f: Fraction, x: Int) -> Fraction{
    return f.multiply(x)
}
/**
 / operator between two fractions
 */
func /(f1: Fraction, f2: Fraction) -> Fraction{
    return f1.divide(f2)
}

func /(f: Fraction, x: Int) -> Fraction{
    return f.divide(x)
}
