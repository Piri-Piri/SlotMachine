//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by David Pirih on 22.09.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

import Foundation

class SlotBrain {
    
    class func computeWinnings(slots: [[Slot]]) -> Int {
        var slotsInRows = unpackSlotsIntoSlotRows(slots)
        
        var winnings = 0
        var flushWinCount = 0
        var threeOfKindCount = 0
        var straightWinCount = 0
        
        // check all kind of winnings
        for slotRow in slotsInRows {
            
            // Flushes
            if checkForFlush(slotRow) {
                println("Flush!")
                winnings += 1
                flushWinCount += 1
            }
            
            // Three in a Row
            if checkForThreeInARow(slotRow) {
                println("Three in a row!")
                winnings += 1
                straightWinCount += 1
            }
            
            // Three of Kind
            if checkForThreeOfKind(slotRow) {
                println("Three of a kind!")
                winnings += 3
                threeOfKindCount += 1
            }
            
            // Royal Flash
            if flushWinCount == 3 {
                println("Royal Flush!!!")
                winnings += 15
            }
            // Epic Straight
            if straightWinCount == 3 {
                println("Epic Straight!!!")
                winnings += 1000
            }
            // Threes all around
            if threeOfKindCount == 3 {
                println("Threes all around!!!")
                winnings += 500
            }
        }
        
        return winnings
    }
    
    class func unpackSlotsIntoSlotRows(slots: [[Slot]]) -> [[Slot]] {
        var slotRow: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots {
            for var index = 0; index < slotArray.count; index++ {
                var slot = slotArray[index]
                
                if index == 0 {
                    slotRow.append(slot)
                }
                else if index == 1 {
                    slotRow2.append(slot)
                }
                else if index == 2 {
                    slotRow3.append(slot)
                }
                else {
                    println("Error")
                }
                
            }
        }
        
        var slotInRows: [[Slot]] = [slotRow, slotRow2, slotRow3]
        return slotInRows
    }
    
    // MARK: Helper Functions
    
    class func checkForFlush(slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.isRed && slot2.isRed && slot3.isRed {
            return true
        }
        else if !slot1.isRed && !slot2.isRed && !slot3.isRed {
            return true
        }
        return false
    }
    
    class func checkForThreeInARow(slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value - 1 && slot2.value == slot3.value - 1 {
            return true
        }
        else if slot1.value == slot2.value + 1 && slot2.value == slot3.value + 1  {
            return true
        }
        return false
    }
    
    class func checkForThreeOfKind(slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value && slot2.value == slot3.value {
            return true
        }
        return false
    }
    
}
