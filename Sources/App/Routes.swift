import Vapor

final class Routes: RouteCollection {
  func build(_ builder: RouteBuilder) throws {
    builder.get("hello") { req in
      var json = JSON()
      try json.set("hello", "world")
      return json
    }
    
    builder.get("plaintext") { req in
      return "Hello, world!"
    }
    
    // response to requests to /info domain
    // with a description of the request
    builder.get("info") { req in
      return req.description
    }
    
    //builder.get("*") { req in return req.description }
    
    // this is how you register Resources
    // We can pass CatRESTController.self because it is a Resource Representable
    try builder.resource("posts", PostController.self)
    try builder.resource("catREST", CatRESTController.self)
  }
}

/// Since Routes doesn't depend on anything
/// to be initialized, we can conform it to EmptyInitializable
///
/// This will allow it to be passed by type.
extension Routes: EmptyInitializable { }
