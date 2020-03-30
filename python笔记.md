# Python
---
## Numpy  
* numpy基本操作   
`data = np.arange(12).reshape((3, 4))`  
- flip  
    `flip(m, 0) is equivalent to flipud(m)`  
    `flip(m, 1) is equivalent to fliplr(m)`
    - 转置  
    `data_t = np.transpose(data)`
    - 数组拼接  
    `np.concatenate(a,b,axis)`
        - axis=0: 合并行
        - axis=1: 合并列
    - 布尔索引
        ```
        # 复杂的条件: data中所有大于8的数字都替换为0
        # 返回一个三行四列的数组， 存储的是Bool值
        print(data>8)
        data[data>8] = 0
        print(data)
        #复杂的条件: data中所有大于8的数字都替换为0， 否则替换为1； a>b?a:b
        print(np.where(data <= 8, 1, 0))
        #裁剪: 如果data<=8, 替换称8， 如果data>=10, 替换为10;
        print(data.clip(8, 10))
        ```
- 随机数  
    ```
    numpy.random.rand() #[0, 1)之间的均匀分布
    numpy.random.randn()#均值为0，方差为1正态分布
    ```
*  数学函数  
    ```
    a = np.array([0,30,45,60,90])
    sin = np.sin(a*np.pi/180)
    inv = np.arcsin(sin)   #返回值以弧度为单位
    print (np.degrees(inv))#转化为角度制
    ```
*  舍入函数  
    * numpy.around(a,decimals)  
    decimals: 舍入的小数位数。
    默认值为0。 如果为负，整数将四舍五入到小数点左侧的位置
    * numpy.floor(a)  
    numpy.floor() 返回小于或者等于指定表达式的最大整数，即向下取整 
    * numpy.ceil(a)
    numpy.ceil() 返回大于或者等于指定表达式的最小整数，即向上取整
*  算术函数  
    ```
    add()
    subtract()
    multiply() 
    divide() 
    power()   
    exp(x)
    log(x)
    log10(x)
    sqrt(x)
    absolute(x)
    ```
*  统计函数   
    - numpy.amin()        
        用于计算数组中的元素沿指定轴的最小值。
    - numpy.amax()   
        用于计算数组中的元素沿指定轴的最大值。
    - numpy.ptp()  
        计算数组中元素沿指定轴最大值与最小值的差
    - numpy.median()  
        用于计算数组中元素的中位数（中值）
    - numpy.mean()  
        函数返回数组中元素的算术平均值。如果提供了轴，则沿其计算。 
    - 标准差  
        std = sqrt(mean((x - x.mean())**2))
    - 方差
        mean((x - x.mean())**2)
算术平均值是沿轴的元素的总和除以元素的数量。
*  矩阵乘法
    - 对位乘积  
    `np.multiply(a,b) or a * b`
    - 矩阵乘积  
    `np.matmul(a,b)`
    - 向量内积
    `np.dot(a, b)`
    - 取整、取余
    ```
    /（浮点计算）
    %（取余）
    //（取整）
    ```

*  线性代数
    - 计算模长  
    `np.linalg.norm()`
    - 叉乘
    `np.cross()`
    - 
*  strip()函数和split()函数的用法总结  
    size()和shape () 是numpy模块中才有的函数  
    - size  
            ```
            number=np.size(X)  # 计算 X 中所有元素的个数
            X_row=np.size(X,0)  #计算 X 行数
            X_col=np.size(X,1)  #计算 X 列数
            ```
    - shape  
            `X_dim=X.shape  # 以元组形式，返回数组的维数`
	- len  
	        `length=len(X)  #返回对象的长度不是元素的个数`

## 目录/文件操作  
*  创建目录
	``` 
	import os
    if not os.path.exists(path):
		os.mkdir(path)
	```
* 判断文件是否存在   
    ```
    os.path.isfile(file)  or
    os.path.exists(file)
    ```
* 获取路径下所有文件名
    ```
    imgNames = []
    for dirpath, dirnames, filenames  in os.walk(img_path):
        for file in filenames:
            imgNames.append(file)
    ```
* 获取当前路径  
    `os.getcwd()`
* 判断字符是否相等  
    `print(imgNames[0][-3:] == ".jpg")`
* 解析*.txt文件数据  
**1.** 文件每一行/列的数据个数都相同  
    `a = numpy.loadtxt('data.txt')`  
**2.** 逐行解析文件内容  
    - 示例
    ```
    Data = []
    with open('data.txt', 'r') as f:
        lines = f.readlines()  #将 txt中所有字符串读入lines
        for line in lines:
            linedata = line.strip().split()  # 将单个数据分隔开存好
            Data.append(linedata)
            
    for row in range(len(Data)):
        Data[row] = [float(x) for x in Data[row]]
    Data = np.array(Data)
    ```
# Cmake
## 基本语法
```
#添加头文件目录
include_directories()
#添加库目录
link_directories()
#添加宏定义
add_definitions(-D EXPORT)
#添加源文件
aux_source_directory(. SRC_LIST)
#添加库
add_library()# STATIC SHARED 
```




# OpenCV
---
## 图像读取
```
    img = cv.imread(imgName, cv.IMREAD_UNCHANGED)
    row,col,channel = img.shape
    num = np.size(img)  # num = row*col*channel
```
## 图像元素访问 
*  指针访问，速度最快  
    `image.ptr<Vec3b>(i)[j][0]`  
*  迭代器访问  
    `image.at<Vec3b>(i, j)[0]`  
# CPP
* 时间
    ```
    time_t nowtime;
    nowtime = time(NULL); //返回自 1970 年 1 月 1 日以来经过的秒数
    
    tm *date;
    date = localtime(&nowtime); //获取日历时间
    char tmp[64];

    strftime(tmp,sizeof(tmp),"%Y%m%d:%H:%M:%S",date);
    cout<<tmp<<endl;

    timeval tm_start;
    gettimeofday(&tm_start,NULL);//时间的更精确表示
    
    struct  timeval{
    long  tv_sec;   //秒
    long  tv_usec;  //微妙
    }；

    struct tm {
    int tm_sec;   // 秒，正常范围从 0 到 59，但允许至 61
    int tm_min;   // 分，范围从 0 到 59
    int tm_hour;  // 小时，范围从 0 到 23
    int tm_mday;  // 一月中的第几天，范围从 1 到 31
    int tm_mon;   // 月，范围从 0 到 11
    int tm_year;  // 自 1900 年起的年数
    int tm_wday;  // 一周中的第几天，范围从 0 到 6，从星期日算起
    int tm_yday;  // 一年中的第几天，范围从 0 到 365，从 1 月 1 日算起
    int tm_isdst; // 夏令时
    }
    ```
    

