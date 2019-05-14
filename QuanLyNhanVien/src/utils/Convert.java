package utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Convert {
    public static String ConvertDateToString(Date date,String mauDinhDang){
        SimpleDateFormat format = new SimpleDateFormat(mauDinhDang);
        return format.format(date);
    }

    public static Date ConvertStringToDate(String str,String mauDinhDang){
        SimpleDateFormat format = new SimpleDateFormat(mauDinhDang);
        try {
            Date date = format.parse(str);
            return date;
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
    // chuyển từ date thành string đúng định dạng yyyy-MM-dd
    public static String Converts(Date date,String kieu,boolean dinhdang){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DAY_OF_MONTH);
        String thang = (month+1) < 10 ? "0"+(month+1) : (month+1)+"";
        String ngay = day < 10 ? "0"+(day) : (day)+"";
        if(dinhdang){
            return "" + year + kieu + thang + kieu + ngay;
        }
        else {
            return "" + ngay + kieu + thang + kieu + year;
        }
    }

    //lấy ra tháng hoặc năm
    public static int getMonthOrYear(Date date,boolean chon){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        if(chon){
            return calendar.get(Calendar.MONTH) + 1;
        }
        else{
            return calendar.get(Calendar.YEAR);
        }
    }

    /**
     * Cách chuyển từ kiểu String định dạng dd/MM/yyyy -> yyyy-MM-dd lưu vào mysql
     * - Bước 1 : ta cần tách chuỗi và chuyển chuỗi "dd/MM/yyyy" đầu vào thành chuỗi mới kiểu "yyyy-MM-dd"
     *      String str = "13/02/1998";
     * 		String[] str2 = str.split("/");
     * 		String str3 = str2[2] +"-" +str2[1] +"-"+ str2[0];
     * - Bước 2 : ta chuyển từ chuỗi "yyyy-MM-dd" sang kiểu date vs định dạng "yyyy-MM-dd"
     *      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
     *      Date date = format.parse(str3);
     * - Bước 3 : dùng calendar lấy ra các giá trị ngày , tháng + 1, năm  sau đó chuyển thành 1 chuỗi kiểu nam-thang+1-ngay
     *      Calendar calendar = Calendar.getInstance();
*           calendar.setTime(date);
     *      int year = calendar.get(Calendar.YEAR);
     *      int month = calendar.get(Calendar.MONTH);
     *      int day = calendar.get(Calendar.DAY_OF_MONTH);
     *      String moi = year + "-" + (month+1) + "-" + day;
     */
}
