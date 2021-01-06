//
//  MyQueue.swift
//  Example
//
//  Created by admin on 1/5/21.
//

import Foundation

class Queue<T> {
    private var elements: [T] = []
    
    func pushDispatch(_ element: T) {
            self.elements.append(element)
    }
    
    func popDispatch() -> T? {
            if self.elements.isEmpty {
                return nil
            }
            
            return self.elements.removeFirst()
    }
    
    func pushSemaphore(_ element: T) {
        
        self.elements.append(element)
    }
    
    func popSemaphore() -> T? {
        
        if self.elements.isEmpty {
            return nil
        }
        return self.elements.removeFirst()
    }
    
    func pushLock(_ element: T) {

        self.elements.append(element)
    }
    
    func popLock() -> T? {

        return self.elements.removeFirst()
    }
}
