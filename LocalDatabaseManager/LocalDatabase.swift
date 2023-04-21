//
//  LocalDatabase.swift
//  LocalDatabaseManager
//
//  Created by Philip Eram on 4/21/23.
//

import Foundation

/// You must not instantiate this class directly, rather this class must always be subclassed for future use.
open class LocalDatabase<T: Codable> {
    
    public init() { }
    
    /// The name of the directory containing your database.
    open var modelDirectory: String { "LocalDatabaseDirectory" }
    
    /// The name of and format of your database must be overriden from here.
    /// The format of your database is to be ".json" for now and until further updates.
    open var modelFileName: String {
        preconditionFailure("LocalDatabase: modelFileName must be overriden")
    }
    
    /// The final path used for your database: modelDirectory/modelFileName
    internal var modelFileDirectory: String { "\(modelDirectory)/\(modelFileName)" }
    
    /// The path used for writing on your database in the documentDirectory: NSHomeDirectory() + "Documents" + modelFileDirectory
    internal var modelFileDirectoryPath: String { pathInDocumentDirectory(modelFileDirectory) }
    
    /// The path used for creating your directory before first write: NSHomeDirectory() + "Documents" + modelDirectory
    internal var modelDirectoryPath: String { pathInDocumentDirectory(modelDirectory) }
    
    /// This method saves the object on the database. Since the write happens atomically, the current database will be overriden with the new data
    /// - Parameter object: object of generic type specified on the class
    final public func writeToFile(_ object: T) throws {
        let encodable = try JSONEncoder().encode(object)
        try createDirectory(at: modelDirectoryPath)
        try encodable.write(to: URL(fileURLWithPath: modelFileDirectoryPath), options: .atomic)
    }
    
    /// This method reads the saved object from the database. Method can throw if there has been no valid writings in the database before or data is corrupted
    /// - Returns: object of generic type specified on the class
    final public func readFromFile() throws -> T {
        let file = try Data(contentsOf: URL(fileURLWithPath: modelFileDirectoryPath))
        let decodable = try JSONDecoder().decode(T.self, from: file)
        return decodable
    }
}

extension LocalDatabase {
    
    final public func pathInDocumentDirectory(_ path: String) -> String {
        NSHomeDirectory() + "/" + "Documents" + "/" + path
    }
    
    final public func createDirectory(at path: String) throws {
        try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
    }
}
