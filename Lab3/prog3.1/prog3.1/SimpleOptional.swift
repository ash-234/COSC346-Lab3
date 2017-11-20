//
//  SimpleOptional.swift
//  prog3.1
//
//  Created by Ashleigh Ross on 7/25/17.
//  Copyright © 2017 Ashleigh Ross. All rights reserved.
//

import Foundation

/** 
  Wrapper for value (or an object) with a boolean flag
  that indictates whether the value is defined or not
 */

class SimpleOptional : CustomStringConvertible {
    
    // STORED PROPERTIES
    
    let value: Any      //Reference to wrapped value
    let hasValue: Bool  //Flag indicating whether value has been
    // set or not
    
    // COMPUTED PROPERTIES
    
    /**
        returns: Any reference to the unwrapped value
     */
    var unwrap: Any {
        // cannot unwrap if there is no value
        assert(self.hasValue, "fatal error: cannot unwrap a NIL")
        
        return self.value
    }
    
    /** 
        returns: String, string representation of the wrapped value if not nil, "nill" otherwise.
    */
    var description: String {
        if self.hasValue {
            return "SimpleOptional(\(self.value))"
        } else{
            return "nil"
        }
    }
    
    // INITIALISERS
    
    /**
        Initialiser for undefined value
    */
    fileprivate init() {
        self.value = "Undefined"
        self.hasValue = false
    }
    
    /** 
        Initialiser that wraps a defined value
        parameter value: Value (or object) to wrap
    */
    init(value: Any){
        self.value = value
        self.hasValue = true
    }
    
}

/** 
 Equality comparsion operator between two SimpleOptionals
 
 Two optionals are considered the same if they both
 wrap a value, or are both nil. The wrapped values
 are not compared. This is useful for checking whether
 a SimpleOptional has a value or not.
  - parameter left: The operand to the left of ==
  - parameter right: The operand to the right of ==
 
  - returns: Bool True if both optionals has a value or both 
 have no value, false otherwise.
 */
func ==(left: SimpleOptional, right: SimpleOptional) -> Bool {
    if right.hasValue == left.hasValue {
        return true
    } else {
        return false
    }
}

/** 
 Non-equality comparison operator between two SimpleOptionals
 
 This operator inverts the logic of the == operator
 - parameter left: The operand to the left of !=
 - parameter right: The operand to the right of !=
 
 - returns: Bool True if one of the optionals has a value and the other
 doesn't, false otherwise.
 */
func != (left: SimpleOptional, right: SimpleOptional) -> Bool {
    return !(left == right)
}

// Define NIL as a SimpleOptional that has no value
let NIL: SimpleOptional = SimpleOptional()
 
