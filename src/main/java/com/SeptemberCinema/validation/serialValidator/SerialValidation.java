package com.SeptemberCinema.validation.serialValidator;

import com.SeptemberCinema.dao.SerialDao;
import com.SeptemberCinema.entity.Serial;
import com.SeptemberCinema.validation.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SerialValidation implements Validator {

    @Autowired
    private SerialDao serialDao;

    @Override
    public void validate(Object o) throws Exception {
        Serial serial = (Serial) o;

        if (serial.getTitle().isEmpty()){
            throw new SerialException(SerialValidationMessages.EMPTY_TITLE_FIELD);
        }else if (serialDao.findByTitle(serial.getTitle())!= null){
            throw new SerialException(SerialValidationMessages.THIS_SERIAL_ALREADY_EXISTS);
        }else if(serial.getDuration().isEmpty()){
            throw new SerialException(SerialValidationMessages.DURAITON_FIELD_IS_EMPTY);
        }else if(serial.getDuration().matches("[0-9]*")==false){
            throw new SerialException(SerialValidationMessages.DURATION_FIELD_ONLY_DIGITS);
        }else if (serial.getDescription().isEmpty()){
            throw new SerialException(SerialValidationMessages.DESCRIPTION_FIELD_IS_EMPTY);
        }else if(serial.getDescription().length()<20){
            throw new SerialException(SerialValidationMessages.DESCRIPTION_FILED_MIN_TWENTY_SYMBOLS);
        }

    }
}
