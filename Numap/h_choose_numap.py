
def topsis(new_variables):
    
    import numpy as np
    import pandas as pd


    # 转为 ndarray，方便切片
    #new_variables = np.asarray(new_variables)

    # ✅ 保存第 5 个输入
    #fifth_value = new_variables[4]

    # ✅ 计算只使用前 4 个
    #new_variables = new_variables[:4]

    excel_file = "C:/Users/Administrator/Desktop/Numap/h.xlsx"
    weights = np.array([0.3, 0.3, 0.1, 0.3])  # 自变量权重
    
    # Step 1: 读取数据
    data = pd.read_excel(excel_file)
    independent_vars = data.iloc[:, :4].to_numpy()  # 自变量
    dependent_vars = data.iloc[:, 5:25].to_numpy()  # 因变量

    # Step 2: 归一化处理
    #min_vals = independent_vars.min(axis=0)
    #max_vals = independent_vars.max(axis=0)

    #norm_independent_vars = (independent_vars - min_vals) / (max_vals - min_vals)
    #norm_new_variables = (new_variables - min_vals) / (max_vals - min_vals)

    l1_norm = np.sum(np.abs(independent_vars), axis=0)
    norm_independent_vars = independent_vars / (l1_norm + 1e-8)
    norm_new_variables = new_variables / (l1_norm + 1e-8)

    # Step 3: 加权处理
    weighted_independent_vars = norm_independent_vars * weights
    weighted_new_variables = norm_new_variables * weights

    # Step 4: 计算距离
    #distances = np.sqrt(((weighted_independent_vars - weighted_new_variables) ** 2).sum(axis=1))

    p = 3
    distances = np.sum(np.abs(weighted_independent_vars - weighted_new_variables) ** p, axis=1) ** (1 / p)

    # Step 5: 找到最接近的1组数据
    best_index = np.argmin(distances)

    result = dependent_vars[best_index].tolist()
    #result.append(fifth_value)

    return result

    #return dependent_vars[best_index].tolist()
    #return np.asarray(dependent_vars[best_index], dtype=float).reshape((20,))
#column_names = ["T1", "p2","G","Q_total"]
target_columns = [25.1, 8200000, 0.014,3500]

# 调用函数
best_match = topsis( target_columns)



print(f"最佳匹配行的值: {best_match}")