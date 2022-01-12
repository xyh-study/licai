package cn.baibaisqt.common;

/**
 * 针对layui中table数据格式
 * TableResult<T> 代表java中泛型应用，表示任意对象
 */
public class TableResult<T> {
    private int code;
    private String msg;
    private int count;
    private T data;

    public TableResult() {
    }

    public TableResult(int code, String msg, int count, T data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
