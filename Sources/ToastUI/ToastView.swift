//
//  ToastView.swift
//  ToastUI
//
//  Created by Jonathan Benjamin on 14/12/2021.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ToasterView: View {
    
    var symbol: String?
    var title: String
    var subtitle: String?
    var position: ToastPosition
    @State var duration: Double?
    
    @State private var isActive: Bool = true
    @State private var fadeInOut: Bool = true
    
    public var body: some View {
        if isActive {
            VStack {
                if position == .bottom {
                    Spacer()
                }
                
                HStack {
                    if symbol != nil {
                        Image(systemName: symbol!)
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
                                .padding(.trailing)
                        }
                    }
                }
                .background(Color(UIColor.systemBackground))
                .clipShape(Capsule())
                .shadow(radius: 7)
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
