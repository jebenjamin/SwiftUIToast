# SwiftUIToast

![](https://img.shields.io/github/license/jebenjamin/ToastUI)

A package for displaying sleek iOS-style toast notifications with SwiftUI. It's intended to mimic the toasts seen when charging an Apple Pencil or connecting AirPods.

## Examples
<img src="Examples.jpg">

## Setup

### Swift Package Manager
SwiftUIToast is a Swift package that can be installed through the 'Package Dependencies' list in your Xcode project. Or, you can add the following line to your own Package.swift file:
```swift
dependencies: [
    .package(url: "https://github.com/jebenjamin/SwiftUIToast", from: "1.0.1")
]
```

### CocoaPods
Add the following line to your `PodFile`:
```ruby
pod 'SwiftUIToast'
```

### Manually
Drag and drop the `SwiftUIToast` folder into your project.

## Usage
SwiftUIToast is built for SwiftUI. Use a `ZStack` to layer a `ToastView` on top of the view you want to display a toast for. Like so:
```swift
ZStack {
    ToastView(
        title: "Title",
        subtitle: "Subtitle",
        position: .top,
        duration: 5)
    
    Text("Placeholder")
    // and some other views...
}
```
Once the toast fades out, the view is removed from the hierarchy.
The view automatically adapts to the current color scheme (light or dark mode).

## Options
- `image`: A SwiftUI `Image` displayed on the left side of the toast. Optional.
- `title`: A title string that will be displayed at the top of the toast. Required.
- `subtitle`: A subtitle string that will be displayed at the bottom of the toast. Optional.
- `position`: `.top` places the toast at the top of the stack, `.bottom` places it at the bottom. Required.
- `duration`: A double referring to the number of seconds the toast is displayed. Optional. If empty, the toast will remain fixed in position for the lifecycle of the view. Otherwise, it will fade out once the duration has elapsed.

## Compatibility
Requires iOS 13.0+ or Mac Catalyst 13.0+. 

## License
SwiftUIToast uses the MIT license. A copy is available in `LICENSE`.
