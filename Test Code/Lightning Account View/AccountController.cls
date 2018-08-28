public class AccountController {
@AuraEnabled
    public static List<Account> getAccountlist(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name, AccountSource, Industry, Type,Phone	FROM Account order by createdDate DESC LIMIT 10];
        return accList;
    }

    @AuraEnabled
    public static void saveAccList(List<Account> accList){
        system.debug(accList);
        update accList;
    }
}