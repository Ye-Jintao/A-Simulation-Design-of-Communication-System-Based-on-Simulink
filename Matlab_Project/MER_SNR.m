% 步骤 1: 从文件中读取数据
filename = 'information.txt';
SNR_count_values = [ 5,6,7, 8, 9, 10, 11, 12];  % 需要遍历的SNR值
WER = zeros(1, length(SNR_count_values));  % 用于存储每个SNR下的误码率

for n = 1:length(SNR_count_values)
    % 读取文件中的前 n 个字符
    char_count = 1000;  % 例如，读取1000个字符
    fileID = fopen(filename, 'r');
    input_data = fread(fileID, 30000, '*char')';  % 读取字符数据
    fclose(fileID);

    % 步骤 2: 仅保留ASCII字符
    % input_data = input_data(input_data <= char(127));  % 过滤掉所有非ASCII字符

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

    % --- 字典序列化与打包 ---
    dict_size = length(dict);  % 字典的大小
    dict_str = dec2bin(dict_size,8);
    dict_arry = double(dict_str) - double('0');
    
    % 将字典中的每个符号及其对应的编码转为二进制表示
    for k = 1:dict_size
        symbol = dict{k, 1};  % 获取符号 ASCII 值
        huffman_code = dict{k, 2};  % 获取该符号的 Huffman 编码
        huffman_length = length(huffman_code);  % Huffman码的长度
        symbol_str = dec2bin(symbol, 8);
        huffman_length_str = dec2bin(huffman_length, 5);
        symbol_array = double(symbol_str) - double('0');
        huffman_length_array = double(huffman_length_str) - double('0');
        % 把所有字符串转换为数组
        % 将符号和对应的 Huffman 编码拼接到一起
        dict_arry = [dict_arry, symbol_array, huffman_length_array, huffman_code];  % 将其拼接到最终数据中
    end

    % --- 步骤 4: 信道编码 ---
    packed_message = [dict_arry, encoded_data]; % 将字典和编码数据拼接起来作为完整消息
    trellis = poly2trellis(7, [171 133]);  % 7级约束长度和生成多项式
    encoded_data_conv = convenc(packed_message, trellis);

    % --- 步骤 5: 调制 ---
    modulated_data = pskmod(encoded_data_conv, 4, pi/4);  % 对整个打包的消息进行调制

    % 步骤 6: 通过AWGN信道传输信号
    SNR = SNR_count_values(n);  % 使用当前SNR值
    received_signal = awgn(modulated_data, SNR, 'measured'); % 添加噪声

    % --- 步骤 7: 接收端解调 ---
    demodulated_data = pskdemod(received_signal, 4, pi/4);
    % 将解调数据转换为硬判决二进制数据
    hard_decision_data = real(demodulated_data) > 0;  % 判断实部是否大于零
    hard_decision_data = double(hard_decision_data);  % 转换为 double 类型
    hard_decision_data = hard_decision_data(:);  % 展平成列向量

    % 步骤 8: 信道解码 - 使用卷积解码
    decoded_data_conv = vitdec(hard_decision_data, trellis, 35, 'trunc', 'hard');

    % 步骤 9: 信源解码
    % 解包字典大小与字典二进制数据
    received_dict_size = bi2de(decoded_data_conv(1:8)', 'left-msb');  % 获取字典大小部分
    current_pos = 9;  % 字典部分开始的当前位置
    % 初始化接收到的字典
    received_dict = cell(received_dict_size, 2);  % 每个字典项包含符号和值
    for k = 1:received_dict_size
        % 恢复符号（8位ASCII码）
        symbol = bi2de(decoded_data_conv(current_pos:current_pos+7)', 'left-msb');
        current_pos = current_pos + 8;  % 移动到下一个位置
        % 恢复Huffman编码长度（5位）
        huffman_length = bi2de(decoded_data_conv(current_pos:current_pos+4)', 'left-msb');
        current_pos = current_pos + 5;  % 移动到下一个位置
        % 恢复Huffman编码（huffman_length位二进制）
        huffman_code_bin = decoded_data_conv(current_pos:current_pos+huffman_length-1)';  % 获取二进制数据
        current_pos = current_pos + huffman_length;  % 移动到下一个位置
        % 保存符号及其对应的Huffman编码
        received_dict{k, 1} = symbol;  % 符号（整数）
        received_dict{k, 2} = huffman_code_bin;  % Huffman编码（二进制数组）
    end
    % 使用接收到的字典解码数据
    decoded_data_without_dict = decoded_data_conv(current_pos:end);
    decoded_data = huffmandeco(decoded_data_without_dict, received_dict);

    % 步骤 10: 计算误码率并可视化
    % 生成字符数量变量，用于遍历
    % 比较单词的误差率
    % 将 input_data 转换为对应的 ASCII 数值数组
    input_data_numeric = double(input_data);  % 转换为对应的 ASCII 数值（double 类型）
    
    % 将 decoded_data 转换为字符数组
    decoded_data_char = char(decoded_data');  % 将解码数据转换为字符数组
    
    % 按照空格分割文本，得到单词
    input_words = strsplit(input_data);  % 将原始数据按单词分割
    decoded_words = strsplit(decoded_data_char);  % 将解码数据按单词分割
    
    % 比较原始输入单词与解码后的单词
    word_errors = sum(~ismember(decoded_words, input_words));  % 查找解码后不在输入中的单词
    word_error_rate = word_errors / length(input_words);  % 计算单词级别的误差率

    % 存储误码率
    WER(n) = word_error_rate;
end

% 步骤 11: 绘制误码率与SNR的关系
figure;
semilogy(SNR_count_values, WER, 'LineWidth', 2);  % 使用对数尺度显示X轴
title('误码率（WER）与信噪比的关系');
xlabel('信噪比 (SNR) [dB]');
ylabel('单词误码率 (WER)');
ylim([0,0.1]);
xlim([5,13]);
grid on;
