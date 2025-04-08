% MATLAB代码: 模拟实际的传输过程，包括传输Huffman字典和数据

% 步骤 1: 从文件中读取数据
filename = 'E:\desktop\The_Information_Theory\Github\information.txt';
fileID = fopen(filename, 'r');
input_data = fread(fileID, '*char')';  % 读取整个文件作为字符数组
fclose(fileID);

% 步骤 2: 仅保留ASCII字符
input_data = input_data(input_data <= char(127));  % 过滤掉所有非ASCII字符

% 步骤 3: 信源编码 - 使用Huffman编码
symbols = unique(input_data);  % 获取文件中的唯一字符
symbol_values = double(symbols);  % 转换为数字（ASCII值）

% 计算每个符号的概率
probabilities = zeros(1, length(symbol_values));
for i = 1:length(symbol_values)
    probabilities(i) = sum(input_data == symbols(i)) / length(input_data);
end

% 使用Huffman算法生成字典
[dict, avglen] = huffmandict(symbol_values, probabilities);
% 对输入数据进行Huffman编码
encoded_data = huffmanenco(double(input_data), dict);

% ---字典序列化与打包 ---
dict_size = length(dict);  % 字典的大小
dict_str = dec2bin(dict_size, 8);  % 将字典大小转为二进制字符串
dict_arry = double(dict_str) - double('0');

% 将字典中的每个符号及其对应的编码转为二进制表示
for k = 1:dict_size
    symbol = dict{k, 1};  % 获取符号 ASCII 值
    huffman_code = dict{k, 2};  % 获取该符号的 Huffman 编码
    huffman_length = length(huffman_code);  % Huffman码的长度
    symbol_str = dec2bin(symbol, 8);
    huffman_length_str = dec2bin(huffman_length, 3);
    symbol_array = double(symbol_str) - double('0');
    huffman_length_array = double(huffman_length_str) - double('0');
    % 将符号和对应的 Huffman 编码拼接到一起
    dict_arry = [dict_arry, symbol_array, huffman_length_array, huffman_code];
end

% --- 步骤 4: 信道编码 ---
packed_message = [dict_arry, encoded_data]; % 将字典和编码数据拼接起来作为完整消息
trellis = poly2trellis(7, [171 133]);  % 7级约束长度和生成多项式
encoded_data_conv = convenc(packed_message, trellis);

% --- 步骤 5: 调制 ---
modulated_data = pskmod(encoded_data_conv, 4, pi/4);  % 对整个打包的消息进行调制

% 步骤 6: 通过AWGN信道传输信号
SNR = 10;  % 信噪比
received_signal = awgn(modulated_data, SNR, 'measured'); % 添加噪声

% --- 步骤 7: 接收端解调 ---
demodulated_data = pskdemod(received_signal, 4, pi/4);

% 将解调数据转换为硬判决二进制数据
hard_decision_data = real(demodulated_data) > 0;  % 判断实部是否大于零
hard_decision_data = double(hard_decision_data);  % 转换为 double 类型
hard_decision_data = hard_decision_data(:);  % 展平成列向量 

% --- 步骤 8: 信道解码 - 使用卷积解码 ---
decoded_data_conv = vitdec(hard_decision_data, trellis, 35, 'trunc', 'hard');

% --- 绘制调制前、调制后和经过AWGN信道后的波形对比 ---

% 获取调制前后的信号（这里取前500个点进行对比）
encoded_data_sample = encoded_data_conv(1:500);  % 信道编码后的数据
SNR = 10;  % 信噪比

% 创建一个图，绘制三个波形
figure;

% 获取时间序列（假设采样频率为500Hz，取前500个样本）
t = (1:500)/500;

% 1. 绘制调制前的数据波形（使用方波表示编码后的数据）
hold on;
% 2. 绘制调制后的数据波形（正弦波表示QPSK调制信号）
modulated_data_sample = pskmod(encoded_data_sample, 4, pi/4);  % 使用QPSK调制
plot(t, modulated_data_sample, 'r', 'LineWidth', 1.5);  % 绘制实部（红色正弦波）

% 3. 绘制经过AWGN信道后的数据波形
received_signal = awgn(modulated_data_sample, SNR, 'measured'); % 添加噪声

plot(t, received_signal, 'b', 'LineWidth', 1.5);  % 绘制噪声后的虚部（蓝色虚线）

% 标题和标签
title('Comparison of Signals: Before and After QPSK Modulation and AWGN Channel');
xlabel('Time (s)');
ylabel('Signal Amplitude');
legend( 'Modulated Data', 'After AWGN');

% 显示网格
grid on;

