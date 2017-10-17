functor import Application System define

   fun lazy {StreamMap S F}
      case S of nil then
         nil
      [] H|T then
         {F H}|{StreamMap T F}
      end
   end

   local A = 2|3|4|A X in
      X = {StreamMap A fun {$ X} X*X end}
      if {Nth X 10} > 0 then skip end
      {System.show X}
   end

   fun lazy {StreamZip S1 S2 F}
      case S1 of nil then
         nil
      [] H1|T1 then
         case S2 of nil then
            nil
         [] H2|T2 then
            {F H1 H2}|{StreamZip T1 T2 F}
         end
      end
   end

   local A = 2|3|4|A B = 9|~3|B X in
      X = {StreamZip A B fun {$ X Y} X*Y end}
      if {Nth X 10} > 0 then skip end
      {System.show X}
   end

   fun lazy {StreamScale S Factoral}
      {StreamMap S fun {$ X} X*Factoral end}
   end

   local A = 2|3|4|A X in
      X = {StreamScale A 5}
      if {Nth X 10} > 0 then skip end
      {System.show X}
   end

   fun lazy {StreamAdd S1 S2}
      {StreamZip S1 S2 fun {$ X Y} X+Y end}
   end

   local A = 2|3|4|A B = 9|~3|B X in
      X = {StreamAdd A B}
      if {Nth X 10} > 0 then skip end
      {System.show X}
   end

   fun lazy {StreamIntegerate Inita S Dt}
      case S of nil then
         nil
      [] H|T then
         Inita|{StreamIntegerate T Inita+H*Dt Dt}
      end
   end


   local A = 1.0|0.0|A X in
      X = {StreamIntegerate 5.0 A 1.0}
      if {Nth X 10} > 0.0 then skip end
      {System.show}
   end

   local A = 5.0|6.0|7.0|A X in
      X = {StreamIntegerate 2.0 A 3.0}
      if {Nth X 10} > 0.0 then skip end
      {System.show}
   end

   fun {MakeRC R C Dt}
      local RC Sr Sc in
         RC = fun{$ S V0}
                 Sr = {StreamScale S R}
                 Sc = {StreamIntegerate {StreamScale S 1/C} V0 Dt}
                 {StreamAdd Sr Sc}
              end
         RC
      end
   end

   local
      Ones = 1.0|Ones
      RC = {MakeRC 5.0 1.0 0.2}
      V = {RC Ones 2.0}
   in
      if {Nth V 5} > 0.0 then skip end {System.show V}
   end
   {Application.exit 0}
end
