import XCTest
@testable import RCache

final class RCacheTests: XCTestCase {
    func testExample() throws {
        testCommon()
        testCredentials()
    }
}

// MARK: - Common
extension RCacheTests {
    func testCommon() {
        let values = Values(
            data: "RCache-common".data(using: .utf8) ?? Data(),
            string: "RCache-common",
            bool: false,
            int: 1,
            array: [1, "b", true],
            dictionary: ["a": 1, "b": 2],
            double: 12.123,
            float: 15.554,
            codable: TestModel(title: "RCache-common", boolean: false)
        )
        
        RCache.common.save(data: values.data, key: .data)
        RCache.common.save(string: values.string, key: .string)
        RCache.common.save(bool: values.bool, key: .bool)
        RCache.common.save(integer: values.int, key: .int)
        RCache.common.save(array: values.array, key: .array)
        RCache.common.save(dictionary: values.dictionary, key: .dictionary)
        RCache.common.save(double: values.double, key: .double)
        RCache.common.save(float: values.float, key: .float)
        try? RCache.common.save(value: values.codable, key: .codable)
        
        XCTAssertEqual(values.data, RCache.common.readData(key: .data), "Common data match")
        XCTAssertEqual(values.string, RCache.common.readString(key: .string), "Common string match")
        XCTAssertEqual(values.bool, RCache.common.readBool(key: .bool), "Common bool match")
        XCTAssertEqual(values.int, RCache.common.readInteger(key: .int), "Common int match")
        XCTAssertEqual(values.array.count, RCache.common.readArray(key: .array)?.count, "Common array match")
        XCTAssertEqual(values.dictionary.count, RCache.common.readDictionary(key: .dictionary)?.count, "Common dictionary match")
        XCTAssertEqual(values.double, RCache.common.readDouble(key: .double), "Common double match")
        XCTAssertEqual(values.float, RCache.common.readFloat(key: .float), "Common float match")
        XCTAssertEqual((values.codable as? TestModel)?.title, try? RCache.common.read(type: TestModel.self, key: .codable)?.title, "Common codable match")
    }
}

// MARK: - Credentials
extension RCacheTests {
    func testCredentials() {
        let values = Values(
            data: "RCache-credentials".data(using: .utf8) ?? Data(),
            string: "RCache-credentials",
            bool: false,
            int: 1,
            array: [1, "b", true],
            dictionary: ["a": 1, "b": 2],
            double: 12.123,
            float: 15.554,
            codable: TestModel(title: "RCache-credentials", boolean: false)
        )
        
        RCache.credentials.save(data: values.data, key: .data)
        RCache.credentials.save(string: values.string, key: .string)
        RCache.credentials.save(bool: values.bool, key: .bool)
        RCache.credentials.save(integer: values.int, key: .int)
        RCache.credentials.save(array: values.array, key: .array)
        RCache.credentials.save(dictionary: values.dictionary, key: .dictionary)
        RCache.credentials.save(double: values.double, key: .double)
        RCache.credentials.save(float: values.float, key: .float)
        try? RCache.credentials.save(value: values.codable, key: .codable)
        
        XCTAssertEqual(values.data, RCache.credentials.readData(key: .data), "Credentials data match")
        XCTAssertEqual(values.string, RCache.credentials.readString(key: .string), "Credentials string match")
        XCTAssertEqual(values.bool, RCache.credentials.readBool(key: .bool), "Credentials bool match")
        XCTAssertEqual(values.int, RCache.credentials.readInteger(key: .int), "Credentials int match")
        XCTAssertEqual(values.array.count, RCache.credentials.readArray(key: .array)?.count, "Credentials array match")
        XCTAssertEqual(values.dictionary.count, RCache.credentials.readDictionary(key: .dictionary)?.count, "Credentials dictionary match")
        XCTAssertEqual(values.double, RCache.credentials.readDouble(key: .double), "Credentials double match")
        XCTAssertEqual(values.float, RCache.credentials.readFloat(key: .float), "Credentials float match")
        XCTAssertEqual((values.codable as? TestModel)?.title, try? RCache.credentials.read(type: TestModel.self, key: .codable)?.title, "Credentials codable match")
    }
}

// MARK: - Key
extension RCache.Key {
    static let data = RCache.Key("data")
    static let string = RCache.Key("string")
    static let bool = RCache.Key("bool")
    static let int = RCache.Key("int")
    static let array = RCache.Key("array")
    static let dictionary = RCache.Key("dictionary")
    static let double = RCache.Key("double")
    static let float = RCache.Key("float")
    static let codable = RCache.Key("codable")
}

// MARK: Test Model
struct TestModel: Codable {
    let title: String
    let boolean: Bool
    
    init(title: String, boolean: Bool) {
        self.title = title
        self.boolean = boolean
    }
    
    static func == (lhs: TestModel, rhs: TestModel) -> Bool {
        return lhs.title == rhs.title
    }
}

// MARK: - Values Model
struct Values {
    let data: Data
    let string: String
    let bool: Bool
    let int: Int
    let array: [Any]
    let dictionary: Dictionary<String, Any>
    let double: Double
    let float: Float
    let codable: Codable
    
    init(data: Data, string: String, bool: Bool, int: Int, array: [Any], dictionary: Dictionary<String, Any>, double: Double, float: Float, codable: Codable) {
        self.data = data
        self.string = string
        self.bool = bool
        self.int = int
        self.array = array
        self.dictionary = dictionary
        self.double = double
        self.float = float
        self.codable = codable
    }
}
