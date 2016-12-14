package com.fh.entity;

import java.util.Date;

/**
 * Created by admin on 2016/4/14.
 */
public class ApplicationUser {

    /**
     *
     */
    private static final long serialVersionUID = 5453612623271931808L;
    private int id;
    private String uuid;
    private String userName;
    private String password;
    private long lastLoginTime;
    private long createTime;
    private String email;
    private boolean status;
    private String realName;
    private int balance;
    private String mobile;
    private int score;
    private String notes;
    private byte sex;
    private int loginCount;
    private boolean allowCod;
    private String sessionId;
    private int areaId;
    private String openId;
    private String unionSource;
    private String allowEmployee;
    private String refuseEmployee;
    private int allowSex;
    private String source;
    private String latestLoginSource;
    private String open_id;
    private int level_score;
    private String level_name;
    private String level_update_name;
    private Date level_update_time;




    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public long getCreateTime() {
        return createTime;
    }
    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public long getLastLoginTime() {
        return lastLoginTime;
    }
    public void setLastLoginTime(long lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public boolean getStatus() {
        return status;
    }
    public void setStatus(boolean status) {
        this.status = status;
    }
    public String getRealName() {
        return realName;
    }
    public void setRealName(String realName) {
        this.realName = realName;
    }
    public int getBalance() {
        return balance;
    }
    public void setBalance(int balance) {
        this.balance = balance;
    }
    public int getScore() {
        return score;
    }
    public void setScore(int score) {
        this.score = score;
    }
    public String getNotes() {
        return notes;
    }
    public void setNotes(String notes) {
        this.notes = notes;
    }
    public byte getSex() {
        return sex;
    }
    public void setSex(byte sex) {
        this.sex = sex;
    }
    public int getLoginCount() {
        return loginCount;
    }
    public void setLoginCount(int loginCount) {
        this.loginCount = loginCount;
    }
    public boolean getAllowCod() {
        return allowCod;
    }
    public void setAllowCod(boolean allowCod) {
        this.allowCod = allowCod;
    }
    public String getSessionId() {
        return sessionId;
    }
    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }
    public int getAreaId() {
        return areaId;
    }
    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }
    public String getOpenId() {
        return openId;
    }
    public void setOpenId(String openId) {
        this.openId = openId;
    }
    public String getUnionSource() {
        return unionSource;
    }
    public void setUnionSource(String unionSource) {
        this.unionSource = unionSource;
    }
    public String getAllowEmployee() {
        return allowEmployee;
    }
    public void setAllowEmployee(String allowEmployee) {
        this.allowEmployee = allowEmployee;
    }
    public String getRefuseEmployee() {
        return refuseEmployee;
    }
    public void setRefuseEmployee(String refuseEmployee) {
        this.refuseEmployee = refuseEmployee;
    }
    public int getAllowSex() {
        return allowSex;
    }
    public void setAllowSex(int allowSex) {
        this.allowSex = allowSex;
    }
    public String getSource() {
        return source;
    }
    public void setSource(String source) {
        this.source = source;
    }

    public String getLatestLoginSource() {
        return latestLoginSource;
    }

    public void setLatestLoginSource(String latestLoginSource) {
        this.latestLoginSource = latestLoginSource;
    }

    public String getOpen_id() {
        return open_id;
    }

    public void setOpen_id(String open_id) {
        this.open_id = open_id;
    }

    public int getLevel_score() {
        return level_score;
    }

    public void setLevel_score(int level_score) {
        this.level_score = level_score;
    }

    public String getLevel_name() {
        return level_name;
    }

    public void setLevel_name(String level_name) {
        this.level_name = level_name;
    }

    public String getLevel_update_name() {
        return level_update_name;
    }

    public void setLevel_update_name(String level_update_name) {
        this.level_update_name = level_update_name;
    }

    public Date getLevel_update_time() {
        return level_update_time;
    }

    public void setLevel_update_time(Date level_update_time) {
        this.level_update_time = level_update_time;
    }
}
