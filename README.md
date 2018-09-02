<h3 align="center">
<a href="https://github.com/PoissonBallon/google-analytics-provider">
<img src="./Assets/logo.png" width="150"/>
<br />
<br />
</a>
Google Analytics Provider
</h3>

------

[![Swift 4.1](https://img.shields.io/badge/Language-Swift%204.1-orange.svg)](https://developer.apple.com/swift/)
[![Vapor 3](https://img.shields.io/badge/vapor-3-00B0FF.svg?logo=data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAyIDIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IHgxPSIwJSIgeTE9IjI0JSIgeDI9IjAlIiB5Mj0iOTYlIiBpZD0iYyI+PHN0b3Agc3RvcC1jb2xvcj0iIzQzQzRGQyIvPjxzdG9wIHN0b3AtY29sb3I9IiNERjQzRjYiIG9mZnNldD0iMTAwJSIvPjwvbGluZWFyR3JhZGllbnQ+PC9kZWZzPjxwYXRoIGZpbGw9InVybCgjYykiIGQ9Ik0xLDAgQzEsMCAxLjcsMC45IDEuNywxLjMgQzEuNywxLjcgMS40LDIgMSwyIEMwLjYsMiAwLjMsMS43IDAuMywxLjMgQzAuMywwLjkgMSwwIDEsMCBaIi8+PC9zdmc+
)](https://github.com/vapor/vapor)

A Vapor provider for __Google Analytics__ - a pure Swift implementation of [Google Analytics Measurement Protocol](https://developers.google.com/analytics/devguides/collection/protocol/v1/)



## Getting Started
In your `Package.swift` file, add the following

~~~~swift
.package(url: "https://github.com/PoissonBallon/google-analytics-provider.git", from: "0.0.1")
~~~~

Register the config and the provider to your Application
~~~~swift
let config = GoogleAnalyticsConfig(trackingID: "UA-12XXXXX-Y")
services.register(config)
try services.register(GoogleAnalyticsProvider())
~~~~

And you are all set. Interacting with the API is quite easy.
~~~~swift
let gac = try req.make(GoogleAnalyticsClient.self)
gac.send(hit: .event(category: "API", action: "create TODO"))
~~~~

And you can always check the documentation to see the required parameters for specific API calls.


## Whats Implemented

### Common Hit Types
* [x] Page Tracking
* [x] Event Tracking
* [ ] Ecommerce Tracking
* [ ] Social Tracking
* [ ] Exception Tracking
* [ ] User Timing Tracking
* [ ] App / Screen Tracking


---
### Error and Quotas
* [x] Too big hits
* [x] Malformed Hits

# Author

* PoissonBallon [@poissonballon](https://twitter.com/poissonballon)


## License

Vapor Stripe Provider is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

## Want to help?
Feel free to submit a pull request whether it's a clean up, a new approach to handling things, adding a new part of the API, or even if it's just a typo. All help is welcomed! 😀
