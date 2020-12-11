% ECR亲密关系体验量表 数据处理
% 原文：https://wenku.baidu.com/view/f733343577232f60ddcca1ba.html
% 参考：http://doc.100lw.com/doc/ab1accdd06f232775343337f

%% 用户输入
my_answer=[1, 2, 7, 2, 1, 2, 2, 2, 1, 2, 2, 1, 1, 1, 7, 2, 2, 2, 2, 2, 7, 6, 2, 2, 7, 6, 6, 1, 4, 1, 6, 2, 6, 4, 2, 1];
% excel中填写后，可用https://echarts.apache.org/zh/spreadsheet.html表格工具生成变量

%% 预置信息
idx_invert=[3,15,19,25,27,29,31,33,35,22]; % 反向计分题
idx_avoidance=1:2:36; % 依恋回避维度：奇数题
idx_anxiety=2:2:36; % 依恋焦虑维度：偶数题

%% 数据处理
score_after_invert=my_answer;
score_after_invert(idx_invert)=8-score_after_invert(idx_invert); 

% % for test
% score_excel=[1, 2, 1, 2, 1, 2, 2, 2, 1, 2, 2, 1, 1, 1, 1, 2, 2, 2, 6, 2, 7, 2, 2, 2, 1, 6, 2, 1, 4, 1, 2, 2, 2, 4, 6, 1];
% score_after_invert==score_excel
% % ok

avoidance=mean(score_after_invert(idx_avoidance)); % 依恋回避维度
anxiety=mean(score_after_invert(idx_anxiety)); % 依恋焦虑维度
sec2 =avoidance*3.2893296+anxiety*5.4725318-11.5307833; % 安全维度
fear2 =   avoidance*7.2371075+   anxiety*8.1776448-32.3553266; % 惧怕维度
pre2 =   avoidance*3.9246754+   anxiety*9.7102446-28.4573220; % 专注维度
dis2 =   avoidance*7.3654621+   anxiety*4.9392039-22.22810880; % 冷淡维度

%% 输出
fprintf('回避维度得分为 %.1f;\n',avoidance)
fprintf('焦虑维度得分为 %.1f;\n',anxiety)
fprintf('安全维度得分为 %.1f;\n',sec2)
fprintf('惧怕维度得分为 %.1f;\n',fear2)
fprintf('专注维度得分为 %.1f;\n',pre2)
fprintf('冷淡维度得分为 %.1f;\n',dis2)
fprintf('依恋类型：')
if sec2==max([sec2,fear2,pre2,dis2])
    att2=1;
    fprintf('安全型')
end
if fear2==max([sec2,fear2,pre2,dis2])
    att2=2;
    fprintf('惧怕型')
end
if pre2==max([sec2,fear2,pre2,dis2])
    att2=3;
    fprintf('专注型')
end
if dis2==max([sec2,fear2,pre2,dis2])
    att2=4;
    fprintf('冷漠型')
end
fprintf('\n')

% 预期输出样式
%{
回避维度得分为 2.4;
焦虑维度得分为 2.1;
安全维度得分为 7.8;
惧怕维度得分为 2.1;
专注维度得分为 1.1;
冷淡维度得分为 5.9;
依恋类型：安全型
%}