package com.SeptemberCinema.validation.userValidator;

import com.SeptemberCinema.dao.UserDao;
import com.SeptemberCinema.entity.User;
import com.SeptemberCinema.validation.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserValidation implements Validator {

    @Autowired
    private UserDao userDao;

    @Override
    public void validate(Object o) throws Exception {
        User user = (User)o;
        if (user.getFirstName().isEmpty()){
            throw new UserException(UserValidatorMessages.EMPTY_USERFIRSTNAME_FIELD);
        }else if(user.getLastName().isEmpty()){
            throw new UserException(UserValidatorMessages.EMPTY_USERlASTNAME_FIELD);
        }else if(userDao.findByLastName(user.getLastName())!= null){
            throw new UserException(UserValidatorMessages.USERLASTNAME_ALREADY_EXIST);
        }else if (user.getAge().length()==0){
            throw new UserException(UserValidatorMessages.USER_AGE_FIELD_IS_EMPTY);
        }else if(user.getAge().matches("[0-9]*")==false){
            throw new UserException(UserValidatorMessages.USER_AGE_FIELD_ONLYDIGITS);
        }else if(user.getPassword().isEmpty()){
            throw new UserException(UserValidatorMessages.USER_PASSWORD_FIELD_IS_EMPTY);
        }else if(user.getPassword().length()<8){
            throw new UserException(UserValidatorMessages.USER_PASSWORD_TO_SMALL);
        }else if (user.getEmail().isEmpty()){
            throw new UserException(UserValidatorMessages.USER_MAIL_FIELD_IS_EMPTY);
        }else if (userDao.findByEmail(user.getEmail())!=null){
            throw new UserException(UserValidatorMessages.USER_MAIL_FIELD_ALREADY_EXISTS);
        }
    }
}
