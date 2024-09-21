package vn.iotstar;

import vn.iotstar.configs.DBConnectMySQL;
import vn.iotstar.models.UserModel;
import vn.iotstar.services.UserService;
import vn.iotstar.services.IUserService;
import java.sql.Connection;

public class Program {
    public static void main(String[] args) {
        UserModel user = new UserModel("1","lexuanthinh1473@gmail.com","123","1");
        IUserService use = new UserService();
        use.insert(user);
//    	Connection conn = new DBConnectMySQL().getDatabaseConnection();
//		   if(conn !=null)
//			   System.out.print("OK");
    }
}
