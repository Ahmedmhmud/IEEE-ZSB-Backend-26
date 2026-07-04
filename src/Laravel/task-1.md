# Design patterns research

This research covers general concepts about design patterns, facade design patterns how Laravel uses it and some other general concepts like ORM and SOLID principles.

## Blade templates and how they work

Laravel Blade is a built-in templates engine that separates logic from presentation for simplicity, it allows you to embed logic in HTML pages to create dynamic content (like ejs in NodeJS).

### How it works?

Blade templates are compiled to plain PHP code and cached in `storage/framework/views` directory.

Caching is for preventing compiling the templates every single request, so Compile once, execute countless times without runtime overhead.

### Syntax
- **{{ $name }}**: output name.
- **{!! $name !!}**: raw HTML.
- **@if($condition) @endif**: conditional if.
- **@foreach($items as $item) @endforeach**: foreach loop.
- **{{-- comment --}}**: comment.

## ORM and its benefits

It is a programming technique that acts as a bridge between object-oriented programming languages and relational databases.  It automates the conversion of data between incompatible systems like OOP and Relational DBs, allowing developers to interact with database tables using objects, classes, and methods in their preferred language rather than writing raw SQL queries.

### Benefits
- **Abstraction Layer**: ORM tools map database tables to classes, rows to objects, and columns to attributes, hiding the complexity of database interactions from the developer. 
- **Productivity**: By enabling CRUD (Create, Read, Update, Delete) operations via code, ORMs speed up development, reduce boilerplate code, and help prevent SQL injection attacks through parameterized queries. 
- **Database Independence**: ORMs abstract the specific SQL syntax of different databases, making it easier to switch between database systems (e.g., from MySQL to PostgreSQL) with minimal code changes.

### Examples:
Hibernate for Java, Django ORM for Python and Mongoose for NodeJS.

## Facade Design Pattern and how Laravel use it

Facade is a design pattern that gives a simple interface to a complex system.

Laravel uses facades to access services from the service container in a clean way.

### Why it is useful
- It hides complex setup.
- It keeps code short and readable.
- It gives a simple way to use Laravel services.

### Example of usage
```php
use Illuminate\Support\Facades\Cache;

class ProfileService
{
	public function getProfile($user)
	{
		return Cache::remember('user_profile_'.$user->id, 60, function () use ($user) {
			return [
				'name' => $user->name,
				'email' => $user->email,
			];
		});
	}
}
```

Here, `Cache` is a facade. Laravel sends the call to the real cache service behind the scenes.

## Factory Design Pattern

Factory is a design pattern that creates objects without exposing the creation logic.

This is useful when you want one place to control which class is created.

### Why it is useful
- It keeps creation code in one place.
- It makes later changes easier.
- It hides the exact class from the rest of the code.

### Simple example
```php
interface Notifier
{
	public function send(string $message);
}

class EmailNotifier implements Notifier
{
	public function send(string $message)
	{
		return 'Email: '.$message;
	}
}

class SmsNotifier implements Notifier
{
	public function send(string $message)
	{
		return 'SMS: '.$message;
	}
}

class NotificationFactory
{
	public static function make(string $type): Notifier
	{
		return $type === 'sms' ? new SmsNotifier() : new EmailNotifier();
	}
}

$notifier = NotificationFactory::make('sms');
$notifier->send('Welcome to the app');
```

The factory decides which class to return, and the rest of the code only uses the result.

## SOLID Principles

SOLID is a group of five principles that help write clean and maintainable code.

### S - Single Responsibility Principle
One class should have one job only.

Example: a mail class should send emails, not save users.

```php
class UserMailer
{
	public function sendWelcomeEmail(User $user)
	{
		// send email only
	}
}
```

### O - Open/Closed Principle
Classes should be open for extension but closed for modification.

Example: add a new payment method by creating a new class.

```php
interface PaymentMethod
{
	public function pay($amount);
}

class CardPayment implements PaymentMethod
{
	public function pay($amount)
	{
		return 'Paid '.$amount.' by card';
	}
}
```

### L - Liskov Substitution Principle
Child classes should work correctly in place of parent classes.

Example: a `Sparrow` should still work where a `Bird` is expected.

```php
class Bird
{
	public function move()
	{
		return 'moving';
	}
}

class Sparrow extends Bird
{
	public function move()
	{
		return 'flying';
	}
}
```

### I - Interface Segregation Principle
Do not force a class to implement methods it does not need.

Example: a printer should not be forced to scan.

```php
interface Printer
{
	public function print();
}

interface Scanner
{
	public function scan();
}
```

### D - Dependency Inversion Principle
Depend on interfaces, not concrete classes.

Example: the order service should depend on `PaymentMethod`.

```php
class OrderService
{
	public function __construct(private PaymentMethod $paymentMethod) {}

	public function checkout($amount)
	{
		return $this->paymentMethod->pay($amount);
	}
}
```

