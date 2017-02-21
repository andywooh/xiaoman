package com.andywooh.xiaoman.controller;

import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

public abstract class AbstractController {

    private static Logger logger = getLogger(AbstractController.class);


    /**
     * This method is used to handle exceptions which throwed by controllers.
     * @param ex Exception
     * @param res HttpServletResponse
     * @return the error message
     */
    @ExceptionHandler
    @ResponseBody
    public void handleException(Exception ex, HttpServletResponse res) {

//        ErrorResult errorRlt;
//        if (ex instanceof CDMRestException) {
//            ErrorResult errorRlt = new ErrorResult();
//            res.setStatus(ex.getStatusCode());
//            errorRlt.setErrorCode(ex.getErrorCode());
//            errorRlt.setErrorMessage(ex.getErrorMessage());
//        }
//
//        return JsonUtil.toJson(errorRlt);
    }
    
    protected static Logger getLogger(Class<? extends AbstractController> cls){
        return Logger.getLogger(cls);
    }
}
