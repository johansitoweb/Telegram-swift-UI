//
//  ContactsView.swift
//  Telegram
//
//  Created by Arseniy Tkachenko on 07.07.2022.
//

import SwiftUI

struct ContactsView: View {

    var body: some View {
        ScrollView {
            ForEach(0...15, id: \.self) { contact in
                ContactRowView(contact: "Arsenii Tkachenko", lastOnline: "2 hours ago")
                
            }
        }
        .padding(.leading)
    }
}


struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
