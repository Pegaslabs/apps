FlowRouter.notFound = 
    action: ()->
        if !Meteor.userId()
            BlazeLayout.render 'loginLayout',
                main: "not-found"
        else
            BlazeLayout.render 'masterLayout',
                main: "not-found"

FlowRouter.triggers.enter [()->
    Session.set("router-path", FlowRouter.current().path)
]

FlowRouter.route '/', 
    action: (params, queryParams)->
        if (!Meteor.userId())
            FlowRouter.go "/steedos/sign-in";
        else 
            FlowRouter.go "/steedos/springboard";
        

FlowRouter.route '/steedos', 
    action: (params, queryParams)->
        if !Meteor.userId()
            FlowRouter.go "/steedos/sign-in";
            return true
        else
            FlowRouter.go "/steedos/springboard";


FlowRouter.route '/steedos/logout', 
    action: (params, queryParams)->
        #AccountsTemplates.logout();
        Meteor.logout ()->
            Setup.logout();
            Session.set("spaceId", null);
            FlowRouter.go("/");


FlowRouter.route '/steedos/profile', 
    action: (params, queryParams)->
        if Meteor.userId()
            BlazeLayout.render 'adminLayout',
                main: "profile"


FlowRouter.route '/steedos/springboard', 
    action: (params, queryParams)->
        if !Meteor.userId()
            FlowRouter.go "/steedos/sign-in";
            return true

        BlazeLayout.render 'masterLayout',
            main: "springboard"


FlowRouter.route '/steedos/space', 
    action: (params, queryParams)->
        if !Meteor.userId()
            FlowRouter.go "/sign-in";
            return true

        BlazeLayout.render 'loginLayout',
            main: "space_select"


FlowRouter.route '/steedos/help', 
    action: (params, queryParams)->
        locale = Steedos.getLocale()
        country = locale.substring(3)
        window.open("http://www.steedos.com/" + country + "/help/", '_blank', 'EnableViewPortScale=yes')


FlowRouter.route '/app/:app_id', 
    action: (params, queryParams)->
        
        BlazeLayout.render 'masterLayout',
            main: "springboard"

        window.open("/" + params.app_id, '_blank', 'EnableViewPortScale=yes')
        