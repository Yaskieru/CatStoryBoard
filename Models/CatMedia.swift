//
//  CatMedia.swift
//  CatStoryBoard
//
//  Created by Yasmin Almario on 04/08/2018.
//  Copyright © 2018 Yasmin Almario. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CatMedia: NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let height = "height"
        static let path = "path"
        static let id = "id"
        static let catPostId = "cat_post_id"
        static let updatedAt = "updated_at"
        static let fileExtension = "file_extension"
        static let createdAt = "created_at"
        static let width = "width"
        static let isPrimary = "is_primary"
        static let fileName = "file_name"
    }
    
    // MARK: Properties
    public var height: String?
    public var path: String?
    public var id: Int?
    public var catPostId: String?
    public var updatedAt: String?
    public var fileExtension: String?
    public var createdAt: String?
    public var width: String?
    public var isPrimary: String?
    public var fileName: String?
    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public required init(json: JSON) {
        height = json[SerializationKeys.height].string
        path = json[SerializationKeys.path].string
        id = json[SerializationKeys.id].int
        catPostId = json[SerializationKeys.catPostId].string
        updatedAt = json[SerializationKeys.updatedAt].string
        fileExtension = json[SerializationKeys.fileExtension].string
        createdAt = json[SerializationKeys.createdAt].string
        width = json[SerializationKeys.width].string
        isPrimary = json[SerializationKeys.isPrimary].string
        fileName = json[SerializationKeys.fileName].string
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = height { dictionary[SerializationKeys.height] = value }
        if let value = path { dictionary[SerializationKeys.path] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = catPostId { dictionary[SerializationKeys.catPostId] = value }
        if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
        if let value = fileExtension { dictionary[SerializationKeys.fileExtension] = value }
        if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
        if let value = width { dictionary[SerializationKeys.width] = value }
        if let value = isPrimary { dictionary[SerializationKeys.isPrimary] = value }
        if let value = fileName { dictionary[SerializationKeys.fileName] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.height = aDecoder.decodeObject(forKey: SerializationKeys.height) as? String
        self.path = aDecoder.decodeObject(forKey: SerializationKeys.path) as? String
        self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        self.catPostId = aDecoder.decodeObject(forKey: SerializationKeys.catPostId) as? String
        self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
        self.fileExtension = aDecoder.decodeObject(forKey: SerializationKeys.fileExtension) as? String
        self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
        self.width = aDecoder.decodeObject(forKey: SerializationKeys.width) as? String
        self.isPrimary = aDecoder.decodeObject(forKey: SerializationKeys.isPrimary) as? String
        self.fileName = aDecoder.decodeObject(forKey: SerializationKeys.fileName) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(height, forKey: SerializationKeys.height)
        aCoder.encode(path, forKey: SerializationKeys.path)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(catPostId, forKey: SerializationKeys.catPostId)
        aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
        aCoder.encode(fileExtension, forKey: SerializationKeys.fileExtension)
        aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
        aCoder.encode(width, forKey: SerializationKeys.width)
        aCoder.encode(isPrimary, forKey: SerializationKeys.isPrimary)
        aCoder.encode(fileName, forKey: SerializationKeys.fileName)
    }
    
}

