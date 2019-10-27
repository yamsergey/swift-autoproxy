Settings.shared.set(forKey: "hello", value: "Hey-hey, world!")
print(Settings.shared.string(forKey: "hello", or: "Wow"))