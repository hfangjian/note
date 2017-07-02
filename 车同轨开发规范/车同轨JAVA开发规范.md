<center style="font-size:26px">车同轨科技有限公司JAVA开发规范</center >
## 一、编程规约
### （一）命名规约
1. **【强制】** 代码中的命名严禁使用拼音与英文混合的方式，更不允许直接使用中文的方式。 说明：正确的英文拼写和语法可以让阅读者易于理解，避免歧义。注意，即使纯拼音命名方式也要避免采用。  
<font color=#ff0033>反例</font>： DaZhePromotion [打折] / getPingfenByName() [评分] / int 某变量 = 3   
<font color=#00ff00>正例</font>： alibaba / taobao / youku / hangzhou 等国际通用的名称，可视同英文。

2. **【强制】** 方法名、参数名、成员变量、局部变量都统一使用lowerCamelCase风格，必须遵从驼峰形式。  
<font color=#00ff00>正例</font>： localValue / getHttpMessage() / inputUserId

3. **【强制】** 常量命名全部大写，单词间用下划线隔开，力求语义表达完整清楚，不要嫌名字长。  
<font color=#ff0033>反例</font>： MAX_COUNT   
<font color=#00ff00>正例</font>： MAX_STOCK_COUNT  

4. **【推荐】** 接口类中的方法和属性不要加任何修饰符号（public 也不要加），保持代码的简洁性，并加上有效的Javadoc注释。尽量不要在接口里定义变量，如果一定要定义变量，肯定是与接口方法相关，并且是整个应用的基础常量。  
<font color=#00ff00>正例</font>：接口方法签名：void f(); 接口基础常量表示：String COMPANY = "ctg";  
<font color=#ff0033>反例</font>：接口方法定义：public abstract void f();    

5. **【强制】** 对于Service和DAO类，基于SOA(Service-Oriented Architecture)的理念，暴露出来的服务一定是接口，内部的实现类用Impl的后缀与接口区别。接口命名以"I"开头，如IUserService，其实现类以Impl结尾，如UserServiceImpl。  
<font color=#00ff00>正例</font>：UserServiceImpl实现IUserService接口。

6. **【参考】** 各层命名规约：  
A) Service/DAO层方法命名规约  
1） 获取单个对象的方法用get做前缀。  
2） 获取多个对象的方法用list做前缀。  
3） 获取统计值的方法用count做前缀。  
4） 插入的方法用save（推荐）或insert做前缀。  
5） 删除的方法用remove（推荐）或delete做前缀。  
6） 修改的方法用update做前缀。

7. **【强制】**
<font color=#ff0033>反例</font>：    
<font color=#00ff00>正例</font>：
