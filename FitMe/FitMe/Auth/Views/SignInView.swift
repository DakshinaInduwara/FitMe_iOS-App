import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?

    @AppStorage("isUserLoggedIn") private var isUserLoggedIn: Bool = false
    @AppStorage("storedEmail") private var storedEmail: String = ""
    @AppStorage("storedPassword") private var storedPassword: String = ""

    var body: some View {
        NavigationView {  // Add NavigationView here
            VStack(spacing: 20) {
                Text("FitMe Fiteness")
                    .font(.largeTitle)
                    .bold()
                    .italic()
                    .foregroundColor(.blue)
                Text("Sign In")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                }

                Button(action: signIn) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                NavigationLink(destination: SignUpView()) {
                    Text("Don't have an account? Sign Up")
                        .foregroundColor(.blue)
                        .bold()
                }
            }
            .padding()
            .navigationBarHidden(true) // Hide the default navigation bar if needed
        }
    }

    private func signIn() {
        guard isValidEmail(email) else {
            errorMessage = "Please enter a valid email."
            return
        }

        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters long."
            return
        }

        if email == storedEmail && password == storedPassword {
            errorMessage = nil
            isUserLoggedIn = true // Sign in the user
        } else {
            errorMessage = "Invalid email or password."
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}
