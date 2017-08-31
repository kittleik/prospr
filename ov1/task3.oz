functor
import
  System
define
  Y = 300
  Z = 30
  X = Y*Z
  {System.showInfo X}

  A = "This is a string"
  thread {System.showInfo B} end
  B = A
end