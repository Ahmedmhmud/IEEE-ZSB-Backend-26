## Laravel Gates

Gates are a simple way to decide if a user is allowed to do something. They are usually used for actions that are not tied to a specific model, like viewing an admin dashboard.

Laravel defines gates with the `Gate` facade, usually inside the `boot` method of `AppServiceProvider`.

### Why it is useful
- It keeps authorization logic in one place.
- It is easy to read and easy to test.
- It works well for simple permission checks.

### Example of usage
```php
use App\Models\Post;
use App\Models\User;
use Illuminate\Support\Facades\Gate;

public function boot(): void
{
	Gate::define('update-post', function (User $user, Post $post) {
		return $user->id === $post->user_id;
	});
}

if (Gate::allows('update-post', $post)) {
	// update post
}
```

Here, Laravel passes the current user into the gate automatically. If the gate returns true, the action is allowed.

### How it works
- You define an ability name like `update-post`.
- Laravel calls the closure when you check that ability.
- You can also use `Gate::authorize()` to throw a 403 error automatically if the user is not allowed.

## Sanctum vs Passport

Both Sanctum and Passport are used for API authentication, but they are not the same.

Password requires robust protocol which is Open Authorization 2.0 (OAuth2) that you need to allow third-party applications to access your API securely.

### Sanctum
- Best for Single Page Applications (SPAs), mobile apps, and simple token-based APIs.
- Simpler to set up.
- Uses first-party session cookies for SPAs and API tokens for mobile or third-party use.
- Sanctum tokens are stateful, means they are associated with user's session.

### Passport
- Best when your app needs full OAuth2 support.
- More powerful, but more complex.
- Good for third-party applications that need OAuth2 flows.

### The major difference between them
- Sanctum when you want simple authentication.
- Passport when you need OAuth2 and more advanced token workflows.

Sanctum is lighter and easier for most Laravel apps. Passport is better when OAuth2 is required.

## XSRF and CSRF

CSRF means Cross-Site Request Forgery. It is an attack where a malicious site tries to make a logged-in user send a request to your app without permission.

XSRF is not a different attack. In Laravel, XSRF refers to the token header and cookie names used to protect against CSRF in JavaScript apps.

### Difference
- CSRF is the security problem.
- XSRF is the token/cookie handling Laravel uses to help prevent that problem.

### Example
```html
<form method="POST" action="/idea">
	@csrf
    <!-- Generates: <input type="hidden" name="_token" value="..."> -->
	<input type="text" name="description">
</form>
```

For SPAs, Laravel sends an `XSRF-TOKEN` cookie, and Axios can send it back as the `X-XSRF-TOKEN` header automatically.

## Defining relationships in Eloquent models

Eloquent relationships connect models to each other. They let you work with related data using methods instead of writing joins everywhere.

### Main types
- `hasOne` for one record.
- `hasMany` for many records.
- `belongsTo` for the inverse side of a relationship.
- `belongsToMany` for many-to-many relationships.

### Simple examples
```php
class User extends Model
{
	public function phone()
	{
		return $this->hasOne(Phone::class);
	}

	public function posts()
	{
		return $this->hasMany(Post::class);
	}
}

class Post extends Model
{
	public function user()
	{
		return $this->belongsTo(User::class);
	}
}
```

### Why it is useful
- It makes code easier to read.
- It keeps database logic inside the model.
- It supports lazy loading and eager loading.

For many-to-many relationships, Laravel uses a pivot table:

```php
class User extends Model
{
	public function roles()
	{
		return $this->belongsToMany(Role::class);
	}
}
```

This is the normal way to connect models in Eloquent.
