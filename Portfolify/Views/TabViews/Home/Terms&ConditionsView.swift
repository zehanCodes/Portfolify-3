//
//  Terms&ConditionsView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct Terms_ConditionsView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Terms & Conditions")
                    .font(.title2)
                    .bold()
                    .fontDesign(.monospaced)
                
                
                Text("""
These Terms of Service govern your access to and use of Portfolify, including any content, functionality, and services offered on or through the App.

By accessing or using the App, you agree to be bound by these Terms and our Privacy Policy. If you do not agree to these Terms or the Privacy Policy, you must not access or use the App.

1. License to Use the App
Subject to these Terms, we grant you a limited, non-exclusive, non-transferable, and revocable license to use the App for your personal, non-commercial use.

2. User Accounts
a. In order to access certain features of the App, you may be required to create an account. You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete.

b. You are responsible for maintaining the confidentiality of your account and password and for restricting access to your account. You agree to accept responsibility for all activities that occur under your account or password.

3. Prohibited Conduct

You agree not to:

a. Use the App for any illegal or unauthorized purpose;

b. Modify, adapt, or hack the App, or modify another website so as to falsely imply that it is associated with the App;

c. Attempt to gain unauthorized access to any portion of the App or any other systems or networks connected to the App;

d. Reproduce, duplicate, copy, sell, resell, or exploit any portion of the App without our express written permission;

e. Use any automated means or form of scraping or data extraction to access, monitor, or copy any content or information from the App;

f. Impersonate any person or entity or falsely state or otherwise misrepresent your affiliation with a person or entity;

g. Interfere with or disrupt the operation of the App or any servers or networks connected to the App; or

h. Violate any applicable laws or regulations.

4. Intellectual Property

The App and its original content, features, and functionality are and will remain the exclusive property of Portfolify and its licensors. The App is protected by copyright, trademark, and other laws of both the US and foreign countries. Our trademarks and trade dress may not be used in connection with any product or service without the prior written consent of Portfolify.

5. Termination
We may terminate or suspend your access to the App immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach these Terms. Upon termination, your right to use the App will immediately cease.

6. Disclaimer of Warranties

THE APP IS PROVIDED ON AN "AS IS" AND "AS AVAILABLE" BASIS, WITHOUT ANY WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED. [APP NAME] MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, WHETHER EXPRESS, IMPLIED, STATUTORY, OR OTHERWISE, WITH RESPECT TO THE APP.

7. Limitation of Liability

IN NO EVENT SHALL PORTFOLIFY, ITS OFFICERS, DIRECTORS, EMPLOYEES, OR AGENTS, BE LIABLE TO YOU FOR ANY INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES WHATSOEVER, INCLUDING WITHOUT LIMITATION, DAMAGES FOR LOSS OF PROFITS, LOSS OF DATA, BUSINESS INTERRUPTION, OR ANY OTHER COMMERCIAL DAMAGES OR LOSSES, ARISING OUT OF OR RELATED TO YOUR USE OR INABILITY TO USE THE APP.

8. Governing Law

These Terms shall be governed by and construed in accordance with the laws of the United States, without regard to its conflict of law provisions.

9. Changes to Terms
We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will provide at least 30 days' notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.

10. Contact Us

If you have any questions about these Terms, please contact us at zehanli2025@gmail.com.

By using the App, you signify your acceptance of these Terms. If you do not agree to these Terms, please do not use the App.

""")
                .multilineTextAlignment(.center)
                .padding(.top)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Terms_ConditionsView()
}
