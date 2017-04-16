# Ideas

### BEM

#### Example:

HAML:
```
%div.b-magic{data: {handler: 'App.Blocks.Magic'}}
  %div.b-magic__outer-square
    %div.b-magic__inner-square.js-inner
```

SCSS:
```
.b-magic {
  &__outer-square {
    background: #fff;
    outline: 1px solid #000;
    width: 100px;
    height: 100px;
    padding: 50px;
  }
  
  &__inner-square {
    background: #ccc;
    width: 100px;
    height: 100px;
  }
}
```

`.b-*` means this is a block.

SCSS inner classes are used

Child elements are specified in that way: `.b-PARENT__CHILD`

States (enabled/disabled/on/off/etc) are specified in this way: `.b-PARENT__CHILD--STATE`

### Automatic running of CoffeeScript code
In layout there is such code
```
.page{data: {page_action: controller.action_name, page_controller: controller.controller_name}}
```

For example we open `/demo/one` in browser. If `App.Controllers.Demo` class exists, `App.Controllers.Demo#init` method will be called automatically.  If `App.Actions.DemoOne` class exists, `App.Actions.DemoOne#init` will also be called.

One more example. We have such HAML code:
```
%div.b-magic{data: {handler: 'App.Blocks.Magic'}}
```

If `App.Blocks.Magic` class exists, it will be called.

Look at it's code:
```
class App.Blocks.Magic extends App.BaseHandler

  init: ->
    @$container.find('.js-inner').hover ->
      rand = [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' ]
      color = '#' + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)]
      $(this).css("background-color", color);
```

`@$container` is jquery element corresponding to this block. Using `@$container.find('...')` instead of `$('...')` helps to split code into scopes that will not conflict and interfere with each other. SCSS and Coffee code should be separated into isolated scopes. As little code as possible should be written in global namespace. Global namespace is evil.

### Separate classes for styling and binding of CoffeeScript code

Example:
```
%div.b-magic{data: {handler: 'App.Blocks.Magic'}}
  %div.b-magic__outer-square
    %div.b-magic__inner-square.js-inner
```

```
class App.Blocks.Magic extends App.BaseHandler

  init: ->
    @$container.find('.js-inner').hover ->
      rand = [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' ]
      color = '#' + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)]
      $(this).css("background-color", color);
```

All CSS classes except `.js-inner` are used for styling. Classes that should be binded in javascript start with `.js-`.
When developer refactor styles he can rename CSS class and forget that some JS code is binded to this class. Adding `.js-` prefix helps to avoid such situations.

# Inspired by

* evil-blocks: https://github.com/ai/evil-blocks
* styx: https://github.com/inossidabile/styx
* BEM: https://en.bem.info/
* HTML source code of http://lenta.ru You can see this code converted to HAML here: https://gist.github.com/sigmaray/2d91f5dd1ca86c783611e247fee5c8b0
* Article on habrahabr.ru: https://habrahabr.ru/post/318204/ (WARNING: russian language)
