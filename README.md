
LoadIndicatorManager
========
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

**LoadIndicatorManager** is a loading-indicator lifecycle manager. This manager allow to show  any loading-indicator on the screen or your selected view. If you call `show` multiple times, then only one indicator will appear in the same view.

### Installation
- _[Carthage](https://github.com/Carthage/Carthage)_

```
github "Allui/LoadIndicatorManager" == 1.0.0
```

---
### Usage
```swift
{
    import LoadingKit
    ...
    // Configure manager with your awesome loading-indicator that implements "Loader" protocol
    LoadingIndicatorManager.configure(with: AwesomeLoader.self)
    ...
    // Call "show" to present your indicator on the screen
    let activity = LoadingIndicatorManager.show()
    
    // Call "dispose" of saved "activity" to hide indicator
    // While "activity" is alive indicator isn't going to disappear.
    activity.dispose()
}
```
---

## Licence

This code and tool is under the MIT Licence. See the `LICENCE` file in this repository.