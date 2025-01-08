public class UpdateAccountTrigger implements Queueable

{

    List <Account> AccountsToUpdate= new List<Account>();

    public UpdateAccountTrigger (List<Account> TriggeredAccList )

    {

        AccountsToUpdate = TriggeredAccList ;

    }

    public void execute(QueueableContext context)

    {

        for(Account acc: AccountsToUpdate)

        {

            if (acc.Name == 'Test')

            {

                acc.Name ='New Name';

            }

        }

        update AccountsToUpdate;

    }

}