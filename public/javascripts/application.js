// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function toggle_startnewtopic() {
  Effect.toggle('newtopic', 'slide', { duration: 0.2 })
}

function switch_to_slowreply() {
  Effect.SlideDown("slowreply", { duration: 0.2 });
  Effect.Fade("quickreply",     { duration: 0.2 });
  $('post_body').focus();
}

function switch_to_quickreply() {
  Effect.Appear("quickreply", { duration: 0.2 });
  Effect.SlideUp("slowreply", { duration: 0.2 });
  $('post_body').focus();
}