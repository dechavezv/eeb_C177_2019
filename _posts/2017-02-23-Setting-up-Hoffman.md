---
layout: post
title: "How To sett up Hoffman account"
description: "Guide to setup you Hoffman account and "
category: articles
---

This week, We will set the working enviroment fo the entire couse of the class. For this we will is Hoffman2 Cluster that consists of ~1,200 nodes and 13,340 cores, with an aggregate of over 50TB of memory. You can find more information about Hoffman2 [here](https://idre.ucla.edu/hoffman2)<sup>0</sup>.  

## Apply for an account 
You have to apply for an account on a cluster hosted by IDRE. To get an account go to the following [link](https://www.hoffman2.idre.ucla.edu/getting-started/#New_User_Registration_lt-_Click_here_to_apply_for_an_account_on_a_cluster_hosted_by_IDRE)<sup>0</sup>. Click "New User Registration". You should be redirected to the UCLA Authentication. Then, a window should appear asking for some information such as Username and Pasword. Please for **Sponsor** select "IDRE HPC" and for **Preferred Shell** chose "Bash".  

## Login for the first time into your Account
from the terminal type  
`ssh login-id@hoffman2.idre.ucla.edu`

If everything worked fine you shouls see something like this:
![]({{ site.url }}/images/Login_Daniel_hoffman.png)

If you're here, congrats! You have a functioning hoffman account.

## Basic commands in Hoffman2
Now that you have loggin in into an account lets try some basic commands. 
Change your password by command  
`passwd`

Configure your shell (command-line interpreter/scripts):  
`echo $SHELL`

Go to yout Home directory  
`cd $HOME`
The name of your home directory is like `/u/home/u/username` where u is the first character of your username. For example, if your user name is “bruin”, your home directory is `/u/home/b/bruin`.

To check disk usage type `df -h`

The following is a exmaple of a python script. DO NOT delete yet  
{% highlight python %}
class Cars(model.Model):
  name = models.Charfield()
  year = models.DateField()

  class Meta:
    permissions  = (
      ('readonly', 'Can Read Only Cars')
    )
{% endhighlight %}

Just like this, Any permission could be added to the Model. Now in order to get
these permissions in the database. You need to run migrate management command.

{% highlight bash %}
python manage.py migrate
{% endhighlight %}

So this just sets the background in place. The real job is getting this
permissions to work.

Now, I began to wonder what all things were required to develop this complete
functionality ?

The first thing that came to my mind naturally was to override templates and
hack ground admin.py.

So, I created a new class in Admin.py that was inherited from the admin class
I was earlier using:



{% highlight python %}
from model import Cars


class CarAdmin(admin.ModelAdmin):
    date_hierarchy = 'date'
    list_filter = ('status', 'event_instance',)
    actions = ['accept', 'reject', 'pending']

class ReadonlyCarAdmin(CarAdmin):
    def __init__(self, model, admin_site):
      super(ReadonlyCarAdmin, self).__init__(model, admin_site)
      self.model = model

    def has_delete_permission(self, request, obj=None):
      if request.user.has_perm('car.readonly') and not
      request.user.is_superuser:
        return False
      else:
        return True

    def has_add_permission(self, request, obj=None):
      if request.user.has_perm('car.readonly') and not
      request.user.is_superuser:
        return False
      else:
        return True

     def has_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            self.readonly_fields = () # make sure to remove caching.
            return True
        elif request.user.has_perm('car.readonly'):
            # make the fields readonly for only users with readonly permissions.
            self.readonly_fields = [field.name for field in filter(lambda f: not f.auto_created, self.model._meta.fields)]
            return True
        else:
            return False


     def get_actions(self, request):
        actions = super(ReadOnlyCarAdmin, self).get_actions(request)
        if request.user.has_perm('car.readonly') and not request.user.is_superuser:
            # This ensures that that user doesn't not have any actions
            if 'delete_selected' in actions:
                del actions['delete_selected']
                del actions['accept']
                del actions['reject']
                del actions['pending']
            return actions
        else:
            return actions


admin_site.register(Car, ReadonlyCarAdmin)
{% endhighlight %}

Okay, so now we have a robust system in place to ensure whichever user has
readonly permission on Cars Model would only be able to see the model data in
Readonly mode.

But this is not it. Here is the part where templates are overridden.

First of all save and cancel button on buttom needs to go as we don't need
them.


For that, create a new template in templates folder.The templates name is ` change_form.html`.
Hence the full pathname is ` carapp/templates/admin/change_form.html`.

Copy the content from the default django template (/admin/change_form.html) in django project
add replace this content with this gist:

<script src="https://gist.github.com/vinitkumar/48a9cd0c2e35e033659c.js"></script>

This will ensure that the selected user with this readonly only permissions won't be able
get the submit button on his admin page.

Now, you have a fully functioning Django Admin with readonly mode. The main effort was to make it
very easy to use and ensure that this feature could run across future versions.


Hope this post help anyone else who has to implement something similar.



