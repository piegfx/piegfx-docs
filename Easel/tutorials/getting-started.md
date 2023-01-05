# Getting Started with Easel
In this tutorial you will learn how to install Easel, and create a basic project with it.

These sets of tutorials will assume you have at least basic knowledge of C# and programming, however will go over the basics of creating a C# project.

## Creating our project
Before we can get started, you'll need a few things installed on your system:
* [.NET 6 SDK or above](https://dotnet.microsoft.com/)
* [git CLI](https://git-scm.com/)

> [!Note]
> For these tutorials, we will be using the git CLI, and the dotnet CLI, as they are universally supported by all platforms.

Let's create our project!

First, create a new folder that you want to put your project in. For this tutorial, we'll be calling it `MyFirstEaselGame`, but you can name it whatever you want.

Once you've done this, you'll want to open your terminal of choice, and `cd` into your newly created project.

Next, run `dotnet new console` to initialize a new console project. Now, run `ls` (`dir` if you're using command prompt) to make sure the project files have been created. You should see a `.csproj` file, as well as a `Program.cs` file.

To make sure it's all working, run `dotnet run`. If you see `Hello, World!` in your terminal, you've created a project!

## Installing
Let's install Easel into our project!

The simplest way is to clone Easel into a parent directory.

`cd` into the parent directory of your project's directory, and run `git clone --recurse-submodules https://github.com/piegfx/Easel` to clone it.

Next, `cd` back into your project's directory and run `dotnet add reference ../Easel/Easel/Easel.csproj`. This adds a reference to Easel's project file (which is buried in directories also called "Easel") which we'll need to be able to use it.

Now, just run `dotnet run` again to make sure your program is still working. You should see a few warnings, but as long as you still see `Hello, World!` then that means Easel has been successfully included into your project!

## Our first window
The first thing we need to do before we can progress with Easel is create a window. Fortunately, this is very simple.

First, clear out everything from your `Program.cs` file, then add the following using directive:

```cs
using Easel;
```

### The game settings
Every Easel game must start with some settings, so the game knows how to behave on startup. This is done with the [GameSettings](xref:Easel.GameSettings) struct. This struct contains various startup parameters, including window size, title, icon, etc. For the purposes of this tutorial, the default settings will work well enough.

Add the following to your `Program.cs` file:

```cs
GameSettings settings = new GameSettings();
```

This initializes our settings with the default settings, which, as mentioned above, is good enough for our use case.

### Initializing & running the game
We're almost ready to create our window. Yep, it was that simple! The last thing we need to do is to initialize & run our game.

Every Easel game contains one instance of the [EaselGame](xref:Easel.EaselGame) class. You can have one, and one only, no more, and no less. This is the base class that runs the entire engine, and it's arguably *the* most important class we need to interact with.

Add the following to your `Program.cs` file:

```cs
using EaselGame game = new EaselGame(settings, null);
```

Firstly, [EaselGame](xref:Easel.EaselGame) implements [IDisposable](xref:System.IDisposable), so we must put it in a `using` statement, so that the `Dispose` method gets called automatically on game close.

We then pass in our settings, and for now, a `null` parameter at the end. We'll be changing this later, so don't worry about it for now.

Lastly, add the following to your `Program.cs` file:

```cs
game.Run();
```

This tells our game to start running everything.

Now, run your project and you should see a lovely... blank... window!

![Blank window](../images/tutorials/blank-window.png)