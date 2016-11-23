# VaporSimplePagination

VaporSimplePagination is a little wrapper to use pagination known by other frameworks like Laravel


### 1. Add VaporSimplePagination dependency


Add the following dependency to your `Package.swift`

```swift
.Package(url: "https://github.com/mludi/VaporSimplePagination",  majorVersion: 0)
```

Run `vapor build --clean` to install it


### 2. Usage

Import the Library by

```swift
import VaporSimplePagination
```


#### sample usage

```swift
drop.get("paginated") { request in
    guard let page = request.data["page"]?.int else {
        return try JSON(Post.all().makeNode())
    }
    guard let json = Post.paginate(limit: 15, page: page, description: "posts", makeJSON: true) else {
        throw Abort.badRequest
    }
    return try JSON(node: pagininated)
}
```

You can pass _true_ as makeJSON - param if your Model has overriden the `func makeJSON() throws -> JSON {}` function.


#### sample response

Sample response looks like the following

```json
[
	{
		"current_page": 1,
		"per_page": 15,
		"posts": [
			{
				"content": "test",
				"created_at": "2016-11-23 18:45:16",
				"id": 1,
				"image_path": "",
				"updated_at": "2016-11-23 18:45:16",
					"user": {
						"created_at": "2016-11-23 18:45:16",
						"id": 1,
						"updated_at": "2016-11-23 18:45:16",
						"username": "matz"
					}
			},
			{
				"content": "test2",
				"created_at": "2016-11-23 18:45:16",
				"id": 1,
				"image_path": "",
				"updated_at": "2016-11-23 18:45:16",
					"user": {
						"created_at": "2016-11-23 18:45:16",
						"id": 1,
						"updated_at": "2016-11-23 18:45:16",
						"username": "matz"
					}
			}
		],
		"total": 28,
		"total_pages": 2
	}
]
```