functor
import
  System
define
   proc{Circle R}
      local
         Pi A C D
      in
         Pi = 355.0/113.0
         A = Pi*R*R
         D = 2.0*R
         C = Pi*D
         {System.showInfo A}
         {System.showInfo D}
         {System.showInfo C}
      end
   end
   {Circle 4.0}
end