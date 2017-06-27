package org.ljy.controller;

import org.ljy.common.MsgConstants;
import org.ljy.domain.BankCard;
import org.ljy.domain.User;
import org.ljy.service.BankCardService;
import org.ljy.service.UserService;
import org.ljy.util.AjaxUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by ljy56 on 2017/5/11.
 */
@Controller
public class BankCardController extends BaseController{
    @Resource
    private UserService userService;

    @Resource
    private BankCardService bankCardService;

    @RequestMapping("/bankcard/info")
    public String bankCardInfoPage(HttpSession session,HttpServletRequest request){
        try {
            User user = (User) session.getAttribute("user");
            List<BankCard> bankCards = bankCardService.queryBankCard(user.getUserId());
            request.setAttribute("myBankCards",bankCards);
        } catch (Exception e) {
            LOG.warn(e.getMessage(),e);
        }
        return "bankcard/bankcardInfo";
    }

    @RequestMapping("/bankcard/addBankCard")
    @ResponseBody
    public Map<String,String> addBankCard(HttpServletRequest request, BankCard bankCard){
        Map<String, String> ajaxMap;
        try {
            boolean bool = bankCardService.addBankCard(bankCard);
            if(bool){
                ajaxMap = AjaxUtil.generateResponseAjax("1", MsgConstants.OPERATE_SUCCESS);
            }else{
                ajaxMap = AjaxUtil.generateResponseAjax("0",MsgConstants.OPERATE_FAILURE);
            }
            return ajaxMap;
        } catch (Exception e) {
            LOG.warn(e.getMessage(),e);
            ajaxMap = AjaxUtil.generateResponseAjax("0",MsgConstants.SYSTEM_ERROR);
            return ajaxMap;
        }
    }

    @RequestMapping("/bankcard/deleteBankCard")
    @ResponseBody
    public Map<String,String> deleteBankCard(HttpServletRequest request, Long bankCardId){
        Map<String, String> ajaxMap;
        try {
            boolean bool = bankCardService.deleteBankCardByBankCardId(bankCardId);
            if(bool){
                ajaxMap = AjaxUtil.generateResponseAjax("1", MsgConstants.OPERATE_SUCCESS);
            }else{
                ajaxMap = AjaxUtil.generateResponseAjax("0",MsgConstants.OPERATE_FAILURE);
            }
            return ajaxMap;
        } catch (Exception e) {
            LOG.warn(e.getMessage(),e);
            ajaxMap = AjaxUtil.generateResponseAjax("0",MsgConstants.SYSTEM_ERROR);
            return ajaxMap;
        }
    }
}
