functor
import
  System
define
  % a)
  fun{Max X Y}
    if X > Y then
        X
    else
        Y
    end
  end

  % b)
  proc{PrintGreater X Y}
    if X > Y then
       {System.showInfo X}
    else
       {System.showInfo Y}
    end
  end


  {System.showInfo {Max 10 11}}
  {PrintGreater 10 11}
end
