  Meteor.publish 'cms_themes', ()->
  
    unless this.userId
      return this.ready()
    

    console.log '[publish] cms_themes for user ' + this.userId

    return db.cms_themes.find({}, {fields: {name: 1}})