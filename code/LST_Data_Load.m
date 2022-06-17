month_length = [31, 29, 31, 30, 31, 30, ...
                31, 31, 30, 31, 30, 31, ...
                31, 28, 31, 30, 31, 30, ...
                31, 31, 30, 31, 30, 31];

%% 2020/1 ~ 2021/6 Train set
stack_202001 = data_merge(202001, month_length(1));
stack_202002 = data_merge(202002, month_length(2));
stack_202003 = data_merge(202003, month_length(3));
stack_202004 = data_merge(202004, month_length(4));
stack_202005 = data_merge(202005, month_length(5));
stack_202006 = data_merge(202006, month_length(6));
stack_202007 = data_merge(202007, month_length(7));
stack_202008 = data_merge(202008, month_length(8));
stack_202009 = data_merge(202009, month_length(9));
stack_202010 = data_merge(202010, month_length(10));
stack_202011 = data_merge(202011, month_length(11));
stack_202012 = data_merge(202012, month_length(12));
stack_202101 = data_merge(202101, month_length(13));
stack_202102 = data_merge(202102, month_length(14));
stack_202103 = data_merge(202103, month_length(15));
stack_202104 = data_merge(202104, month_length(16));
stack_202105 = data_merge(202105, month_length(17));
stack_202106 = data_merge(202106, month_length(18));



%% 2021/7 ~ 2021/8 Validation set
% stack_202107 = data_merge(202107, month_length(19));
% stack_202108 = data_merge(202108, month_length(20));



%% 2021/9 ~ 2021/12 Test set
stack_202109 = data_merge(202109, month_length(21));
stack_202110 = data_merge(202110, month_length(22));
stack_202111 = data_merge(202111, month_length(23));
stack_202112 = data_merge(202112, month_length(24));


function stack = data_merge(date, month_length)

    stack = [];

    % 절대 경로 지정.
    path = 'E:\Contest\2022_날씨빅데이터콘테스트\자료\data\LST\원본\';
    
    for i=1:month_length
        if i<10
            data = load(strcat(path, string(date), '\', string(date), '0', string(i), '.LST.csv'));
        else
            data = load(strcat(path, string(date), '\', string(date), string(i), '.LST.csv'));
        end

        if i==1
            stack = data;
        else
            stack = cat(1, stack, data);
        end

        sprintf('%d Progress : %f percent', date, (i/month_length)*100)
    end

end