package cn.mogao.pojo;
/**
 *
 * @author yq
 * @Date  2019/04/14
 *
 */
public class Log {
    private Integer logId;

    private String logUsername;

    private String logIp;

    private String logContent;

    private String logTime;

    private String logModule;

    private String logDescription;

    private Integer logAble;

    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public String getLogUsername() {
        return logUsername;
    }

    public void setLogUsername(String logUsername) {
        this.logUsername = logUsername == null ? null : logUsername.trim();
    }

    public String getLogIp() {
        return logIp;
    }

    public void setLogIp(String logIp) {
        this.logIp = logIp == null ? null : logIp.trim();
    }

    public String getLogContent() {
        return logContent;
    }

    public void setLogContent(String logContent) {
        this.logContent = logContent == null ? null : logContent.trim();
    }

    public String getLogTime() {
        return logTime;
    }

    public void setLogTime(String logTime) {
        this.logTime = logTime == null ? null : logTime.trim();
    }

    public String getLogModule() {
        return logModule;
    }

    public void setLogModule(String logModule) {
        this.logModule = logModule == null ? null : logModule.trim();
    }

    public String getLogDescription() {
        return logDescription;
    }

    public void setLogDescription(String logDescription) {
        this.logDescription = logDescription == null ? null : logDescription.trim();
    }

    public Integer getLogAble() {
        return logAble;
    }

    public void setLogAble(Integer logAble) {
        this.logAble = logAble;
    }
}