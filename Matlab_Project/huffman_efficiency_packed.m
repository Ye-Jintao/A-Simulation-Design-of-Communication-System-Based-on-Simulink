% MATLAB代码: 模拟实际的传输过程，包括传输Huffman字典和数据
filename = 'E:\desktop\The_Information_Theory\Github\information.txt';

% 定义不同的数据大小 j (字符数)
data_sizes = [10, 20, 50, 100, 500, 1000, 5000, 10000, 20000,29000];
compression_efficiency_dict = zeros(1, length(data_sizes));  % 存储加字典后的压缩效率
compression_efficiency_no_dict = zeros(1, length(data_sizes));  % 存储没有字典的压缩效率

for idx = 1:length(data_sizes)
    j = data_sizes(idx);
    fileID = fopen(filename, 'r');
    input_data = fread(fileID, j, '*char')';  % 读取指定数量的字符
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
    
    % 1. 编码前码元数量：原始数据中的符号数量
    original_symbols_count = length(input_data);  % 输入数据的符号数量
    
    % 2. 编码后码元数量：Huffman编码后的比特数量
    encoded_bits_count = 0;
    for i = 1:length(symbol_values)
        % 获取每个符号的Huffman编码长度
        code_length = length(dict{i, 2});
        % 将每个符号的编码长度乘以它的出现概率，并累加
        encoded_bits_count = encoded_bits_count + (code_length * probabilities(i) * original_symbols_count);
    end
    
    % 计算编码前数据的比特数量
    original_symbols_count = original_symbols_count * 8;
    
    % 3. 计算压缩效率
    compression_efficiency_dict(idx) = (encoded_bits_count + length(dict_arry)) / original_symbols_count;
 
    % 计算没有字典的 Huffman 编码压缩效率
    compression_efficiency_no_dict(idx) = encoded_bits_count / original_symbols_count;
end

% --- 步骤 4: 绘制图形 ---
% 横坐标为输入数据量（以对数方式展示），纵坐标为压缩效率
figure;
semilogx(data_sizes, compression_efficiency_no_dict, '-x', 'DisplayName', '无字典的Huffman编码压缩率');
title('Huffman编码压缩率对比');
xlabel('输入数据量（字符数）');
ylabel('压缩效率');
legend;
grid on;
