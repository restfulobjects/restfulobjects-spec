module.exports = function (registry) {
  registry.blockMacro(function () {
    var self = this
    self.named('github-issue')
    self.process(function (parent, target, attrs) {
      var result = `link:https://github.com/restfulobjects/restfulobjects-spec/issues/${target}[${target}]`
      return self.createBlock(parent, 'paragraph', result)
    })
  })
}
