import SwiftUI
import FirebaseAuth

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var loginError: String?
    @EnvironmentObject var appState: AppState  // Use environment object to set login state
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack(spacing: 20) {
                Text("Welcome Back")
                    .foregroundColor(.blue)
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .offset(x: -36, y: -100)
                
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.black)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.black)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                Button {
                    login()
                } label: {
                    Text("Log In")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.white, .white], startPoint: .top, endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.blue)
                }
                .padding(.top)
                .offset(y: 100)
                
                if let error = loginError {
                    Text(error)
                        .foregroundColor(.red)
                        .bold()
                        .padding(.top)
                        .offset(y: 110)
                }
            }
            .frame(width: 350)
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                loginError = error.localizedDescription
            } else {
                // Successful login, update the app state to indicate user is logged in
                appState.isUserLoggedIn = true
            }
        }
    }
}
