//
//  Terms&ConditionsView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct Terms_ConditionsView: View {
    var body: some View {
        VStack {
            Text("Terms & Conditions")
                .font(.title2)
                .bold()
                .fontDesign(.monospaced)
            
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam magna diam, ornare eget iaculis id, sagittis ut lectus. Donec sit amet mauris ac ligula elementum interdum. Ut id turpis vel ex viverra mattis. Vestibulum a elit imperdiet tellus tempus auctor ut id mauris. Integer nisi sapien, elementum eu metus et, dictum finibus odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec finibus nisi eu dui condimentum luctus.Aenean ut nisi aliquet, blandit velit aliquet, congue ex. Aenean at ligula vitae nisl laoreet finibus. Integer velit lacus, congue ac felis sed, egestas dictum turpis. In non semper mi, sit amet venenatis est. Integer blandit sem quis lacus accumsan, at fermentum quam efficitur. Etiam vel massa nec neque gravida mattis ut in eros. sed a mi. Ut nec interdum nibh. Nunc aliquet risus urna, non tincidunt eros dapibus eu. Phasellus venenatis diam augue.")
                .multilineTextAlignment(.center)
                .padding(.top)

            Spacer()
        }
        .padding()

    }
}

#Preview {
    Terms_ConditionsView()
}
