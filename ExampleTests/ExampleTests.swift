//
//  ExampleTests.swift
//  ExampleTests
//
//  Created by admin on 1/5/21.
//

import XCTest
@testable import Example

class ExampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDispatch() throws {
        let queue = Queue<Int>()
        
        DispatchQueue.concurrentPerform(iterations: 1000) { (i) in
            queue.pushDispatch(i)
        }
        
        DispatchQueue.concurrentPerform(iterations: 1000) { (i) in
            _ = queue.popDispatch()
        }
        
    }

    func testSemaphore() throws {
        let queue = Queue<Int>()
        DispatchQueue.concurrentPerform(iterations: 1000) { (i) in
            queue.pushSemaphore(i)
        }
        
        DispatchQueue.concurrentPerform(iterations: 1000) { (i) in
            _ = queue.popSemaphore()
        }
    }
    
    func testLock() throws {
        let queue = Queue<Int>()
        DispatchQueue.concurrentPerform(iterations: 1000) { (i) in
            queue.pushLock(i)
        }
        
        DispatchQueue.concurrentPerform(iterations: 1000) { (i) in
            _ = queue.popLock()
        }
    }
}
