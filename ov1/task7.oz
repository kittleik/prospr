functor
import
   Browser
define
   % a)
   fun{Length List}
      case List of Head|Tail then
         1 + {Length Tail}
      else
         0
      end
   end
   % b)
   fun{Take List Count}
      if Count > {Length List} then
         List
      else
         case List of Head|Tail then
            if Count == 1 then
               Head
            else
               Head|{Take Tail Count-1}
            end
         end
      end
   end
   % c)
   fun{Drop List Count}
      if Count > {Length List} then
         nil
      else
         case List of Head|Tail then
            if Count == 1 then
               Tail
            else
               {Drop Tail Count-1}
            end
         end
      end
   end

   % d)
   fun{Append List1 List2}
      case List1 of Head|Tail then
         Head|{Append Tail List2}
      else
         List2
      end
   end

   % e)
   fun{Member List Element}
      case List of Head|Tail then
         if Head == Element then
            true
         else
            {Member Tail Element}
         end
      else
         if List == Element then
            true
         else
            false
         end
      end
   end

   % f)
   fun{Position List Element}
      case List of Head|Tail then
         if Head == Element then
            1
         else
            1+{Position Tail Element}
         end
      else
         1
      end
   end
         
            

   % a) 
   {Browser.browse {Length [1 2 3]}}
   % b)
   {Browser.browse {Take [2 3 4 5 6] 3}}
   % c)
   {Browser.browse {Drop [7 6 5 4 3] 3}}
   % d)
   {Browser.browse {Append 1|2|3 5|4|3}}
   % e)
   {Browser.browse {Member [1 2 3] 2}}
   {Browser.browse {Member [6 7 8] 2}}
   % f)
   {Browser.browse {Position [2 3 4 5 6 7] 4}}
end
   
         
      