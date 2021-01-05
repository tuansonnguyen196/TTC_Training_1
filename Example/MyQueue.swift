//
//  MyQueue.swift
//  Example
//
//  Created by admin on 1/5/21.
//

import Foundation

class Queue<T> {
    private var elements: [T] = []
    private let queue = DispatchQueue(label: "vn.conglv.queue", attributes: .concurrent)
    private let semaphore = DispatchSemaphore(value: 1)
    private let lock = NSLock()
    
    func pushDispatch(_ element: T) {
        queue.async(flags: .barrier) {
            self.elements.append(element)
        }
        
    }
    
    func popDispatch() -> T? {
        queue.sync(flags: .barrier) {
            if self.elements.isEmpty {
                return nil
            }
            
            return self.elements.removeFirst()
        }
    }
    
    func pushSemaphore(_ element: T) {
        semaphore.wait()
        defer {
            semaphore.signal()
        }
        
        self.elements.append(element)
    }
    
    func popSemaphore() -> T? {
        semaphore.wait()
        defer {
            semaphore.signal()
        }
        
        if self.elements.isEmpty {
            return nil
        }
        return self.elements.removeFirst()
    }
    
    func pushLock(_ element: T) {
        lock.lock()
        defer {
            lock.unlock()
        }
        self.elements.append(element)
    }
    
    func popLock() -> T? {
        lock.lock()
        defer {
            lock.unlock()
        }
        return self.elements.removeFirst()
    }
}
