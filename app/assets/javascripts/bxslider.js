$(document).on('turbolinks:load', function() {
  $('.bxslider').bxSlider({
    auto: true,           // 自動スライド
     mode: 'fade',
    speed: 1500,          // スライドするスピード
    moveSlides: 0,        // 移動するスライド数
    pause: 3000,          // 自動スライドの待ち時間
    maxSlides: 4,         // 一度に表示させる最大数
	randomStart: true,    // 最初に表示するスライドをランダムに設定
    autoHover: true,       // ホバー時に自動スライドを停止
    responsive: true,
    maxSlides: 1,
    pager: false,
    slideWidth: 500
  });
});

