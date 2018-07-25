import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class TodoController {
  /// Returns a list of all `Todo`s.
  func index(_ req: Request) throws -> Future<[Todo]> {
    print("Index START")
    let analytics = try req.sharedContainer.make(GoogleAnalyticsClient.self)
    analytics.send(hit: PageTrackingHit(documentHostname: "", page: "todo", title: "index"))
    print("Index BEFORE END")
    return Todo.query(on: req).all()
  }
  
  /// Saves a decoded `Todo` to the database.
  func create(_ req: Request) throws -> Future<Todo> {
    let analytics = try req.make(GoogleAnalyticsClient.self)
    
    analytics.send(hit: PageTrackingHit(documentHostname: "", page: "todo", title: "save"))
    return try req.content.decode(Todo.self).flatMap { todo in
      return todo.save(on: req)
    }
  }
  
  /// Deletes a parameterized `Todo`.
  func delete(_ req: Request) throws -> Future<HTTPStatus> {
    let analytics = try req.make(GoogleAnalyticsClient.self)
    
    analytics.send(hit: PageTrackingHit(documentHostname: "", page: "todo", title: "save"))
    return try req.parameters.next(Todo.self).flatMap { todo in
      return todo.delete(on: req)
      }.transform(to: .ok)
  }
}
