//
//  ChatView.swift
//  Telegram
//
//  Created by Arseniy Tkachenko on 08.07.2022.
//

import SwiftUI

struct ChatView: View {
    
    private var contact: String
    
    @State private var showProfilePopover = false
    @State private var messageText = ""
    
    @Environment(\.presentationMode) var presentationMode
    @State var uiTabarController: UITabBarController?
    
    var body: some View {
        VStack {
            ScrollView {
                messages
                    .padding(.vertical)
            }
            messageField
        }
        .navigationTitle(contact)
        .toolbar {
            ToolbarItem (placement: ToolbarItemPlacement.navigationBarTrailing) {
                NavigationLink {
                    ProfileView(contact: "Arsenii Tkachenko", lastSeen: "two hours ago")
                } label: {
                    RoundedProfilePic("profilePic")
                        .frame(width: 36, height: 36)
                }
            }
        }
    }
    
    init (contact: String) {
        self.contact = contact
    }
    
    var messages: some View {
        VStack {
            ForEach(0...4, id: \.self) { _ in
                ChatBubble(direction: .left) {
                    Text("Hello!")
                        .padding(.all, 16)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                }
                ChatBubble(direction: .right) {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ut semper quam. Phasellus non mauris sem. Donec sed fermentum eros. Donec pretium nec turpis a semper. ")
                        .padding(.all, 16)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                }
            }
        }
    }
    
    var messageField: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "paperclip")
                    .foregroundColor(.gray)
                    .frame(width: 36, height: 36)
            }
            
            TextField("Message", text: $messageText)
                .padding(4)
                .padding(.horizontal, 10)
                .overlay(Capsule().stroke(Color.gray, lineWidth: 1))
            
            
            Button {
                
            } label: {
                Image(systemName: "mic")
                    .foregroundColor(.gray)
                    .frame(width: 36, height: 36)
                
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(contact: "Arsenii Tkachenko")
    }
}
