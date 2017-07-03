### Apache Commons Lang 3 使用说明
> Java的标准库中未能提供足够的方法来操作其核心类。Apache Commons Lang 提供了这些额外的方法。  
Lang provides a host of helper utilities for the java.lang API, notably String manipulation methods, basic numerical methods, object reflection, concurrency, creation and serialization and System properties. Additionally it contains basic enhancements to java.util.Date and a series of utilities dedicated to help with building methods, such as hashCode, toString and equals.  

* #### 1. StringUtils

##### 1.1 public static boolean isBlank(CharSequence cs):  
检查字符串是否为空 --- "",null，或只存在空格  
使用示例：
```java
 StringUtils.isBlank(null)      = true // null算作空
 StringUtils.isBlank("")        = true //""算作空
 StringUtils.isBlank(" ")       = true // 只存在空格也算空
 StringUtils.isBlank("bob")     = false
 StringUtils.isBlank("  bob  ") = false
 ```

##### 1.2 public static boolean isNotBlank(CharSequence cs)：
与1.1用法相反，判断字符串是否为非空 --- 非"", 非null，或不只是 存在空格
 ```java
  StringUtils.isNotBlank(null)      = false
  StringUtils.isNotBlank("")        = false
  StringUtils.isNotBlank(" ")       = false
  StringUtils.isNotBlank("bob")     = true
  StringUtils.isNotBlank("  bob  ") = true
 ```

##### 1.3 public static boolean isEmpty(CharSequence cs):

检查字符串是否为空 --- "",null  
使用示例：
```java
 StringUtils.isEmpty(null)      = true // null算作空
 StringUtils.isEmpty("")        = true //""算作空
 StringUtils.isEmpty(" ")       = false
 StringUtils.isEmpty("bob")     = false
 StringUtils.isEmpty("  bob  ") = false
```

##### 1.4 public static boolean isNotEmpty(CharSequence cs)：
与1.3用法相反，检查字符串是否为空 --- 非"",非null.
```java
 StringUtils.isNotEmpty(null)      = false
 StringUtils.isNotEmpty("")        = false
 StringUtils.isNotEmpty(" ")       = true
 StringUtils.isNotEmpty("bob")     = true
 StringUtils.isNotEmpty("  bob  ") = true
```

##### 1.5 public static String trim(String str)：
移除字符串首尾两端的空格、制表符等“空白符”；  
若想指定要移除的字符，请使用strip(String, String)方法
```java
 StringUtils.trim(null)          = null
 StringUtils.trim("")            = ""
 StringUtils.trim("     ")       = ""
 StringUtils.trim("abc")         = "abc"
 StringUtils.trim("    abc    ") = "abc"
```

##### 1.6 public static String trimToNull(String str)：
移除字符串首尾两端的空格、制表符等“空白符”。  
若trim过后该字符串成为了空字符串（""），则返回NULL；
```java
StringUtils.trimToNull(null)          = null
StringUtils.trimToNull("")            = null
StringUtils.trimToNull("     ")       = null
StringUtils.trimToNull("abc")         = "abc"
StringUtils.trimToNull("    abc    ") = "abc"
```

##### 1.7 public static String trimToEmpty(String str)：
移除字符串首尾两端的空格、制表符等“空白符”。  
若trim过后该字符串成为了空字符串（""）或NULL，则返回空字符串（""）；
```java
 StringUtils.trimToEmpty(null)          = ""
 StringUtils.trimToEmpty("")            = ""
 StringUtils.trimToEmpty("     ")       = ""
 StringUtils.trimToEmpty("abc")         = "abc"
 StringUtils.trimToEmpty("    abc    ") = "abc"
```

##### 1.8 public static String chop(String str)：
移除字符串中的最后一个字符。
如果字符串以“\r\n”结尾，则会将“\r\n”全部移除。
```java
 StringUtils.chop(null)          = null
 StringUtils.chop("")            = ""
 StringUtils.chop("abc \r")      = "abc "
 StringUtils.chop("abc\n")       = "abc"
 StringUtils.chop("abc\r\n")     = "abc"
 StringUtils.chop("abc")         = "ab"
 StringUtils.chop("abc\nabc")    = "abc\nab"
 StringUtils.chop("a")           = ""
 StringUtils.chop("\r")          = ""
 StringUtils.chop("\n")          = ""
 StringUtils.chop("\r\n")        = ""
 ```

##### 1.9 public static String repeat(String str,int repeat):
> str : 要复写的字符串；  
repeat : 复写的次数；  

复写一个字符串repeat次以形成一个新的字符串：  

```java
 StringUtils.repeat(null, 2) = null
 StringUtils.repeat("", 0)   = ""
 StringUtils.repeat("", 2)   = ""
 StringUtils.repeat("a", 3)  = "aaa"
 StringUtils.repeat("ab", 2) = "abab"
 StringUtils.repeat("a", -2) = ""
 ```
##### 1.10 public static String repeat(String str,String separator,int repeat):
> str : 要复写的字符串；  
separator : 分隔符；  
repeat : 复写的次数；

```java
 StringUtils.repeat(null, null, 2) = null
 StringUtils.repeat(null, "x", 2)  = null
 StringUtils.repeat("", null, 0)   = ""
 StringUtils.repeat("", "", 2)     = ""
 StringUtils.repeat("", "x", 3)    = "xxx"
 StringUtils.repeat("?", ", ", 3)  = "?, ?, ?"
 ```

 ##### 1.11 public static String repeat(char ch,int repeat):
 > ch : 要复写的字符；  
 repeat : 复写的次数;  

 复写一个字符repeat次以形成一个新的字符串：  

 ```java
 StringUtils.repeat('e', 0)  = ""
 StringUtils.repeat('e', 3)  = "eee"
 StringUtils.repeat('e', -2) = ""
  ```
##### 1.12 public static int length(CharSequence cs):
获取一个字符串的长度，若字符串为NULL，长度视作0
```java
StringUtils.length(null)  = 0
StringUtils.length("")    = 0
StringUtils.length("abc") = 3
···

##### 1.13 public static String upperCase(String str):
将一个字符串转换为大写，NULL将仍返回为NULL  
···java
 StringUtils.upperCase(null)  = null
 StringUtils.upperCase("")    = ""
 StringUtils.upperCase("aBc") = "ABC"
```

##### 1.14 public static String lowerCase(String str):
将一个字符串转换为小写，NULL将仍返回为NULL  
```java
  StringUtils.lowerCase(null)  = null
  StringUtils.lowerCase("")    = ""
  StringUtils.lowerCase("aBc") = "abc"
```
