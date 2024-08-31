# RCache

[<img src="https://miro.medium.com/v2/resize:fit:1400/format:webp/1*u0_gV4O14C-W9Bo1CfoeQA@2x.jpeg" alt="cocoapods logo" height="20">](https://cocoapods.org/pods/RCache)
[<img src="https://miro.medium.com/v2/resize:fit:1400/format:webp/1*HE7reiQOYfkf_MXCQ4v_NQ.png" alt="pub logo" height="20">](https://github.com/rahmat3nanda/RCache-Swift)

RCache is a Swift library designed to simplify the process of storing data in `UserDefaults` and `Keychain`. It provides a straightforward API for securely and conveniently managing user data.

## Features

- **UserDefaults Storage**: Easy-to-use methods for storing and retrieving data from `UserDefaults`.
- **Keychain Storage**: Secure storage for sensitive data using Keychain.
- **Swift Package Manager (SPM) Support**: Easily integrate with your Swift projects using SPM.
- **CocoaPods Support**: Also available through CocoaPods for flexible integration.

## Installation
### Swift Package Manager (SPM)

#### Option 1: Using Xcode UI

1. In Xcode, go to File > Add Packages...
2. Enter: `https://github.com/rahmat3nanda/RCache-Swift.git`
3. Select the desired version/branch
4. Choose your target(s)
5. Click "Add Package"

#### Option 2: Using Package.swift

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/rahmat3nanda/RCache-Swift.git", .upToNextMajor(from: "1.0.2"))
]
```

Then, include "Installations" as a dependency for your target:

```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(name: "RCache", package: "RCache"),
        ]),
]
```

### CocoaPods

1. Add to your `Podfile`:
   ```ruby
   pod 'RCache', '~> 1.0.2'
   ```

2. Run:
   ```shell
   $ pod install
   ```

3. Use the generated `.xcworkspace` file.

## Usage

You can check DemoApp [here](https://github.com/rahmat3nanda/RCache-Swift-Demo-App.git)

### General Storage

#### Save Variable to General Storage

```swift
import RCache

// save Data to General Storage
RCache.common.save(data: Data(), key: RCache.Key("data"))

// save YourModelExtendCodable to General Storage
RCache.common.save(value: YourModelExtendCodable(), key: RCache.Key("model"))

// save String to General Storage
RCache.common.save(string: "String", key: RCache.Key("string"))

// save Bool to General Storage
RCache.common.save(bool: true, key: RCache.Key("bool"))

// save Integer to General Storage
RCache.common.save(integer: 101, key: RCache.Key("integer"))

// save Array to General Storage
RCache.common.save(array: [101, "string", true], key: RCache.Key("array"))

// save Dictionary to General Storage
RCache.common.save(dictionary: ["bool": true, "integer": 101], key: RCache.Key("dictionary"))

// save Double to General Storage
RCache.common.save(double: 2.0, key: RCache.Key("double"))

// save Float to General Storage
RCache.common.save(float: 3.01, key: RCache.Key("float"))
```

#### Read Variable from General Storage

```swift
import RCache

// read Data from General Storage
RCache.common.readData(key: RCache.Key("data"))

// read YourModelExtendCodable from General Storage
RCache.common.read(type: YourModelExtendCodable.self, key: RCache.Key("model"))

// read String from General Storage
RCache.common.readString(key: RCache.Key("string"))

// read Bool from General Storage
RCache.common.readBool(key: RCache.Key("bool"))

// read Integer from General Storage
RCache.common.readInteger(key: RCache.Key("integer"))

// read Array from General Storage
RCache.common.readArray(key: RCache.Key("array"))

// read Dictionary from General Storage
RCache.common.readDictionary(key: RCache.Key("dictionary"))

// read Double from General Storage
RCache.common.readDouble(key: RCache.Key("double"))

// read Float from General Storage
RCache.common.readFloat(key: RCache.Key("float"))
```

#### Remove Variable from General Storage
```swift
import RCache

// remove from General Storage
RCache.common.remove(key: RCache.Key("myKey"))
```

#### Clear General Storage
```swift
import RCache

// Clear General Storage
RCache.common.clear()
```

### Credentials Storage

#### Save Variable to Credentials Storage

```swift
import RCache

// save Data to Credentials Storage
RCache.credentials.save(data: Data(), key: RCache.Key("data"))

// save YourModelExtendCodable to Credentials Storage
RCache.credentials.save(value: YourModelExtendCodable(), key: RCache.Key("model"))

// save String to Credentials Storage
RCache.credentials.save(string: "String", key: RCache.Key("string"))

// save Bool to Credentials Storage
RCache.credentials.save(bool: true, key: RCache.Key("bool"))

// save Integer to Credentials Storage
RCache.credentials.save(integer: 101, key: RCache.Key("integer"))

// save Array to Credentials Storage
RCache.credentials.save(array: [101, "string", true], key: RCache.Key("array"))

// save Dictionary to Credentials Storage
RCache.credentials.save(dictionary: ["bool": true, "integer": 101], key: RCache.Key("dictionary"))

// save Double to Credentials Storage
RCache.credentials.save(double: 2.0, key: RCache.Key("double"))

// save Float to Credentials Storage
RCache.credentials.save(float: 3.01, key: RCache.Key("float"))
```

#### Read Variable from Credentials Storage

```swift
import RCache

// read Data from Credentials Storage
RCache.credentials.readData(key: RCache.Key("data"))

// read YourModelExtendCodable from Credentials Storage
RCache.credentials.read(type: YourModelExtendCodable.self, key: RCache.Key("model"))

// read String from Credentials Storage
RCache.credentials.readString(key: RCache.Key("string"))

// read Bool from Credentials Storage
RCache.credentials.readBool(key: RCache.Key("bool"))

// read Integer from Credentials Storage
RCache.credentials.readInteger(key: RCache.Key("integer"))

// read Array from Credentials Storage
RCache.credentials.readArray(key: RCache.Key("array"))

// read Dictionary from Credentials Storage
RCache.credentials.readDictionary(key: RCache.Key("dictionary"))

// read Double from Credentials Storage
RCache.credentials.readDouble(key: RCache.Key("double"))

// read Float from Credentials Storage
RCache.credentials.readFloat(key: RCache.Key("float"))
```

#### Remove Variable from Credentials Storage
```swift
import RCache

// remove from Credentials Storage
RCache.credentials.remove(key: RCache.Key("myKey"))
```

#### Clear Credentials Storage
```swift
import RCache

// Clear Credentials Storage
RCache.credentials.clear()
```

### Clear All Variable from General Storage & Credentials Storage
```swift
import RCache

// Clear All Variable from General Storage & Credentials Storage
RCache.clear()
```

### Define your own Key
```swift
extension RCache.Key {
   static let myKey = RCache.Key("myKey")
}
```

## License
RCache is released under the MIT License. See the [LICENSE](https://github.com/rahmat3nanda/RCache-Swift?tab=MIT-1-ov-file) file for details.

## Contact
For any questions or feedback, feel free to reach out to [rahmat3nanda@gmail.com](mailto:rahmat3nanda@gmail.com) or [My LinkedIn](https://www.linkedin.com/in/rahmat-trinanda/).