//
//  MainTabView.swift
//  Telegram
//
//  Created by Arseniy Tkachenko on 07.07.2022.
//

import SwiftUI

enum Tabs: String {
    case contacts
    case calls
    case chats
    case settings
    
    var navTabTitle: String {
        switch self {
        case .contacts: return "Contacts"
        case .calls: return "Calls"
        case .chats: return "Chats"
        case .settings: return "Settings"
        }
    }
}

struct MainTabView: View {
    @State private var selectedTab: Tabs = .settings
    @State private var showAddContact = false
    
    var body: some View {
        NavigationView {
            TabView (selection: $selectedTab) {
                ContactsView()
                    .onTapGesture {
                        self.selectedTab = .contacts
                    }
                    .tabItem {
                        tabLabel(imageName: "person.crop.circle.fill", label: Tabs.contacts.navTabTitle)
                    }
                    .tag(Tabs.contacts)
                
                CallsView()
                    .onTapGesture {
                        self.selectedTab = .calls
                    }
                    .tabItem {
                        tabLabel(imageName: "phone.fill", label: Tabs.calls.navTabTitle)
                    }
                    .tag(Tabs.calls)
                
                ChatsView()
                    .onTapGesture {
                        self.selectedTab = .chats
                    }
                    .tabItem {
                        tabLabel(imageName: "bubble.left.and.bubble.right.fill", label: Tabs.chats.navTabTitle)
                    }
                    .tag(Tabs.chats)
                
                SettingsView()
                    .onTapGesture {
                        self.selectedTab = .settings
                    }
                    .tabItem {
                        tabLabel(imageName: "gear", label: Tabs.settings.navTabTitle)
                    }
                    .tag(Tabs.settings)
            }
            .navigationTitle(selectedTab.navTabTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: ToolbarItemPlacement.navigationBarLeading) {
                    
                    switch selectedTab {
                    case .contacts: contactsSortButton
                    case .chats: chatsEditButton
                    case .calls: callsEditButton
                    case .settings: settingsQrButton
                    }
                }
                ToolbarItem (placement: ToolbarItemPlacement.navigationBarTrailing) {
                    switch selectedTab {
                    case .contacts: addContactsButton
                    case .chats: chatsNewMessageButton
                    case .calls: newCallButton
                    case .settings: settingsEditButton
                    }
                }
            }
        }
    }
    
    private func tabLabel (imageName: String, label: String) -> some View {
        VStack {
            Image(systemName: imageName)
            Text(label)
        }
    }
    
    var settingsEditButton: some View {
        NavigationLink {
            
            ProfileEditView()
        } label: {
            Text("Edit")
        }
    }
    
    
    var settingsQrButton: some View {
        Button {} label: {
            Image(systemName: "qrcode")
        }
    }
    
    var contactsSortButton: some View {
        Menu {
            Button {} label: {
                Text("by Last Seen")
            }
            Button {} label: {
                Text("by Name")
            }
        } label: {
            Text("Sort")
        }
    }
    
    var addContactsButton: some View {
        Button {
            showAddContact = true
        } label: {
            Image(systemName: "plus")
        }
        .popover(isPresented: $showAddContact) {
            AddContactView()
        }
    }
    
    var chatsEditButton: some View {
        Button {
            
        } label: {
            Text("Edit")
        }
    }
    
    var chatsNewMessageButton: some View {
        Button {
            
        } label: {
            Image(systemName: "square.and.pencil")
        }
    }
    
    var callsEditButton: some View {
        Button {
            
        } label: {
            Text("Edit")
        }
    }
    
    var newCallButton: some View {
        NavigationLink {
            
        } label: {
            Image(systemName: "phone.badge.plus")
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
