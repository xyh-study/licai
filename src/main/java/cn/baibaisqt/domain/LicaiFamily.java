package cn.baibaisqt.domain;

/**
 * licai_family
 * 
 * @author xyh
 * @version 1.0.0 2022-01-12
 */
public class LicaiFamily implements java.io.Serializable {
    /** 版本号 */
    private static final long serialVersionUID = -935769002307599994L;

    /* This code was generated by TableGo tools, mark 1 begin. */

    /** id */
    private String id;

    /** 家庭成员名称 */
    private String fName;

    /** 会员账号 */
    private String uId;

    /* This code was generated by TableGo tools, mark 1 end. */

    /* This code was generated by TableGo tools, mark 2 begin. */

    /**
     * 获取id
     * 
     * @return id
     */
    public String getId() {
        return this.id;
    }

    /**
     * 设置id
     * 
     * @param id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取家庭成员名称
     * 
     * @return 家庭成员名称
     */
    public String getFName() {
        return this.fName;
    }

    /**
     * 设置家庭成员名称
     * 
     * @param fName
     *          家庭成员名称
     */
    public void setFName(String fName) {
        this.fName = fName;
    }

    /**
     * 获取会员账号
     * 
     * @return 会员账号
     */
    public String getUId() {
        return this.uId;
    }

    /**
     * 设置会员账号
     * 
     * @param uId
     *          会员账号
     */
    public void setUId(String uId) {
        this.uId = uId;
    }

    /* This code was generated by TableGo tools, mark 2 end. */
}