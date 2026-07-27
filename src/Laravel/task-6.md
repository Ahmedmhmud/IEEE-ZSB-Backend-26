# System Basics

## 1. Understanding HTTP for Backend Engineers

HTTP is the protocol that powers web communication. A client sends a request, the server processes it, and then returns a response.

### Key ideas
- **Statelessness** means each request is independent, so the server does not automatically remember the previous one.
- **Methods** describe the action you want to perform: `GET`, `POST`, `PUT`, `PATCH`, and `DELETE`.
- **Status codes** tell you what happened: `200` for success, `201` for created, `404` for not found, and `500` for server errors.
- **Headers** carry metadata like `Content-Type` and `Authorization`.
- **Body** is the actual data being sent, such as JSON.

## 2. Serialization and Deserialization

Serialization is turning data or an object into a format that can be stored or sent, usually JSON.

Deserialization is turning that stored format back into a usable object or array.

### Why it matters
- APIs serialize data before sending a response and deserialize incoming request data before using it.
- Storage systems like Redis cannot store raw in-memory objects, so data is often serialized first.

## 3. Caching

Caching means storing frequently used data in a faster temporary layer so the application does not repeat expensive work.

### Main ideas
- **In-memory caching** uses tools like Redis or Memcached.
- **Cache-aside** means check the cache first, then load from the database only if needed.
- **TTL** controls when cached data expires.
- **Invalidation** means removing or refreshing stale cache values when the source data changes.

## 4. UML Class Diagram

UML class diagrams show the structure of a system by describing classes, their attributes, their methods, and how they relate to each other.

### Basic parts
1. Class name
2. Attributes
3. Methods

### Visibility markers
- `+` public
- `-` private
- `#` protected

### Relationships
- **Inheritance** means one class is a specialized version of another.
- **Association** is a general connection between classes.
- **Aggregation** means a class has another class, but the child can still exist alone.
- **Composition** means the child depends on the parent.
- **Dependency** means one class temporarily uses another.

## 5. Observer Design Pattern

The Observer pattern is a behavioral pattern where one object notifies many dependent objects when its state changes.

### Why it is useful
- It keeps code loosely coupled.
- It fits event-driven systems.
- It is the idea behind Laravel events, listeners, and observers.

### Example scenario
- Subject: `UserRegistered` event.
- Observers: `SendWelcomeEmailListener`, `LogUserRegistrationListener`, `CreateUserProfileListener`.

## 6. Real World System Design

System design is about planning the architecture, data flow, and components of a system so it can handle real requirements like scale, latency, and availability.

### Core ideas
- **Vertical scaling** means giving one server more CPU or memory.
- **Horizontal scaling** means adding more servers.
- **Load balancers** spread traffic across servers.
- **Read replicas** reduce pressure on the main database.
- **Sharding** splits a large database across multiple servers.
- **Queues** move slow work, like emails or image processing, out of the request cycle.
