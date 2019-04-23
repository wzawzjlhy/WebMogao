package cn.mogao.vo;

import java.util.List;

public class CWVo {
    /**
     * 课程名称
     */
    private String name;
    /**
     * 课程下载path
     */
    private List<String> path;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getPath() {
        return path;
    }

    public void setPath(List<String> path) {
        this.path = path;
    }
}
