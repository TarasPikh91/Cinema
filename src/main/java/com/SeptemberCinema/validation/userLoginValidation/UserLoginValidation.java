package com.SeptemberCinema.validation.userLoginValidation;

import com.SeptemberCinema.dao.UserDao;
import com.SeptemberCinema.entity.User;
import com.SeptemberCinema.validation.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;


@Component
public class UserLoginValidation implements Validator {

    @Autowired
    private UserDao userDao;

    @Autowired
    private BCryptPasswordEncoder encoder;
    @Override
    public void validate(Object o) throws Exception {
        User user = (User)o;

        if (user.getFirstName().isEmpty()){
            throw new UserLogInException(UserLogInValidationMessages.USERNAME_FIELD_IS_EMPTY);
        }else if(user.getPassword().isEmpty()){
            throw new UserLogInException(UserLogInValidationMessages.EMPTY_PASSWORD_FIELD);
        }else if(userDao.findByFirstName(user.getFirstName())== null){
            throw new UserLogInException(UserLogInValidationMessages.WRONG_PASSWORD_OR_USERNAME);
        }else if (encoder.matches(user.getPassword(), userDao.findByFirstName(user.getFirstName()).getPassword())){
            throw new UserLogInException(UserLogInValidationMessages.WRONG_PASSWORD_OR_USERNAME);
        }
    }
}
