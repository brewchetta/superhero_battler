// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

// Random backgrounds
var bgs = ["https://cdnb.artstation.com/p/assets/images/images/009/963/699/large/callum-bater-comic-city-night.jpg?1521806579",
"https://www.technobuffalo.com/wp-content/uploads/2013/10/The-Wolf-Among-Us-Cab-in-Fabletown.jpg",
"https://vignette.wikia.nocookie.net/batman/images/0/06/Gotham_skyline1.jpg/revision/latest?cb=20160927182822",
"https://vignette.wikia.nocookie.net/marveldatabase/images/1/12/New_York_%285%29.png/revision/latest?cb=20120213224604",
"https://lh4.ggpht.com/p2N3q5Z_NLVJKNpLG4oGtcftFw6Rfjpqse7Mmg7XhHSjENhnVosSecbu_gwsbVpYiw=h900",
"http://www.bfi.org.uk/sites/bfi.org.uk/files/styles/full/public/image/akira-1987-001-city-lights-and-bikers.jpg",
"https://i.pinimg.com/originals/2f/69/14/2f69142f096557e7b5a4efed8a4ca66f.jpg",
"https://orig00.deviantart.net/8bd1/f/2013/130/5/5/futuristic_city_5_crop_by_rich35211-d5ou38h.jpg",
"http://www.papodeblogueiro.com/wp-content/uploads/2014/05/442952-s6-citywheel_1386852029.jpg",
"https://s-media-cache-ak0.pinimg.com/originals/bd/4a/60/bd4a60e5f6b6e4f47f124b12e21c30e5.jpg",
"https://stmed.net/sites/default/files/metropolis-wallpapers-29739-3619157.jpg",
"http://3.bp.blogspot.com/_oY9YuXBc_Ks/TBpfNZnRo2I/AAAAAAAAGLQ/jLigJl_TB0A/s1600/gotham.jpg",
"https://res.cloudinary.com/rebelwalls/image/upload/b_black,c_fit,fl_progressive,q_auto,w_1333/v1428564559/article/R10621_image1",
"http://static2.businessinsider.com/image/558dbb81371d22a10e8b4d72-1326-575/screen-shot-2015-06-26-at-4.51.00-pm.png",
"https://static3.srcdn.com/wordpress/wp-content/uploads/2016/09/Batcave.jpg",
"https://vignette.wikia.nocookie.net/marvel_dc/images/9/9e/Hall_of_Doom_0001.jpg/revision/latest?cb=20160326101323",
"https://fsmedia.imgix.net/9e/57/54/de/ea67/41a0/bea8/0ee380f86a08/ego-the-living-planet-in-marvel-comics.jpeg?dpr=2&auto=format%2Ccompress&w=650"
];

var bg = bgs[Math.floor(Math.random() * bgs.length)];
