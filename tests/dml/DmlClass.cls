class DMLClass {
  void insertTest() {
    Account account = new Account(Name='Acme');
    Account[] account = new Account[]{
      new Account(Name = 'Inner Acme One'),
      new Account(Name = 'Inner Acme Two')
    };
    insert account;
    insert accounts;
    insert new Account(Name='Acme One');
    insert new Account[]{
      new Account(Name = 'Inner Acme Three'),
      new Account(Name = 'Inner Acme Four')
    };
  }
  void updateTest() {
    Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
    Account account = new Account(Id = accountId, Name = 'Acme');
    Account[] account = new Account[]{
      new Account(Id = accountId, Name = 'Inner Acme One'),
      new Account(Id = accountId, Name = 'Inner Acme Two')
    };
    update account;
    update accounts;
    update new Account(Id = accountId, Name='Acme One');
    update new Account[]{
      new Account(Id = accountId, Name = 'Inner Acme Three'),
      new Account(Id = accountId, Name = 'Inner Acme Four')
    };
  }
  void upsertWithoutOptFieldTest() {
    Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
    Account account = new Account(Id = accountId, Name = 'Acme');
    Account[] account = new Account[]{
      new Account(Name = 'Inner Acme One'),
      new Account(Id = accountId, Name = 'Inner Acme Two')
    };
    upsert account;
    upsert accounts;
    upsert new Account(Id = accountId, Name='Acme One');
    upsert new Account[]{
      new Account(Name = 'Inner Acme Three'),
      new Account(Id = accountId, Name = 'Inner Acme Four')
    };
  }
  void upsertWithOptFieldTest() {
    Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
    Account account = new Account(Id = accountId, Name = 'Acme', Description='Test Description');
    Account[] account = new Account[]{
      new Account(Name = 'Inner Acme One'),
      new Account(Id = accountId, Name = 'Inner Acme Two')
    };
    upsert account Account.Fields.External_Id__c;
    upsert accounts Account.Field.External_Id__c;
    upsert new Account(Id = accountId, Name='Acme One') Account.Fields.External_Id__c;
    upsert new Account[]{
      new Account(Name = 'Inner Acme Three'),
      new Account(Id = accountId, Name = 'Inner Acme Four')
    } Account.Fields.External_Id__c;
  }
  void deleteTest() {
    Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
    Account account = new Account(Id = accountId, Name = 'Acme');
    Account[] account = new Account[]{
      new Account(Id = accountId, Name = 'Inner Acme One'),
      new Account(Id = accountId, Name = 'Inner Acme Two')
    };
    delete account;
    delete accounts;
    delete new Account(Id = accountId, Name='Acme One');
    delete new Account[]{
      new Account(Id = accountId, Name = 'Inner Acme Three'),
      new Account(Id = accountId, Name = 'Inner Acme Four')
    };
  }
  void undeleteTest() {
    Id accountId = [SELECT Id FROM Account LIMIT 1 ALL ROWS].Id;
    Id[] accountIds = new Id[]{accountId};
    Account account = new Account(Id = accountId, Name = 'Acme');
    Account[] account = new Account[]{
      new Account(Id = accountId, Name = 'Inner Acme One'),
      new Account(Id = accountId, Name = 'Inner Acme Two')
    };
    undelete account;
    undelete accountId;
    undelete accounts;
    undelete accountIds;
    undelete new Account(Id = accountId, Name='Acme One');
    undelete new Account[]{
      new Account(Id = accountId, Name = 'Inner Acme Three'),
      new Account(Id = accountId, Name = 'Inner Acme Four')
    };
  }
  void mergeTest() {
    Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
    Id[] accountIds = new Id[]{accountId};
    Account account = new Account(Id = accountId, Name = 'Acme');
    Account anotherAccount = new Account(Id = accountId, Name = 'Another Acme');
    Account[] account = new Account[]{
      new Account(Id = accountId, Name = 'Inner Acme One'),
      new Account(Id = accountId, Name = 'Inner Acme Two')
    };
    merge account anotherAccount;
    merge account accounts;
    merge account accountId;
    merge account accountIds;

    merge new Account(Id = accountId, Name = 'Acme One') new Account(Id = accountId, Name = 'Acme Two');
    merge new Account(Id = accountId, Name = 'Acme One') new Account[]{new Account(Id = accountId, Name = 'Acme Two')};
    merge new Account(Id = accountId, Name = 'Acme One') '0010B00001kL7i0QAC';
    merge new Account(Id = accountId, Name = 'Acme One') new Id[]{'0010B00001kL7i0QAC'};
  }
}
