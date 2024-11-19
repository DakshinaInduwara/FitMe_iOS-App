Import SwiftUI

struct RagistrationView: View {
    @State private var email: String = ""
    @State private var fullname: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(.\dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            Image("firebase-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height:120)
                    .padding(.vertical, 32)

                    VStack {
                        InputView(text: $email, title: "Email Address", placeholder: "name@email.com")
                        .autocapitalization(.none)

                        InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name")

                        InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)

                        InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)

                    Button{
                        Task {
                            try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                        }
                    } label: {
                        HStack {
                            Text("SIGN UP")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                    .padding(.top, 24)

                    Spacer()

                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Already have an account?")
                            Text("Sign in")
                                .fontWeight(.bold)
                        }
                        .font(system(size: 14))
                    }
         }
    }
}

struct RagistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RagistrationView(text: .constant(""), title: "Email Address", placeholder: "name@email.com")
    } 
}