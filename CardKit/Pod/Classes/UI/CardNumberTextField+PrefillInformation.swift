//
//  CardNumberTextField+PrefillInformation.swift
//  Pods
//
//  Created by Daniel Vancura on 3/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

public extension CardNumberTextField {
    
    public func prefillCardInformation(cardNumber: String?, month: Int?, year: Int?, cvc: String?) {
        if let year = year {
            var trimmedYear = year
            if year > 100 {
                trimmedYear = year % 100
            }
            
            yearTextField?.prefillInformation(String(format: "%02i", arguments: [trimmedYear]))
        }
        
        if let month = month {
            monthTextField?.prefillInformation(String(format: "%02i", arguments: [month]))
        }
        
        if let cardNumber = cardNumber, let numberInputTextField = numberInputTextField {
            numberInputTextField.prefillInformation(cardNumber)
        }
        
        if let cvc = cvc {
            cvcTextField?.prefillInformation(cvc)
        }
        
        NSOperationQueue().addOperationWithBlock({
            NSThread.sleepForTimeInterval(0.5)
            NSOperationQueue.mainQueue().addOperationWithBlock({ [weak self] _ in
                self?.moveNumberFieldLeftAnimated()
            })
        })
        
        notifyDelegate()
    }
}
