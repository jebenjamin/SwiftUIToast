//
//  ToastOptions.swift
//  SwiftUIToast
//
//  Created by Jonathan Benjamin on 6/2/2022.
//

import Foundation
import SwiftUI

public struct ToastOptions {
    let image: Image?
    let title: String
    let subtitle: String?
    let position: ToastPosition
    let duration: Double?
    let dismissible: Bool
    
    /// An object that holds settings for a ToastView.
    ///
    ///  - Parameters:
    ///    - image: The image to display on the left-hand side of the ToastView. Optional.
    ///    - title: The primary string to display on the ToastView.
    ///    - subtitle: The secondary string to display on the ToastView. Optional.
    ///    - position: A `ToastPosition` object that corresponds with the location of the toast on the parent view.
    ///    - duration: The time in seconds to display the ToastView before fading away. Optional. If nil, the ToastView will appear indefinitely.
    ///    - dismissable: If true, the ToastView will fade away when tapped.
    init(
        image: Image? = nil,
        title: String,
        subtitle: String? = nil,
        position: ToastPosition,
        duration: Double? = nil,
        dismissible: Bool
    ) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.position = position
        self.duration = duration
        self.dismissible = dismissible
    }
}
