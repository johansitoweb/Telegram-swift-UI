//
//  AddContactView.swift
//  Telegram
//
//  Created by Arseniy Tkachenko on 07.07.2022.
//

import SwiftUI
import Combine

struct AddContactView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var number = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Form {
                        VStack (alignment: .leading) {
                            HStack {
                                RoundedProfilePic("profilePic")
                                    .frame(width: 64, height: 64)
                                VStack {
                                    TextField(text: $firstName, prompt: Text("FirstName")) {
                                        Text("Username")
                                    }
                                    Divider()
                                    TextField(text: $lastName, prompt: Text("Last Name")) {
                                        Text("Password")
                                    }
                                    
                                }
                            }
                            .padding(.bottom, 50)
                            
                            VStack (alignment: .leading, spacing: 6) {
                                HStack  {
                                Image(systemName: "minus.circle.fill")
                                        .foregroundColor(.red)
                                    
                                Text("mobile")
                                        .font(.subheadline)
                                    Divider()
                                    TextField(text: $number, prompt: Text("+")) {
                                        Text("Number")
                                    }
                                }
                                .foregroundColor(.blue)
                                .padding(.bottom, 4)

                                Divider()
                                    .offset(x: 0, y: -5)
                                
                                HStack  {
                                Image(systemName: "plus.circle.fill")
                                    
                                Text("add phone")
                                        .font(.subheadline)
                                        .keyboardType(.numberPad)
                                        .onReceive(Just(number)) { newValue in
                                                        let filtered = newValue.filter { "+0123456789".contains($0) }
                                                        if filtered != newValue {
                                                            self.number = filtered
                                                        }
                                                }
                                }
                                .foregroundColor(.blue)
                            }
                        }
                    }
                    .padding(.top)
                }
            }
            .navigationTitle("New Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.blue)
                    }
                }
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button {

                    } label: {
                        Text("Create")
                            .foregroundColor(
                                ((firstName.isEmpty && lastName.isEmpty) || number.isEmpty) ? .gray : .blue
                            )
                    }
                }
            }
        }
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
