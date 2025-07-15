# SnapUI

[![CI Status](https://img.shields.io/travis/FullStack-Jian/SnapUI.svg?style=flat)](https://travis-ci.org/FullStack-Jian/SnapUI)
[![Version](https://img.shields.io/cocoapods/v/SnapUI.svg?style=flat)](https://cocoapods.org/pods/SnapUI)
[![License](https://img.shields.io/cocoapods/l/SnapUI.svg?style=flat)](https://cocoapods.org/pods/SnapUI)
[![Platform](https://img.shields.io/cocoapods/p/SnapUI.svg?style=flat)](https://cocoapods.org/pods/SnapUI)

## Example

```
                // eg: 1
        let temp = UIView()
        temp.backgroundColor = .cyan
        temp.add(to: view)
            .margins(.unbottom)
            .height(120)
        
        // eg: 2
        let temp2 = UIView()
        temp2.backgroundColor = .red
        view.addSubview(temp2)
        temp2.lyt.size(100)
            .top(by: temp.lyt.bottom)
```

## Requirements

## Installation

SnapUI is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby

pod 'SnapUI'
```

## Author

承轩：develop-git@users.noreply.github.com

## License

SnapUI is available under the MIT license. See the LICENSE file for more info.
