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
   ```
   $ pod install
   ```

3. Use the generated `.xcworkspace` file.

## Usage

RCache saves data to UserDefaults and Keychain
```
import RCache

// save/load UserDefaults data
RCache.common

// save/load Keychain data
RCache.credentials
```



Define your own Key
```
extension RCache.Key {
    static let myKey = RCache.Key("myKey")
}
```

## License
RCache is released under the MIT License. See the [LICENSE](https://github.com/rahmat3nanda/RCache-Swift?tab=MIT-1-ov-file) file for details.

## Contact
For any questions or feedback, feel free to reach out to [rahmat3nanda@gmail.com](mailto:rahmat3nanda@gmail.com) or [My LinkedIn](https://www.linkedin.com/in/rahmat-trinanda/).