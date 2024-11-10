//
//  ProfileView.swift
//  Telegram
//
//  Created by Arseniy Tkachenko on 09.07.2022.
//

import SwiftUI

struct ProfileView: View {
    
    private var contact: String
    private var lastSeen: String
    
    @State private var selectedMediaType: ChatMediaFilterViewModel = .media
    @Namespace var animation
    
    init (contact: String, lastSeen: String) {
        self.contact = contact
        self.lastSeen = lastSeen
    }
    
    private func adaptiveItemGrid (width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    var body: some View {
        VStack{
            headerInfo
            
            HStack (spacing: 8) {
                actionButton(imageName: "phone.fill", label: "call")
                actionButton(imageName: "video.fill", label: "video")
                actionButton(imageName: "bell.fill", label: "mute")
                actionButton(imageName: "magnifyingglass", label: "search")
                actionButton(imageName: "ellipsis", label: "more")
            }
            
            userInfo
            
            mediaFilterBar
                .padding(.top)
                .background(.white)
            
            Spacer()
        }
        .background(Color(red: (239/255), green: (238/255), blue: (243/255)))
        .ignoresSafeArea()
    }
    
    var headerInfo: some View {
        ZStack (alignment: .bottomLeading) {
            Image("profilePic")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack (alignment: .leading){
                Text(contact)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text("last seen " + lastSeen)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
            .foregroundColor(.white)
        }
    }
    
    var userInfo: some View {
        VStack (alignment: .leading) {
            VStack (alignment: .leading) {
                Text("mobile")
                    .font(.subheadline)
                Text("+380 98 069 9498")
                    .foregroundColor(.blue)
            }
            Divider()
            HStack {
                VStack (alignment: .leading) {
                    Text("username")
                        .font(.subheadline)
                    Text("@inhix")
                        .foregroundColor(.blue)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "qrcode")
                        .font(.title2)
                }
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding()
    }
    
    var mediaFilterBar: some View {
        HStack {
            ForEach(ChatMediaFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .foregroundColor(selectedMediaType == item ? .blue : .gray)
                    if selectedMediaType == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height:3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height:3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedMediaType = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
        .padding(.horizontal)
    }
    
    private func actionButton (imageName: String, label: String) -> some View {
        Button {
        } label: {
            VStack{
                Image(systemName: imageName)
                    .font(.title2)
                    .frame(width: 40, height: 40)
                Text(label)
                    .font(.caption)
                    .fontWeight(.thin)
            }
            .padding()
            .background()
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(contact: "Arsenii Tkachenko", lastSeen: "two hours ago")
    }
}
