//
//  ChatRowView.swift
//  Telegram
//
//  Created by Arseniy Tkachenko on 08.07.2022.
//

import SwiftUI

struct ChatRowView: View {
    
    private var contact: String
    private var lastMessage: String
    private var lastMessageSent: String
    
    init (contact: String, lastMessage: String, lastMessageSent: String) {
        self.contact = contact
        self.lastMessage = lastMessage
        self.lastMessageSent = lastMessageSent
    }
    
    var body: some View {
        HStack {
            RoundedProfilePic("profilePic")
                .frame(width: 56.0, height: 56.0)
            
            HStack {
                VStack (alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(contact)
                                .foregroundColor(.black)
                            
                            Text(lastMessage)
                                .foregroundColor(.gray)
                                .font(.subheadline)
                                .fontWeight(.light)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                            
                        }
                        Spacer()
                        unreadMessagesCounter(2)
                    }
                    Divider()
                        .background(Color(.darkGray))
                }
                .padding(.top, 5)
            }
        }
    }
    
    func unreadMessagesCounter(_ counter: Int) -> some View {
        VStack {
            Text(lastMessageSent)
                .foregroundColor(.gray)
                .font(.subheadline)
                .fontWeight(.light)
                .padding(.trailing)
            
            Text(String(counter))
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
        }
    }
    
}

struct ChatRowView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRowView(contact: "Arsenii Tkachenko",
                    lastMessage: "Despite making up to 13% of the population blacks commit 52% of all crimes in United States of Amurica",
                    lastMessageSent: "13.06")
    }
}
