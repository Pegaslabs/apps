Template.instance_view.helpers
    instance: ->
        Session.get("change_date")
        if (Session.get("instanceId"))
            steedos_instance = WorkflowManager.getInstance();
            return steedos_instance;

    space_users: ->
        return db.space_users.find();

Template.instance_view.events
    'change .ins-file-input': (event, template)->
            $(document.body).addClass("loading");
            $('.loading-text').text "正在上传..."
            FS.Utility.eachFile event, (file) ->
                if file.name
                    $('.loading-text').text "正在上传..." + file.name
                            
                newFile = new FS.File(file);
                currentApprove = InstanceManager.getCurrentApprove();
                newFile.metadata = {owner:Meteor.userId(), space:Session.get("spaceId"), instance:Session.get("instanceId"), approve: currentApprove.id};
                cfs.instances.insert newFile, (err,fileObj) -> 
                    if err
                        toastr.error(err);
                    else
                        #$('.loading-text').text fileObj.uploadProgress() + "%"
                        fileObj.on "uploaded", ()->
                            $(document.body).removeClass("loading");
                            $('.loading-text').text ""
                            InstanceManager.addAttach(fileObj, false);
                            fileObj.removeListener("uploaded");