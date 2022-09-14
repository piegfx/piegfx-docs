# Hello... quad?
> [!Note]
> The source code for this tutorial can be found [here.](https://github.com/piegfx/LearnPie/tree/master/Chapter1/2-HelloQuad)

Just like how every programmer's first program is a "hello world" program, every graphics programmer's first program is a "hello quad" program!

In this tutorial, you will learn how to create graphics buffers and shaders, and how to use these to draw a colored quad to the screen.

Before you get started, it's a good idea that you understand how the graphics pipeline works. This tutorial won't go over this, however I would recommend reading [this Microsoft article](https://docs.microsoft.com/en-us/windows/win32/direct3d11/overviews-direct3d-11-graphics-pipeline) which goes further into depth. (Note: This will eventually be replaced by a Pie article)

## Graphics buffers
Graphics buffers are the heart of a graphics application. Without these, you would never get anywhere. Graphics buffers are windows into **GPU memory**, they are stored directly on the GPU and contain key information to tell it what to draw.

There are three main types of graphics buffers we will use in a typical Pie application:
* Vertex buffer
* Index buffer
* Uniform buffer

### The vertex buffer
