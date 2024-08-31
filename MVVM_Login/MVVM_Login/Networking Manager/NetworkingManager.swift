import Foundation

struct SignInResponse: Codable {
    let token: String?
    let message: String?
    // Add other fields as needed based on the API response
}
struct SignIn: Codable {
    let email: String?
    let password: String?
    // Add other fields as needed based on the API response
}


class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func signIn(email: String, password: String, completion: @escaping (Result<SignInResponse, Error>) -> Void) {
        
        guard let url = URL(string: "https://e2ehiring.com/api/v1/signin") else { return }

        let configaration = URLSessionConfiguration.default
        let session = URLSession(configuration: configaration)

        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body  = SignIn(email: email, password: password)
        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            completion(.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                let error = NSError(domain: "DataError", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }

            do {
                let signInResponse = try JSONDecoder().decode(SignInResponse.self, from: data)
                completion(.success(signInResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

