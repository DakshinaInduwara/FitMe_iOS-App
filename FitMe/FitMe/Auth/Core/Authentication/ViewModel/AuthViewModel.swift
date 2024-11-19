import Foundation
import Firebase
import FirebaaseFirestoreSwift

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    init () {
        self.userSession = Auth.auth().currentUser

        Task {
            await fetchUser()
        }
    }

    func signIn(withEmail email: String, password: String) async throws {

    }

    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            //try await Firestore.firestore().collection("users").document(result.user.uid).setData(from: encodedUser)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        } catch {
            print("DEBUG: Failed to create user: \(error.localizedDescription)")
        }
    }

    func signOut() {
        
    }

    func deleteAcount() {
        
    }

     func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)

        print("DEBUG: Current user is \(self.currentUser)")
    }
}