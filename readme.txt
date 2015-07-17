fmdatabase + databasemanager

This category provides convenient CRUD query methods for FMDataBase.
We are using inheritance for calling the CRUD methods in the model classes. The methods are declared publicly in the base class so we can call the methods on any subclass of the base class without bothering about which class it is.

Please see the model classes, the BaseDBModel and CountryModel class for further clarifications.

We have displayed the data in tables. We are having two tables “countries” and “zone” for states which we are using.

