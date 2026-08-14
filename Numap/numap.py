def var_choose():

    import socket
    import time

    # 创建TCP/IP socket
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # 连接到LabVIEW服务器（假设在本地运行，使用IP地址127.0.0.1和端口5000）
    client_socket.connect(('127.0.0.1', 5000))

    try:
        while True:
            # 接收数据
            data = client_socket.recv(1024)  # 设置缓冲区大小
            if not data:
                break
            
            # 将接收到的数据解码为字符串
            data_str = data.decode('utf-8')

            # 将字符串按逗号分隔为多个数据
            data_list = data_str.split(',')

            # 将分割出来的字符串数据转换为浮点数
            data1 = float(data_list[0])
            data2 = float(data_list[1])
            data3 = float(data_list[2])

            # 打印接收到的多个数据
            #print(f"Received data1: {data1}, data2: {data2}, data3: {data3}")

            # 每3秒获取一次数据
            #time.sleep(3)
            var=[data1,data2,data3]

    finally:
        client_socket.close()

    return var