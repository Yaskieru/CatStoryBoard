//
//  Cat.swift
//  CatStoryBoard
//
//  Created by Yasmin Almario on 04/08/2018.
//  Copyright © 2018 Yasmin Almario. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Cat: NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let totalLikes = "total_likes"
        static let updatedAt = "updated_at"
        static let slug = "slug"
        static let id = "id"
        static let createdAt = "created_at"
        static let descriptionValue = "description"
        static let optionStatusId = "option_status_id"
        static let title = "title"
        static let userId = "user_id"
        static let isLike = "is_like"
        static let catMedia = "cat_media"
    }
    
    // MARK: Properties
    public var totalLikes: String?
    public var updatedAt: String?
    public var slug: String?
    public var id: Int?
    public var createdAt: String?
    public var descriptionValue: String?
    public var optionStatusId: String?
    public var title: String?
    public var userId: String?
    public var isLike: [Any]?
    public var catMedia: [CatMedia]?
    
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
        totalLikes = json[SerializationKeys.totalLikes].string
        updatedAt = json[SerializationKeys.updatedAt].string
        slug = json[SerializationKeys.slug].string
        id = json[SerializationKeys.id].int
        createdAt = json[SerializationKeys.createdAt].string
        descriptionValue = json[SerializationKeys.descriptionValue].string
        optionStatusId = json[SerializationKeys.optionStatusId].string
        title = json[SerializationKeys.title].string
        userId = json[SerializationKeys.userId].string
        if let items = json[SerializationKeys.isLike].array { isLike = items.map { $0.object} }
        if let items = json[SerializationKeys.catMedia].array { catMedia = items.map { CatMedia(json: $0) } }
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = totalLikes { dictionary[SerializationKeys.totalLikes] = value }
        if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
        if let value = slug { dictionary[SerializationKeys.slug] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
        if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
        if let value = optionStatusId { dictionary[SerializationKeys.optionStatusId] = value }
        if let value = title { dictionary[SerializationKeys.title] = value }
        if let value = userId { dictionary[SerializationKeys.userId] = value }
        if let value = isLike { dictionary[SerializationKeys.isLike] = value }
        if let value = catMedia { dictionary[SerializationKeys.catMedia] = value.map { $0.dictionaryRepresentation() } }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.totalLikes = aDecoder.decodeObject(forKey: SerializationKeys.totalLikes) as? String
        self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
        self.slug = aDecoder.decodeObject(forKey: SerializationKeys.slug) as? String
        self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
        self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
        self.optionStatusId = aDecoder.decodeObject(forKey: SerializationKeys.optionStatusId) as? String
        self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
        self.userId = aDecoder.decodeObject(forKey: SerializationKeys.userId) as? String
        self.isLike = aDecoder.decodeObject(forKey: SerializationKeys.isLike) as? [Any]
        self.catMedia = aDecoder.decodeObject(forKey: SerializationKeys.catMedia) as? [CatMedia]
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(totalLikes, forKey: SerializationKeys.totalLikes)
        aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
        aCoder.encode(slug, forKey: SerializationKeys.slug)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
        aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
        aCoder.encode(optionStatusId, forKey: SerializationKeys.optionStatusId)
        aCoder.encode(title, forKey: SerializationKeys.title)
        aCoder.encode(userId, forKey: SerializationKeys.userId)
        aCoder.encode(isLike, forKey: SerializationKeys.isLike)
        aCoder.encode(catMedia, forKey: SerializationKeys.catMedia)
    }
    
}
