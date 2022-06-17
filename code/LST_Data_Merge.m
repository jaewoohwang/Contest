%% LST, TA가 outlier인 행 제거
df_202001 = Data_Preprocess(stack_202001);
df_202002 = Data_Preprocess(stack_202002);
df_202003 = Data_Preprocess(stack_202003);
df_202004 = Data_Preprocess(stack_202004);
df_202005 = Data_Preprocess(stack_202005);
df_202006 = Data_Preprocess(stack_202006);
df_202007 = Data_Preprocess(stack_202007);
df_202008 = Data_Preprocess(stack_202008);
df_202009 = Data_Preprocess(stack_202009);
df_202010 = Data_Preprocess(stack_202010);
df_202011 = Data_Preprocess(stack_202011);
df_202012 = Data_Preprocess(stack_202012);

df_202101 = Data_Preprocess(stack_202101);
df_202102 = Data_Preprocess(stack_202102);
df_202103 = Data_Preprocess(stack_202103);
df_202104 = Data_Preprocess(stack_202104);
df_202105 = Data_Preprocess(stack_202105);
df_202106 = Data_Preprocess(stack_202106);
% df_202107 = Data_Preprocess(stack_202107);
% df_202108 = Data_Preprocess(stack_202108);
df_202109 = Data_Preprocess(stack_202109);
df_202110 = Data_Preprocess(stack_202110);
df_202111 = Data_Preprocess(stack_202111);
df_202112 = Data_Preprocess(stack_202112);


function df = Data_Preprocess(data)
    
    %% Outlier 제거
    outlier = -999;
    LST_idx = 5;
    TA_idx = 30;

    df = data(data(:, LST_idx)~=outlier, :);
    df = df(df(:, TA_idx)~=outlier, :);


    %% 날짜 변수 생성
    temp = df(:,1);
    datetime_sliced = [floor(temp(:,1)/100000000) mod(floor(temp(:,1)/1000000),100) mod(floor(temp(:,1)/10000),100) ...
        mod(floor(temp(:,1)/100),100) mod(temp(:,1),100)];
    df = [df datetime_sliced];


    %% 상관성이 높은 변수들의 평균 계산
    df = Take_Average(df, 6:23);
    df = Take_Average(df, 34:37);
    df = Take_Average(df, 38:39);
    df = Take_Average(df, 40:42);
    df = Take_Average(df, 43:44);

end


function result = Take_Average(data, idx)

    outlier = -999;
    df = data(:, idx);

    for i=1:length(idx)
        ith_col = df(:, i);
        ith_col_observe = ith_col(ith_col~=outlier);
        df(ith_col~=outlier, i) = normalize(ith_col_observe);
    end


    rownum = length(df(:, 1));
    colnum = length(df(1, :));
    
    count_outlier = sum(df==outlier, 2);
    
    bool_outlier = count_outlier~=colnum;
    
    count_observe = colnum-count_outlier;
    
    new = zeros(rownum, 1);
    
    temp = sum(df, 2) - outlier*ones(rownum, 1).*count_outlier;
    
    new(bool_outlier) =  temp(bool_outlier);
    
    new(bool_outlier) = new(bool_outlier)./count_observe(bool_outlier);

    result = [data new];
end