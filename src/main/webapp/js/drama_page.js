
$(document).ready(function() {
    // 사이드바 토글 기능
    $("#toggleButton").click(function() {
        $("#sidebar").toggleClass("hidden");
        $(".video_selection").toggleClass("moved");
    });

    // 서브메뉴 토글 기능
    const navItem = document.querySelector('.nav-item.na');
    const subMenu = document.querySelector('.sub-menu');

    navItem.addEventListener('click', () => {
        subMenu.style.display = subMenu.style.display === 'block' ? 'none' : 'block';
    });

const swiper = new Swiper('.swiper-container', {
    direction: 'horizontal',
    loop: false,
    // autoplay: false,
    slidesPerView: 4,
    slidesPerGroup: 4,
    spaceBetween: 5,
    navigation: {
        prevEl: '.top20_box .swiper-prev',
        nextEl: '.top20_box .swiper-next',
    },
    pagination: {
        el: '.top20_box .swiper-pagination',
        type: 'bullets',
        clickable: true,
    },
    breakpoints: {
        680: {
            slidesPerView: 4,  //브라우저가 680보다 클 때
            spaceBetween: 8,
        },
        1490: {
            slidesPerView: 5,
            spaceBetween: 8,
        },
        1880: {
            slidesPerView: 7,  //브라우저가 1000보다 클 때
            spaceBetween: 10,
        },

    on: {
        afterInit: function() {
            if (this.slides.length == 1) {
                jQuery('.product-slider_nav').hide();
            }
        },
    },
}});

});