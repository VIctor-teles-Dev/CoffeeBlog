import { application } from "./application"

import NavbarController from "./navbar_controller"
application.register("navbar", NavbarController)

import TypewriterController from "./typewriter_controller"
application.register("typewriter", TypewriterController)
