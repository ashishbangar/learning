$i=0
class Looping
     def whileloop
         while $i<5 do
           print "I Am Implementing While Loop #$i\n"
           $i+=1
          end
          if $i==5
             $i=0
          end
      end
      def forwhileloop
         for i in 0...5
           print "I Am Implementing for Loop #{i}\n"
         end
         if $i==5
             $i=0
          end
      end
      def dowhileloop
         begin
           print "I Am Implementing DoWhile Loop #$i\n"
           $i+=1
         end while $i<5 
         if $i==5
             $i=0
          end
      end
      def eachwhileloop
         (0...5).each do |i|
           print "I Am Implementing each Loop #{i}\n"
         end
         if $i==5
             $i=0
          end
      end
end


object_1 = Looping.new
object_1.whileloop
object_1.dowhileloop
object_1.eachwhileloop
object_1.forwhileloop
