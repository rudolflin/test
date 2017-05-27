/*package generateTable;



DBTable(name = "User")                    // 设置表名为User
public class User {
   @SQLString(size = 50)                  // 设置字段 username, varchar(50)
   String username;
   
    @SQLString(size = 50)
    String password;
    
    @SQLString(size = 30, constraints = @Constraints(primaryKey = true)) // 设置为主键
    String handle;
    
    static int memberCount;               

    public String getUsername() { return username; }
    
    public void setUsername(String username) { this.username = username; }// 个人感觉set方法可以去掉

    public String getPassword() { return password; }
    
    public void setPassword(String password) { this.password = password; }
    
    public String getHandle() {    return handle; }

    public void setHandle(String handle) { this.handle = handle; }
    
    public String toString() { return handle; }  
}*/