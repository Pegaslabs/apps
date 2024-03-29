Meteor.startup ->
    Tracker.autorun (c)->
        if Meteor.userId()
            Meteor.subscribe "cms_themes"
            Meteor.subscribe "cms_sites"
        if Session.get("siteId")
            Meteor.subscribe "cms_posts", Session.get("siteId")
            Meteor.subscribe "cms_categories", Session.get("siteId")            
            Meteor.subscribe "cms_images", Session.get("siteId")    