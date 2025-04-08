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

% --- 步骤 3: 计算编码前后码元数量并绘制压缩效率图 ---

% 1. 编码前码元数量：原始数据中的符号数量
original_symbols_count = length(input_data);  % 输入数据的符号数量

% 2. 编码后码元数量：Huffman编码后的比特数量
% 计算每个符号的编码长度，乘以该符号出现的概率
encoded_bits_count = 0;
for i = 1:length(symbol_values)
    % 获取每个符号的Huffman编码长度
    code_length = length(dict{i, 2});
    % 将每个符号的编码长度乘以它的出现概率，并累加
    encoded_bits_count = encoded_bits_count + (code_length * probabilities(i) * original_symbols_count);
end

%计算编码前数据的比特数量
original_symbols_count = original_symbols_count * 8;
% 3. 计算压缩效率
compression_efficiency =  encoded_bits_count/ original_symbols_count;

% 4. 绘制图形：x轴为编码前码元数量，y轴为压缩效率
figure;
bar(original_symbols_count, compression_efficiency);
title('Huffman编码前后码元数量对比 - 压缩效率');
xlabel('编码前码元数量');
ylabel('压缩效率');