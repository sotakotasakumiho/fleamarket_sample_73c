$(document).on('turbolinks:load', function(){
  $('.topiclists.no1').jscroll({
    loadingHtml: 'now loading',
    autoTrigger: true,
    nextSelector: 'a.next',
    contentSelector: '.jscroll',
    padding: 20,
  });
  $('.search_lists').jscroll({
    contentSelector: '.item_jscroll',
    loadingHtml: 'now loading',
    autoTrigger: true,
    nextSelector: 'a.next',
    padding: 20
  });
  $('.comments').jscroll({
    contentSelector: '.comments1',
    loadingHtml: 'now loading',
    autoTrigger: true,
    nextSelector: 'a.next',
    padding: 20
  });

});

