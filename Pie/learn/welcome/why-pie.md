# Why Pie? (Or any graphics abstraction)
There are a few graphics APIs you can choose from nowadays: DirectX, the de facto standard for graphics programming on Windows. OpenGL, the baseline standard for cross-platform graphics programming that runs on pretty much everything. Vulkan, the new standard for high performance truly modern graphics programming. And finally, metal, which is for mac and only works on mac.

Let's compare these APIs.
* **DirectX (specifically Direct3D 11)** - Nice, comfortable object-oriented API, but only works on Windows. (Natively, we'll discuss that more later.)
* **OpenGL** - Cross-platform, dated API, rather slow, especially on Windows where Microsoft purposefully throttle its performance.
* **Vulkan** - Powerful, cross-platform, difficult to use.
* **Metal** - Pointless outside of macOS development and even then MoltenVK exists to make Metal even more pointless, although apparently it has a nice API.

So based on these descriptions, it sounds like DirectX is the nicest API to use. While this is a subjective opinion, many people will agree that DirectX has a nice API. However, it is limited to Windows only, which is a problem for cross-platform applications. While layers such as DXVK exist to help with this, you still need to jump through hoops to get it to work.

So what about OpenGL, or Vulkan? OpenGL has a dated API that a lot of people struggle to get used to, it is a big state machine and has many faults with both its API and implementation, a big one being the differences in driver implementations. Each driver has a slightly different OpenGL implementation, something that works with one driver might not work with another. On top of this, Microsoft purposefull throttles OpenGL performance on Windows, so it does not work nearly as fast as Direct3D would while rendering the same scenes. Vulkan is quickly replacing OpenGL, however it is hard to learn, especially without knowing graphics programming already, it is very verbose, and it also may not run on older graphics systems.

So it sounds like the best solution would be to have a cross platform DirectX, right? Correct! This is what Pie aims to do. Pie purposefully has a similar API to DirectX, while working cross-platform. It has both a DirectX implementation for Windows, so you can get the best possible performance, while still having an OpenGL implementation for Linux and macOS, which, thanks to a lack of Microsoft, is not throttled like it is on Windows.

A Vulkan implementation is planned eventually, however will probably not see the light of day for a while, since Vulkan works in a rather different way to OpenGL and DirectX, and would most likely require major changes to the API to remain performant. Vulkan support will most likely come in version 2, unless something changes and it can be implemented without changing the current API.