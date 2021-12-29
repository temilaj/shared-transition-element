//
//  ContentView.swift
//  SharedElementTransitions
//
//  Created by Temi Lajumoke on 12/28/21.
//

import SwiftUI

struct ContentView: View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                VStack {
                    
                    Spacer()
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Header Text")
                            .font(.largeTitle.weight(.bold))
                            .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("20 sections - 3 hours".uppercased())
                            .font(.footnote.weight(.semibold))
                            .matchedGeometryEffect(id: "subtitle", in: namespace)
                        
                        Text("iPhone app for iOS 15 with custom layouts, animations, transitions, and ...")
                            .font(.footnote)
                            .matchedGeometryEffect(id: "description", in: namespace)
                    }
                    .padding(20)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .blur(radius: 30)
                            .matchedGeometryEffect(id: "blur", in: namespace)
                    )
                    
                }
                .foregroundStyle(.white)
                .background(
                    Image("Illustration")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "image", in: namespace)
                )
                .background(
                    Image("BackgroundImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .matchedGeometryEffect(id: "mask", in: namespace)
                )
                .frame(height: 300)
                .padding(20)
            } else {
                ScrollView {
                    VStack {
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 500)
                    .foregroundStyle(.black)
                    .background(
                        Image("Illustration")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .matchedGeometryEffect(id: "image", in: namespace)
                    )
                    .background(
                        Image("BackgroundImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: "background", in: namespace)
                    )
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .matchedGeometryEffect(id: "mask", in: namespace)
                    )
                    .overlay {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Header Text")
                                .font(.largeTitle.weight(.bold))
                                .matchedGeometryEffect(id: "title", in: namespace)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("20 sections - 3 hours".uppercased())
                                .font(.footnote.weight(.semibold))
                                .matchedGeometryEffect(id: "subtitle", in: namespace)
                            
                            
                            Text("iPhone app for iOS 15 with custom layouts, animations, transitions, and ...")
                                .font(.footnote)
                                .matchedGeometryEffect(id: "description", in: namespace)
                            
                            Divider()
                            HStack {
                                Image("profile")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .cornerRadius(10)
                                    .padding(8)
                                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                                
                                Text("Styled by Temi")
                                    .font(.footnote)
                            }
                        }
                        .padding(20)
                        .background(
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .matchedGeometryEffect(id: "blur", in: namespace)
                        )
                        .offset(y: 250)
                        .padding(20)
                    }
                }
            }
        }.onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
