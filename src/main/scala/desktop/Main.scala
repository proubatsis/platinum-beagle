package desktop

import org.lwjgl.glfw._
import org.lwjgl.glfw.GLFW._
import org.lwjgl.system.MemoryUtil._
import org.lwjgl.glfw.Callbacks._
import org.lwjgl.opengl.GL
import org.lwjgl.opengl.GL11._
import org.lwjgl.system.MemoryStack._



/**
  * Created by panagiotis on 27/08/17.
  */
object Main extends App {
  private var window = 0L

  private def init() = {
    GLFWErrorCallback.createPrint(System.err).set()

    if (!glfwInit()) throw new IllegalStateException("Cannot initialize glfw!")

    glfwDefaultWindowHints()
    glfwWindowHint(GLFW_VISIBLE, GLFW_FALSE)
    glfwWindowHint(GLFW_RESIZABLE, GLFW_TRUE)

    window = glfwCreateWindow(1280, 720, "Platinum Beagle", NULL, NULL)

    if (window == NULL) throw new RuntimeException("Cannot create window!")

    glfwSetKeyCallback(window, (w, key, scan, action, mods) => {
      if (key == GLFW_KEY_ESCAPE && action == GLFW_RELEASE)
        glfwSetWindowShouldClose(window, true)
    })

    try {
      val stack = stackPush()
      val pWidth = stack.mallocInt(1)
      val pHeight = stack.mallocInt(1)

      glfwGetWindowSize(window, pWidth, pHeight)
      val vidmode = glfwGetVideoMode(glfwGetPrimaryMonitor())
    }

    glfwMakeContextCurrent(window)
    glfwShowWindow(window)

    GL.createCapabilities()
    glClearColor(0, 0, 0, 1)
  }

  private def loop() = {
    while (!glfwWindowShouldClose(window)) {
      glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
      glfwSwapBuffers(window)
      glfwPollEvents()
    }
  }

  init()
  loop()
}
