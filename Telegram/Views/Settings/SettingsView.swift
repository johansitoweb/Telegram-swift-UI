//
//  SettingsView.swift
//  Telegram
//
//  Created by Arseniy Tkachenko on 07.07.2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List{
            Section {
                HStack {
                    RoundedProfilePic("profilePic")
                        .frame(width: 32, height: 32)
                    Text("Account 1")
                }
                HStack {
                    RoundedProfilePic("profilePic")
                        .frame(width: 32, height: 32)
                    Text("Account 2")
                }
                
                HStack {
                    Image(systemName: "plus")
                        .frame(width: 32, height: 32)
                    Text("Add Account")
                }
                .foregroundColor(.blue)
            }
            
            Section {
                settingsListRow("Saved Messages", image: "bookmark.fill", color: .blue)
                settingsListRow("Recent Calls", image: "phone.fill", color: .green)
                settingsListRow("Devices", image: "laptopcomputer.and.iphone", color: .orange)
                settingsListRow("Chat Folders", image: "folder.fill", color: .cyan)
            }
            
            Section {
                settingsListRow("Notifications and Sounds", image: "bell.badge.fill", color: .red)
                settingsListRow("Privacy and Security", image: "lock.fill", color: .gray)
                settingsListRow("Data and Security", image: "square.stack.3d.up.fill", color: .green)
                settingsListRow("Appearance", image: "circle.lefthalf.filled", color: .cyan)
                settingsListRow("Language", image: "globe", color: .purple)
                settingsListRow("Stickers and Emojis", image: "face.smiling.fill", color: .orange)
            }
            
            Section {
                settingsListRow("Telegram Premium", image: "star.fill", color: .purple)
            }
            
            Section {
                settingsListRow("Telegram Premium", image: "applewatch", color: .gray)
            }
            
            Section {
                settingsListRow("Ask a Question", image: "ellipsis.bubble.fill", color: .orange)
                settingsListRow("Telegram FAQ", image: "questionmark.circle.fill", color: .cyan)
                settingsListRow("Telegram Features", image: "lightbulb.fill", color: .yellow)
            }
        }
    }
    
    func settingsListRow (_ label: String, image: String, color: Color) -> some View {
        NavigationLink {
            EmptyView()
        } label: {
            HStack {
                Image(systemName: image)
                    .foregroundColor(.white)
                    .frame(width: 28, height: 28)
                    .background(color)
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                Text(label)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
