# collision-separation
1.仿真数据

它的主程序名为“main_simulated_data”，当对2个冲突标签进行分离时，我们在主程序
的第七行设置Tag=2（Tag=3/4则表示冲突标签数为3/4的情况），而且可以通过设置第八行SNR的数值，检验SNR对于分离的影响。

2.实测数据

它的主程序名为“main_measured_data”，在USRP采集到的实测数据下，当对2个冲突标签分离时，需要更改第11行为：Tag=TagNum(1)；Tag=TagNum(2)和Tag=TagNum(3)分别表示3和4个冲突标签的情况。


注：实测数据通过以下链接和提取码进行下载。


链接：https://pan.baidu.com/s/1KJrP4OkzGkV-rvV8ZvOhVA 

提取码：9527 


文件夹“measured data”中，
source_2tags为USRP系统采集到的2个冲突标签数据；
source_3tags为USRP系统采集到的3个冲突标签数据；
source_4tags为USRP系统采集到的4个冲突标签数据.
