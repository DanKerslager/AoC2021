
import java.util.Scanner;

public class AoC02_2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        long hor = 0;
        long depth = 0;
        int aim=0;
        int num;
        do  {
            String dir = sc.next();
            num = sc.nextInt();
            switch (dir) {
                case "forward":
                    hor=hor+num;
                    depth=depth+(aim*num);
                    break;
                case "up":
                    aim=aim-num;
                    break;
                case "down":
                    aim=aim+num;
                    break;  
            }
        }while (num!=0);
        System.out.println(depth*hor);
        //System.out.println(aim);
        //System.out.println(hor);
    }
}
