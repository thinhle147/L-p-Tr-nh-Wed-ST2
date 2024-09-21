package vn.iotstar.services;

import vn.iotstar.models.UserModel;
import vn.iotstar.dao.IUserDao;
import vn.iotstar.dao.impl.UserDaoimpl;

public class UserService implements IUserService{

    IUserDao userDao = new UserDaoimpl();

    @Override
    public UserModel findUserByUsername(String username) {
        return userDao.findByUserName(username);
    }

    @Override
    public UserModel findByUsernameAndEmail(String username, String email) {
        return userDao.findByUsernameAndEmail(username, email);
    }

    @Override
    public boolean updatePassword(String username, String newPassword) {
        return userDao.updatePassword(username, newPassword);
    }

    @Override
    public UserModel login(String username, String password) {
        UserModel userModel = this.findUserByUsername(username);
        if (userModel != null) {
            if (userModel.getPassword().equals(password)) {
                return userModel;
            }
        }
        return null;
        }
    public boolean register(String fullname, String email,String
            username ,String password) {
        if (userDao.checkExistUsername(username)) {
            return false;
        }
        long millis=System.currentTimeMillis();
        java.sql.Date date=new java.sql.Date(millis);
        userDao.insert(new UserModel(fullname,email,username,password));
        return true;
    }
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }
    @Override
    public void insert(UserModel user) {
        userDao.insert(user);
    }

}
