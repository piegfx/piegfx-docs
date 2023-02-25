# Entities and Input
> [!Note]
> You can view the full source code for this tutorial [here]()

In this tutorial, you'll learn what an Entity is, how to add one to a scene, and how to move it around.

This tutorial follows on from the last tutorial. If you haven't read that one, [you can read it here](1-getting-started.md).

## What is an Entity?
An Entity is an object that can be added to a scene. Other terms for Entities are Game Objects and Actors (although Actors do have a slightly different definition).

An Entity can be anything from a static object, to an invisible object, to a fully fledged interactive object, such as a player or NPC.

Entities are Easel's main way of providing logic, so it's important that you learn how to use them properly.

If you're still confused, don't worry, hopefully the rest of this tutorial will help to explain what an Entity is.

Let's add one to the scene!

## Adding an Entity
Add the following `using` directives to the top of your file:
```cs
using Easel.Entities;
using Easel.Entities.Components;
```

Then, in your Scene's `Initialize` method, add the following:

```cs
Entity entity = new Entity("myEntity");
AddEntity(entity);
```

Here, we create a new Entity with the name `myEntity`, and then use the Scene's built-in method to add it to the scene.

And that's it! You've added an entity to the scene. It won't do a lot, but it's there.

Let's add a **Component**.

### What is a component?
Entities contain what's known as components. A component is a section of logic that the entity will use. Components are designed to be small and reusable.

For example, let's say you wanted to have two car entities. Both cars can drive, but one car has a rocket booster.

For this, you just create two components! One called `DriveComponent`, and the other called `RocketComponent`. You apply the `DriveComponent` to both cars, but only apply the `RocketComponent` to one car. Both cars can drive, but only one car can use the rocket booster.

Easel comes with several components built in, such as [Sprite](xref:Easel.Entities.Components.Sprite), and [ModelRenderer](xref:Easel.Entities.Components.ModelRenderer). These ones in particular abstract away rendering to make it automatic and easy. We'll get into creating your own components in a bit.

### Adding a component
Let's add a component to our entity!

For this example, we'll be adding a [Sprite](xref:Easel.Entities.Components.Sprite). Because of this, we need to add this line at the start of our `Initialize` function:

```cs
Camera.Main.UseOrtho2D();
```

By default, scenes start in 3D rendering mode. However, since our scene is 2D, we need to tell the camera to use a 2D rendering mode. The [Camera](xref:Easel.Entities.Camera) comes with some helper functions to tell it to render 2D instead of 3D, which we use here.

Now, let's add a component.

First, add the following using directive to the top of your file:
```cs
using Easel.Graphics;
```

Add the following **after** you create the entity, but **before** you add it to the scene:

```cs
entity.AddComponent(new Sprite(Texture2D.White));
```

Here, we tell the entity to add a new component. This component is a [Sprite](xref:Easel.Entities.Components.Sprite), with a white texture. We'll get into textures in just a second.

Now, you can add components at any time after an entity has been created and added to the scene. The reason you may want to do it *before* the entity has been added is because it defers initialization until the entity has been added to the scene. Once an entity has been added, the component is initialized immediately when `AddComponent` is called.

### What is a Texture?
A texture is a data store that can be sampled from a shader. In layman's terms... An image. That's about it. Textures are used to apply an image to something.

Creating a texture is easy. Just use its **constructor**.

Replace the `Texture2D.White` with `new Texture2D("<PATH>")`