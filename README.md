[![CircleCI](https://circleci.com/gh/yamsergey/swift-autoproxy.svg?style=svg)](https://circleci.com/gh/yamsergey/swift-autoproxy)

## State 
In active development. It's in experiment state now

# Swift AutoProxy

This app helps to setup AutoProxy configuration for developemnt purpose.
When you work with some proxy and have to validate traffic quite often it really annoying to reconfigure a device to use proxy when needed and when not to.

To make life a bit easier we can use Proxy [Auto-Config](https://en.wikipedia.org/wiki/Proxy_auto-config). But problem with it is that most of http clients expect it to be on some server and response from that server should have proper headers, hence we can't use just a file on local machine.  Also Different devices require different proxy config time by time.

This app can solve the issue above. It's simple http server which now start serve on specified port and return correct `Auto-Config` based on query parameters.

### Usge 

Run the server:
```
AutoProxy run --port 8081
```

If you want to see logs:
```
AutoProxy run -l --port 8081
```

For exanple, request to [http://localhost:8081?host=localhost&port=8080](http://localhost:8081/?host=localhost&port=8080) will return
```
function FindProxyForURL(url, host)
{
    return "PROXY localhost:8080; DIRECT";
}

```

You can skip `host` parameter if it has the same value as the domain. For example this [http://localhost:8081?host=localhost&port=8080](http://localhost:8081/?port=8080) will return the same config as one above

Which means that when proxy on `localhost:8080` is available a client will try use it, but when you turn it off it will bypass proxy and use direct connections.

### Special cases

#### Configure for Android Emulator
From emulator you can always refer to host machine with ip `10.0.2.2`. Usual link for `Auto-Proxy` config on Android will looks like `http://10.0.2.2:8081/?port=8080` 

#### Proxy only Android and iOS virtual devices
As an experiment, when you specify parametere `all=false` `Auto-Config` file will respond only to requests from Android  Emulator and iOS simulator. So you can serf Netwrok on your development machine without proxy and at the same time monitor traffic from Android/iOS virtual device.


### Build

Currently the app has prebuild version for Mac only.

Mac OS:
`swift build` and then `swift run`

Linux/WSL(Windows Subsytem for Linux):
`swift build` and then `swift run`
> for required dependencies please check .circleci/images/Dockerfile 
