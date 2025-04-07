% 清除工作区和关闭所有模型
clear all; close all; bdclose all;
% 定义 SNR 范围
EbNo_db_range = 0:2:10;
BER_sim = zeros(size(EbNo_db_range));

% 设置信源帧长（需是4的倍数）
frameSize = 1000 - mod(1000,4); % 确保整除
set_param('comm_hamming_bpsk/Random Integer Generator', 'SamplesPerFrame', num2str(frameSize));

for i = 1:length(EbNo_db_range)
    EbNo_db = EbNo_db_range(i);
    simOut = sim('comm_hamming_bpsk.slx', 'StopTime', '10000');
    BER_sim(i) = simOut.ErrorVec(1);
end

% 关闭模型
bdclose('comm_hamming_bpsk.slx');

% 绘制 BER 曲线
semilogy(EbNo_db_range, BER_sim, 'b-o', 'LineWidth', 1.5);
grid on;
xlabel('Eb/No (dB)');
ylabel('Bit Error Rate (BER)');
title('Hamming(7,4) + BPSK in AWGN Channel');
hold on;

% 叠加理论 BPSK 曲线（对比）
theory_BER = berawgn(EbNo_db_range, 'psk', 2, 'nondiff');
semilogy(EbNo_db_range, theory_BER, 'r--', 'LineWidth', 1.5);
legend('Simulation (Hamming+BPSK)', 'Theory (BPSK only)');