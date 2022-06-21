class AuthQuery {
  String tokenQuery(
      {String email = 'admin@example.com', String password = 'admin'}) {
    return '''
              mutation
                {
                tokenCreate(email:"admin@example.com",password:"admin"){
                  token
                  refreshToken
                  csrfToken
                  user{
                    email
                    id
                  }
                  errors{
                    code
                    field
                  }
                }
              }
              ''';
  }
}
