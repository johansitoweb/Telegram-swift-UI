//
//  ContactView.swift
//  Telegram
//
//  Created by Arseniy Tkachenko on 07.07.2022.
//

import SwiftUI
import Foundation

struct ContactRowView: View {
    private var contact: String
    private var lastOnline: String
    var body: some View {
        HStack {
            RoundedProfilePic("profilePic")
                .frame(width: 56, height: 56)
            VStack (alignment: .leading) {
                Text(contact)
                Text("last seen " + lastOnline)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .fontWeight(.light)
                Divider()
                    .background(Color(.darkGray))
            }
            .padding(.top, 5)
        }
    }
    
    init (contact: String, lastOnline: String) {
        self.contact = contact
        self.lastOnline = lastOnline
    }
}

struct ContactRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContactRowView(contact: "Arsenii Tkachenko", lastOnline: "2 hours ago")
    }
}
