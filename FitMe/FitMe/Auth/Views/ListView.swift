//
//  ListView.swift
//  FitMe
//
//  Created by Gairuka Bandara on 2024-11-12.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var authdataManager: AuthDataManager
    
    var body: some View {
        NavigationView {
            List(authdataManager.user, id: \.id) { usr in
                Text(usr.name)
            }
            .navigationTitle("Users")
            .navigationBarItems(trailing: Button(action: {
                
            }, label: {
                Image(systemName: "plus")
            }))
        }
    }
}

#Preview {
    ListView()
}
