//
//  ToastView.swift
//  SwiftUIToast
//
//  Created by Jonathan Benjamin on 14/12/2021.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ToastView: View {
    
    var image: Image?
    var title: String
    var subtitle: String?
    var position: ToastPosition
    var duration: Double?
    
    @State private var isActive: Bool = true
    @State private var fadeInOut: Bool = true
    
    public init(image: Image? = nil,
                title: String,
                subtitle: String? = nil,
                position: ToastPosition,
                duration: Double? = nil) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.position = position
        self.duration = duration
    }
    
    public var body: some View {
        if isActive {
            VStack {
                if position == .bottom {
                    Spacer()
                }
                
                HStack {
                    if image != nil {
                        image
                            .padding([.leading, .top, .bottom])
                            .imageScale(.large)
                    }
                    
                    VStack {
                        Text(title)
                            .font(.headline)
                            .padding(.bottom, 0.1)
                            .padding([.leading, .trailing])
                        
                        if subtitle != nil {
                            Text(subtitle!)
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(.secondary)
                                .padding([.leading, .trailing])
                        }
                    }
                }
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(Capsule())
                .shadow(radius: 5)
                .padding()
                .onAppear {
                    if duration != nil {
                        withAnimation {
                            fadeInOut.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration!, execute: {
                            withAnimation {
                                fadeInOut.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                    isActive = false
                                })
                            }
                        })
                    } else {
                        fadeInOut = false
                    }
                }
                .opacity(fadeInOut ? 0 : 1)
                
                if position == .top {
                    Spacer()
                }
            }
        }
    }
}
