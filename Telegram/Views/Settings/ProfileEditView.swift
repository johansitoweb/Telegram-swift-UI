//
//  ProfileEditView.swift
//  Telegram
//
//  Created by Arseniy Tkachenko on 12.07.2022.
//

import SwiftUI

struct ProfileEditView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var bio = ""
    
    var body: some View {
        VStack {
            RoundedProfilePic("profilePic")
                .frame(width: 120, height: 120)
            
            setNewProfilePicButton
            
            Form {
                Section (footer: Text("Enter your name and add an optional photo or video.")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }
                
                Section (footer: Text("Any details such as age, occupation or city. Example: 23 y.o. designer from San Francisco.")) {
                    TextField("Bio", text: $bio)
                }
                
                Section {
                    NavigationLink {} label: {
                        Text("Change Number")
                        Spacer()
                            .frame(maxWidth: 56)
                        Text("+380 98 069 9498")
                    }
                    NavigationLink {} label: {
                        Text("Username")
                        Spacer()
                        Text("@inhix")
                    }
                }
                Section (footer: Text("You can connect multiple accounts with different phone numbers.")) {
                    Button{} label: {
                        HStack {
                            Spacer()
                            Text("Add Another Account")
                            Spacer()
                        }
                    }
                }
                
                Section {
                    Button{} label: {
                        HStack {
                            Spacer()
                            Text("Log Out")
                                .foregroundColor(.red)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
        
        var setNewProfilePicButton: some View {
            Button {
                
            } label: {
                Text("Set New Photo or Video")
            }
        }
    }
    
    struct ProfileEditView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileEditView()
        }
    }
