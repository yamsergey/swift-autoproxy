[![CircleCI](https://circleci.com/gh/yamsergey/swift-autoproxy.svg?style=svg)](https://circleci.com/gh/yamsergey/swift-autoproxy)

## State 
In active development. It's in experiment state now

# Swift AutoProxy

This app helps to setup AutoProxy configuration for developemnt purpose.
When you work with some proxy and have to validate traffic quite often it really annoying reconfigure a device to use proxy when needed and when not to.

To make life a bit easier we can use Proxy [Auto-Config](https://en.wikipedia.org/wiki/Proxy_auto-config). But problem with it is that most of http clients expect it to be on some server and response from that server should have proper headers, hence we can't use just a file on local machine.  Also Different devices require different proxy config time by time.

This app can solve the issue above. It's simple http server which now start serve on port `8081` and return correct `Auto-Config` based on query parameters.

### Usge 

For exanple, request to [http://localhost:8081/?host=localhost&port=8080](http://localhost:8081/?host=localhost&port=8080) will return
```
function FindProxyForURL(url, host)
{
    return "PROXY localhost:8080; DIRECT";
}

```

Which means that when proxy on `localhost:8080` is available a client will try use it, but when you turn it of it will bypass proxy and use direct connections.

### Special cases

As an experiment, when you specify parametere `all=false` `Auto-Config` file will respond only to requests for Android  Emulator and iOS simulator. So you can serfe Netwrok on your development machine without proxy and at the same time monitor traffic from Android/iOS virtual device.


### Build

Currently the app has prebuild version for Mac only.

Mac OS:
`swift build` and then `swift run`

Linux/WSL(Windows Subsytem for Linux):
`swift build` and then `swift run`
> for required dependencies please check .circleci/images/Dockerfile 
