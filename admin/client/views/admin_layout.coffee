Template.adminLayout.onCreated ->
        self = this;

        self.minHeight = new ReactiveVar(
                $(window).height());

        $(window).resize ->
                self.minHeight.set($(window).height());


Template.adminLayout.onRendered ->

        self = this;
        self.minHeight.set($(window).height());

        $('body').removeClass('fixed');


Template.adminLayout.helpers 
        minHeight: ->
                return Template.instance().minHeight.get() + 'px'
        admin_collection_title: ->
                if Session.get('admin_collection_name')
                        return t("" + Session.get('admin_collection_name'))

        
Template.adminLayout.events
        "click #navigation-back": (e, t) ->
                NavigationController.back(); 
