//
//  ToastView.swift
//  SwiftUIToast
//
//  Created by Jonathan Benjamin on 14/12/2021.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ToastView: View {
    
    var options: ToastOptions
    
    @State private var isActive: Bool = true
    @State private var fadeInOut: Bool = true
    
    public init(options: ToastOptions) {
        self.options = options
    }
    
    public var body: some View {
        if isActive {
            VStack {
                if options.position == .bottom {
                    Spacer()
                }
                
                HStack {
                    if options.image != nil {
                        options.image
                            .padding([.leading, .top, .bottom])
                            .imageScale(.large)
                    }
                    
                    VStack {
                        Text(options.title)
                            .font(.headline)
                            .padding(.bottom, 0.1)
                            .padding([.leading, .trailing])
                        
                        if options.subtitle != nil {
                            Text(options.subtitle!)
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
                    if options.duration != nil {
                        withAnimation {
                            fadeInOut.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + options.duration!, execute: {
                            withAnimation {
                                dismissToast()
                            }
                        })
                    } else {
                        fadeInOut = false
                    }
                }
                .opacity(fadeInOut ? 0 : 1)
                .onTapGesture {
                    if options.dismissible {
                        dismissToast()
                    }
                }
                
                if options.position == .top {
                    Spacer()
                }
            }
        }
    }
    
    func dismissToast() {
        withAnimation {
            fadeInOut.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isActive = false
            })
        }
    }
}
