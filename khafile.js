let project = new Project('OpenLR');
project.addAssets('Assets/**');
project.addShaders('Shaders/**');
project.addSources('Sources');
project.addLibrary('hxlr');
resolve(project);
