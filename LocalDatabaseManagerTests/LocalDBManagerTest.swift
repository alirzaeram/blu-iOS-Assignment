//
//  LocalDBManagerTest.swift
//  LocalDatabaseManagerTests
//
//  Created by Philip Eram on 4/21/23.
//

import XCTest
@testable import LocalDatabaseManager

final class LocalDBManagerTest: XCTestCase {
    // MARK: - Test Variables
    var sut: LocalDatabase<[Int]>!
    
    // MARK: - Setup/Teardown Methods
    override func setUp() {
        super.setUp()
        sut = self.makeSUT()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    // MARK: - Test Methods
    func test_WriteToFile() throws {
        let sut = makeSUT()
        let objectToWrite = [42]
        
        // Write the object to the file
        try sut.writeToFile(objectToWrite)
        
        // Verify that the file was written correctly
        let fileData = try Data(contentsOf: URL(fileURLWithPath: sut.modelFileDirectoryPath))
        let decodedObject = try JSONDecoder().decode([Int].self, from: fileData)
        XCTAssertEqual(decodedObject, objectToWrite)
    }
    
    func test_ReadFromFile() throws {
        let sut = makeSUT()
        let objectToWrite = [42]
        
        // Write the object to the file
        try sut.writeToFile(objectToWrite)
        
        // Read the object from the file
        let readObject = try sut.readFromFile()
        XCTAssertEqual(readObject, objectToWrite)
    }
     
}

extension LocalDBManagerTest {
    
    func makeSUT() -> TestLocalDB {
        .init()
    }
    
    class TestLocalDB: LocalDatabase<[Int]> {
        override var modelFileName: String { "Test.json" }
    }
}
