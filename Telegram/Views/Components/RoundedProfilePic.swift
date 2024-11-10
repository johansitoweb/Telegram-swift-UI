//
//  RoundedProfilePic.swift
//  Telegram
//
//  Created by Arseniy Tkachenko on 11.07.2022.
//

import SwiftUI

struct RoundedProfilePic: View {
    
    private var profilePic: String
    
    init (_ profilePic: String) {
        self.profilePic = profilePic
    }
    
    var body: some View {
        Image(profilePic)
            .resizable()
            .clipShape(Circle())
    }
}

struct RoundedProfilePic_Previews: PreviewProvider {
    static var previews: some View {
        RoundedProfilePic("profilePic")
    }
}
