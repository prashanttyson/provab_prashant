# Changes and improvements done:

-removed list variable and for loop because the purpose can be achieved using ListView.builder. 
if we are the ListView.builder then there is no need to build the ListItemWidget using the loop approach.
The itemBuilder inside the ListView.builder has the same purpose.
-shared_preferences can be used to persist the value of every individual item.
-_countKey is used to identify the value of current item and count is used as the current value.
-then in the initState we can initialize the _countkey with the value in SharedPreferences 
for it we have used getter(_loadCount()) and setter(_saveCount) to persist the updated value.
-_incrementCount method is there to be called on button press.it will increement the value 
  and persist the data in _saveCount .

