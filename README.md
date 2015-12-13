# LediMoteiOS

iOS client for [LediMote](https://github.com/drejkim/LediMote).

Take a look at this [video](https://youtu.be/i61g4aYkrI0) to see it in action.

<img src="https://raw.githubusercontent.com/drejkim/LediMoteiOS/master/screenshots/LediMote.png" width="250">

## Requirements

* [LediMote](https://github.com/drejkim/LediMote)
* Xcode 7.2

## Running the demo

### Updating the WebSocket address

Modify `socket` in `LediMoteViewController.swift`. The section of the code looks like this:

```swift
// MODIFY THIS WITH THE APPROPRIATE URL
let socket = SocketIOClient(socketURL: "http://myedison.local:8080")
```

Replace `myedison` with the name of your Edison.

### Running the LediMote server

* On Edison, navigate to `LediMote/server`.
* Run the server by typing `node server.js`.

The Node.js server should now be running. The console will look something like this:

```bash
HTTP server listening on port 8080
```

### Using the iOS client

See [Apple's instructions](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Conceptual/Xcode_Overview/RunYourApp.html) for launching an app from Xcode.

If you are running this on an iOS device, make sure that it is on the same WiFi network as your Edison.
