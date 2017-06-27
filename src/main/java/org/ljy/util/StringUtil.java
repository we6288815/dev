package org.ljy.util;

/**
 * Created by ljy56 on 2017/4/11.
 */
public class StringUtil {
    /**
     * 判断字符串是否为空
     * @param str 待判断的字符串
     * @return 为空返回true，否则返回false
     */
    public static boolean isEmpty(String str){
        return str == null || ("").equals(str);
    }

    /**
     * 判断字符串是否为null且不为空串
     * @param str 待判断的字符串
     * @return 不为空返回true，否则返回false
     */
    public static boolean isNotNullAndNotEmpty(String str){
        return str != null && !("").equals(str);
    }
}
