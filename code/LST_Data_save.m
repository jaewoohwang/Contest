varnames = readtable('varnames_LST,TA.csv', 'VariableNamingRule', 'preserve');

data_save(df_202001, varnames, 202001)
data_save(df_202002, varnames, 202002)
data_save(df_202003, varnames, 202003)
data_save(df_202004, varnames, 202004)
data_save(df_202005, varnames, 202005)
data_save(df_202006, varnames, 202006)
data_save(df_202007, varnames, 202007)
data_save(df_202008, varnames, 202008)
data_save(df_202009, varnames, 202009)
data_save(df_202010, varnames, 202010)
data_save(df_202011, varnames, 202011)
data_save(df_202012, varnames, 202012)
data_save(df_202101, varnames, 202101)
data_save(df_202102, varnames, 202102)
data_save(df_202103, varnames, 202103)
data_save(df_202104, varnames, 202104)
data_save(df_202105, varnames, 202105)
data_save(df_202106, varnames, 202106)
% data_save(df_202107, varnames, 202107)
% data_save(df_202108, varnames, 202108)
data_save(df_202109, varnames, 202109)
data_save(df_202110, varnames, 202110)
data_save(df_202111, varnames, 202111)
data_save(df_202112, varnames, 202112)



function data_save(data, varnames, label)
    table = array2table(data);
    table.Properties.VariableNames = varnames.Properties.VariableNames;
    writetable(table, strcat("table_", string(label), ".csv"))
end