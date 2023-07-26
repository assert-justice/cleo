#include <GLFW/glfw3.h>
#include <quickjspp.hpp>
#include <iostream>

void println(qjs::rest<std::string> args) {
    for (auto const & arg : args) std::cout << arg << " ";
    std::cout << "\n";
}

int main(void)
{
    qjs::Runtime runtime;
    qjs::Context context(runtime);
    GLFWwindow* window;
    auto& module = context.addModule("example");
    module.function<&println>("println");
    context.eval(R"xxx(
            import * as my from 'example';
            globalThis.my = my;
        )xxx", "<import>", JS_EVAL_TYPE_MODULE);
    context.eval(R"xxx(
        my.println("sup");
            // let v1 = new my.MyClass();
            // v1.member_variable = 1;
            // let v2 = new my.MyClassA([1,2,3]);
            // function my_callback(str) {
            //   my.println("at callback:", v2.member_function(str));
            // }
        )xxx");

    /* Initialize the library */
    if (!glfwInit())
        return -1;

    /* Create a windowed mode window and its OpenGL context */
    window = glfwCreateWindow(640, 480, "GLFW CMake starter", NULL, NULL);
    if (!window)
    {
        glfwTerminate();
        return -1;
    }

    /* Make the window's context current */
    glfwMakeContextCurrent(window);
    glClearColor( 0.4f, 0.3f, 0.4f, 0.0f );

    /* Loop until the user closes the window */
    while (!glfwWindowShouldClose(window))
    {
        /* Render here */
        glClear(GL_COLOR_BUFFER_BIT);

        /* Swap front and back buffers */
        glfwSwapBuffers(window);

        /* Poll for and process events */
        glfwPollEvents();
    }

    glfwTerminate();
    return 0;
}
