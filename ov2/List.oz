define
fun{Length List}
   case List of Head|Tail then
      1 + {Length Tail}
   else
      0
   end
end

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

fun{Append List1 List2}
   case List1 of Head|Tail then
      Head|{Append Tail List2}
   else
      List2
   end
end

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
