package utils;

import javax.servlet.http.Part;

public class ChuanHoa {
    // Chuẩn hóa chuỗi
    public static String formatString(String str) {
        //B1: loại bỏ các kí tự đặc biệt ra khỏi chuỗi

        // danh sách các ký tự đặc biệt
        char[] chs = {
                '~','!','@','#','$','%','^','&','*',
                '(',')','-','_','=','+','[','{',']','}',
                '\'','|',';',':','"','<',',','>','.','?','/'
        };


        // loại bỏ kí tự đặc biệt
        for(char ch : chs) {
            str = str.replace(ch, ' ');
        }


        // loại bỏ khoảng cách đầu và cuối
        str = str.trim();


        while(str.indexOf("  ") != -1) {
            // loại bỏ dấu cách thừa thãi cứ tìm 2 dấu cách cạnh nhau thay bằng 1 dấu cách
            str = str.replace("  ", " ");
        }

        // khởi tạo mảng chứa các từ đc tách ra
        String[] str1 = str.split(" ");
        // khởi tạo chuỗi chứa các từ đã đc tách và chuẩn hóa
        String str2 = "";
        for (int i = 0; i < str1.length; i++) {
            // lấy ra kí tự đầu tiên cho về kiểu chữ hoa còn các kí tự khác viết thường
            str2 += String.valueOf(str1[i].charAt(0)).toUpperCase() + str1[i].substring(1).toLowerCase();
            if (i < str.length()) {
                str2 += " ";
            }
        }
        return str2;
    }

    // tachs chuoi
    public static String tachChuoi(String str,String symbol1,String symbol2){
        String[] str1 = str.split(symbol1);
        return "" + str1[2] +symbol2 +str1[1] +symbol2+ str1[0];
    }

    //chuẩn hóa file name
    public static String extractFileName(Part part){
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for(String s : items){
            if(s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=") + 2,s.length()-1);
            }
        }
        return null;
    }
}
