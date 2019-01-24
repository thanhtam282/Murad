﻿// Google Map API Standard Code
var map;
var geocoder;

var region = 'vn';

var markers = new Array();

var distancenode = '';
var distancecode = 0;

var themiles = '';
var thekm = '';
var arr = new Array();
var totalrec = 0;

var image;
var shadow;
var iconUrl = '/Data/Sites/1/media/default/map-icon.png';
var shadowUrl = '/Data/Sites/1/skins/default/images/map-shadow.png';

var zoomInit = 12;
var zoom = 12;

var latInit = 10.823495328819778;
var lngInit =106.62961693750003;

var currCulture;
var lang = {};
lang['en'] = { 'name': '', 'searchResultName': '<strong> Murad store(s)</strong>', 'phone': 'Phone', 'address': 'Address', 'zoom': 'Zoom', 'direction': 'Direction', 'directionNotFound': 'Direction not found. Please try again', 'notFound': 'No results ', 'found': 'Found ', 'locations': ' ', 'matchYourSearch': ' match your search', 'nearYourLocation': ' near your location', 'from': 'From', 'to': 'To', 'back': 'Back' };
lang['vi'] = { 'name': '', 'searchResultName': '<strong> cửa hàng Murad</strong>', 'phone': 'Điện thoại', 'address': 'Địa chỉ', 'zoom': 'Phóng to', 'direction': 'Tìm đường đi', 'directionNotFound': 'Không tìm thấy đường đi. Vui lòng thử lại', 'notFound': 'Không tìm thấy địa điểm ', 'found': 'Có ', 'locations': ' ', 'matchYourSearch': ' phù hợp với tìm kiếm của bạn', 'nearYourLocation': ' gần với vị trí của bạn', 'from': 'Từ', 'to': 'Đến', 'back': 'Trở lại' };

$(document).ready(function() {

    currCulture = $('#hdfDealerLocatorCulture').val();

    image = new google.maps.MarkerImage(
        iconUrl,
        new google.maps.Size(34, 46),
        new google.maps.Point(0, 0),
        new google.maps.Point(17, 46)
    );
    shadow = new google.maps.MarkerImage(
        shadowUrl,
        new google.maps.Size(60, 46),
        new google.maps.Point(0, 0),
        new google.maps.Point(17, 46)
    );

    $('p.distance-units label input:radio').click(function() {
        var units = $(this).parents('label').attr('units');

        if ($(this).parents('label').hasClass('unchecked')) {
            changeDistanceUnits(units);
        }

    });

    initmap();

    //autocomplete text field

    var autocomplete = new google.maps.places.Autocomplete($("#address")[0], {});
    var origin_autocomplete = new google.maps.places.Autocomplete($("#origin-direction")[0], {});

    if ($('#edit-submit').length) {
        $('#edit-submit').click(function() {
            var address = $('#address').val();
            var distance = $('#distance').val();

            //// search for available locations
            //if (address != '') {
            gmap_location_lookup(address, distance, region);
            //} else {
            //$('#ajax_msg').html("<ul class='alert alert-block alert-error fade in'><li>Vui lòng nhập địa chỉ.</li></ul>");
            //}

            return false;
        });
    }

    if ($('#ddlProvince').length) {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/DealerLocator/Services/GeoZoneService.asmx/LoadCountry",
            data: "{'languageId': '" + $("#hdnDealerLocatorLanguageId").val() + "'}",
            dataType: "json",
            success: function(result) {
                var obj = $("#ddlCountry");
                $(obj).empty();
                $(obj).append($("<option></option>").val("").html($("#hdfDealerLocatorSelectCountry").val()));
                $.each(result.d, function(key, value) {
                    $(obj).append($("<option></option>").val(value.Key).html(value.Name));
                });

                if (obj.find('option').length == 2) {
                    obj.addClass('hidden');
                    obj.find('option').eq(1).prop('selected', true);
                    $('#ddlCountry').trigger('change');
                }
            },
            error: function(result) {}
        });

        $('#ddlCountry').change(function() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/DealerLocator/Services/GeoZoneService.asmx/LoadProvince",
                data: "{'languageId': '" + $("#hdnDealerLocatorLanguageId").val() + "', 'countryGuid': '" + $('#ddlCountry').val() + "'}",
                dataType: "json",
                success: function(result) {
                    var obj = $("#ddlProvince");
                    $(obj).empty();
                    $(obj).append($("<option></option>").val("").html($("#hdfDealerLocatorSelectProvince").val()));
                    $.each(result.d, function(key, value) {
                        $(obj).append($("<option></option>").val(value.Key).html(value.Name));
                    });
                },
                error: function(result) {

                }
            });
        });

        if ($('#ddlDistrict').length) {
            $('#ddlProvince').change(function() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "/DealerLocator/Services/GeoZoneService.asmx/LoadDistrict",
                    data: "{'languageId': '" + $("#hdnDealerLocatorLanguageId").val() + "', 'provinceGuid': '" + $('#ddlProvince').val() + "'}",
                    dataType: "json",
                    success: function(result) {
                        var obj = $("#ddlDistrict");
                        $(obj).empty();
                        $(obj).append($("<option></option>").val("").html($("#hdfDealerLocatorSelectDistrict").val()));
                        $.each(result.d, function(key, value) {
                            $(obj).append($("<option></option>").val(value.Key).html(value.Name));
                        });
						
  						$('#edit-submit').trigger('click');
                    },
                    error: function(result) {

                    }
                });
            });
        }
    }

	$('#ddlDistrict').change(function() {
		$('#edit-submit').trigger('click');
	});
		
    if ($('#add #map_canvas').length) {

        var lat = 10.8230989;
        var lng = 106.6296638;

        // get pre-populated value and focus map
        var gmap_marker = false;
        if ($('#latitude').length) {

            val = $('#latitude').val() * 1;

            if (val != '' && !isNaN(val)) {
                lat = val;
                gmap_marker = true;
            }

        }
        if ($('#longitude').length) {

            val = $('#longitude').val() * 1;

            if (val != '' && !isNaN(val)) {
                lng = val;
            }
        }

        geocoder = new google.maps.Geocoder();

        var latlng = new google.maps.LatLng(lat, lng);

        // set map options
        var myOptions = {
            zoom: zoom,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        // display map
        map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

        if (gmap_marker) {
            // create a map marker
            var marker = new google.maps.Marker({
                map: map,
                position: latlng
            });
        }
    }


    if ($('#add #address').length) {

        $('#add #address').blur(function() {

            var address = $(this).val();

            if (address != '') {

                get_coordinate(address, region);
            }
        });
    }

    t = window.setInterval(delaylocationload, 100);

    function delaylocationload() {
        //        $.get("http://ipinfo.io", function (response) {
        //            var loc = response.loc.split(',');
        //            if (loc.length == 2) {
        //                gmap_location_lookup(response.city + ", " + response.country, $('#distance').val(), '', loc[0], loc[1]);
        //            }
        //        }, "jsonp");

        //        // Try HTML5 geolocation
        //        if (navigator.geolocation) {
        //            navigator.geolocation.getCurrentPosition(function (position) {
        //                gmap_location_lookup('', $('#distance').val(), '', position.coords.latitude, position.coords.longitude);
        //            }, function () {
        //                handleNoGeolocation(true);
        //            });
        //        } else {
        //            // Browser doesn't support Geolocation
        //            handleNoGeolocation(false);
        //        }

        var zoomTemp = zoom;
        zoom = zoomInit;
        gmap_location_lookup('', $('#distance').val() + 100000, region, latInit, lngInit);
        zoom = zoomTemp;

        window.clearInterval(t);
    }

    function handleNoGeolocation(errorFlag) {
        if (errorFlag) {
            var content = 'Error: The Geolocation service failed.';
        } else {
            var content = 'Error: Your browser doesn\'t support geolocation.';
        }
    }

});

function initmap() {
    if ($('#map_canvas').length) {

        // instantiate geocoder
        geocoder = new google.maps.Geocoder();
        // create new latitude / longitude object
        var latlng = new google.maps.LatLng(latInit, lngInit);

        // set map options
        var myOptions = {
            zoom: zoomInit,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        // display map
        map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
        // show the map div
        $('#map_canvas').show();
    }
}

/**
 * Retreiving location / address
 */
function get_coordinate(address, region) {

    if (region == null || region == '' || region == 'undefined') {
        region = 'vn';
    }

    if (address != '') {
        $('#ajax_msg').html('<p>Loading location</p>');

        geocoder.geocode({ 'address': address, 'region': region }, function(results, status) {

            if (status == google.maps.GeocoderStatus.OK) {
                $('#ajax_msg').html('<p></p>');

                $('#latitude').val(results[0].geometry.location.lat());
                $('#longitude').val(results[0].geometry.location.lng());


                map.setZoom(10);

                map.setCenter(results[0].geometry.location);

                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
            } else {

                $('#ajax_msg').html('<p>Google map geocoder failed: ' + status + '</p>');
            }
        });
    }
}


/**
 * Google map location lookup
 */
function gmap_location_lookup(address, distance, region, userlat, userlng) {

    if (region == null || region == '') {
        region = 'vn';
    }

    distancecode = 1;

    if (address != '') {
        $('#map_canvas').html("<img src='/Data/SiteImages/indicators/indicator1.gif' alt='Ajax Loading Image' />").show();
        $('#ajax_msg').hide();

        geocoder = new google.maps.Geocoder();

        geocoder.geocode({ 'address': address, 'region': region }, function(results, status) {

            if (status == google.maps.GeocoderStatus.OK) {
                lat = results[0].geometry.location.lat();
                lng = results[0].geometry.location.lng();

                myOptions = {
                    zoom: zoom,
                    center: new google.maps.LatLng(lat, lng),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

                if (userlat != null && userlng != null) {
                    myOptions = {
                        zoom: zoom,
                        center: new google.maps.LatLng(userlat, userlng),
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                }

                map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

                //                var marker = new google.maps.Marker({
                //                    map: map,
                //                    draggable: false,
                //                    animation: google.maps.Animation.DROP,
                //                    position: results[0].geometry.location,
                //                    title: 'Your entered address'
                //                });

                var shape = {
                    coord: [31, 0, 32, 1, 33, 2, 33, 3, 33, 4, 33, 5, 33, 6, 33, 7, 33, 8, 33, 9, 33, 10, 33, 11, 33, 12, 33, 13, 33, 14, 33, 15, 33, 16, 33, 17, 33, 18, 33, 19, 33, 20, 33, 21, 33, 22, 33, 23, 33, 24, 33, 25, 33, 26, 33, 27, 33, 28, 33, 29, 33, 30, 33, 31, 33, 32, 32, 33, 31, 34, 29, 35, 26, 36, 25, 37, 25, 38, 24, 39, 23, 40, 23, 41, 22, 42, 22, 43, 21, 44, 20, 45, 16, 45, 15, 44, 14, 43, 14, 42, 13, 41, 13, 40, 12, 39, 12, 38, 11, 37, 10, 36, 6, 35, 4, 34, 3, 33, 2, 32, 1, 31, 1, 30, 0, 29, 0, 28, 0, 27, 0, 26, 0, 25, 0, 24, 0, 23, 0, 22, 0, 21, 0, 20, 0, 19, 0, 18, 0, 17, 0, 16, 0, 15, 0, 14, 0, 13, 0, 12, 0, 11, 0, 10, 0, 9, 0, 8, 0, 7, 0, 6, 0, 5, 1, 4, 1, 3, 2, 2, 3, 1, 4, 0, 31, 0],
                    type: 'poly'
                };

                // clear all markers
                jQuery.each(markers, function(k, v) {
                    v.setMap(null);
                });

                // clear list
                $('#list').empty();

                var number = 0;
                $.ajax({
                    url: "/DealerLocator/Services/GetDealerXml.ashx",
                    dataType: "xml",
                    type: "GET",
                    //url:$('#clinic-finder-form').attr('action'),
                    //data:"ajax=1&action=get_nearby_stores&distance="+distance+"&lat="+lat+"&lng="+lng+"&products="+$('#edit-products').val(),
                    //data: "distance=" + distance + "&lat=" + lat + "&lng=" + lng + "&languageid=" + $('#hdnDealerLocatorLanguageId').val() + "&siteid=" + $('#hdnDealerLocatorSiteId').val() + "&province=" + $('#ddlProvince').val() + "&zoneguid=" + $('#hdnDealerLocatorZoneGuid').val() + "&district=" + $('#ddlDistrict').val(),
                    data: {
                        distance: distance,
                        lat: lat,
                        lng: lng,
                        languageid: $('#hdnDealerLocatorLanguageId').val(),
                        siteid: $('#hdnDealerLocatorSiteId').val(),
                        zoneguid: $('#hdnDealerLocatorZoneGuid').val(),
                        country: $('#ddlCountry').val(),
                        province: $('#ddlProvince').val(),
                        district: $('#ddlDistrict').val()
                    },
                    success: function(msg) {
                        var results = msg.documentElement.getElementsByTagName("marker");

                        if (results.length > 0) {
                            totalrec = results.length;

                            var infowindow = new google.maps.InfoWindow({
                                maxWidth: "400",
                                content: ''
                            });

                            $i = 0;
                            jQuery.each(results, function(k, v) {
                                var marker = new google.maps.Marker({
                                    __gm_id: $i++,
                                    map: map,
                                    position: new google.maps.LatLng(v.getAttribute("lat"), v.getAttribute("lng")),
                                    icon: iconUrl, //v.getAttribute("icon"),
                                    shadow: shadow,
                                    shape: shape,
                                    title: v.getAttribute("name") + ' : ' + v.getAttribute("address")
                                });

                                // calc distance
                                origin = new google.maps.LatLng(lat, lng);
                                dest = new google.maps.LatLng(v.getAttribute("lat"), v.getAttribute("lng"));
                                // set km / miles language	
                                themiles = 'miles'; //v.getAttribute("titlemiles");
                                thekm = 'km'; //v.getAttribute("titlekm");

                                var service = new google.maps.DistanceMatrixService();
                                service.getDistanceMatrix({
                                    origins: [origin],
                                    destinations: [dest],
                                    travelMode: google.maps.TravelMode.DRIVING,
                                    unitSystem: google.maps.UnitSystem.METRIC,
                                    avoidHighways: false,
                                    avoidTolls: false
                                }, callback);

                                // add to markers
                                markers.push(marker);


                                // build content string
                                var info_window_string = info_window_content(v);
                                ctype = '';
                                if (v.getAttribute("cat_img") != null) {
                                    var ctype = '<img src="' + v.getAttribute("cat_img") + '" style="max-width:15px; max-height:15px;" />';
                                }

                                number++
                                //distancenode = google.maps.geometry.spherical.computeDistanceBetween(origin, dest).toFixed(2);
                                var phoneFax = "";
                                if (v.getAttribute("phone") != "") {
                                    phoneFax += "<div><span>" + lang[currCulture].phone + ":</span> " + v.getAttribute("phone") + "</div>";
                                }
                                if (v.getAttribute("fax") != "") {
                                    phoneFax += "<div><span>Fax:</span> " + v.getAttribute("fax") + "</div>";
                                }
                                if (v.getAttribute("des") != "") {
                                    phoneFax += "<div><span>Giờ làm việc:</span> " + v.getAttribute("des") + "</div>";
                                }
								
                                if (v.getAttribute("website") != "") {
                                    phoneFax += "<div><span>Website:</span> " + v.getAttribute("website") + "</div>";
                                }
								
                                if (number > 9) {
                                    $("<li id='l_" + marker['__gm_id'] + "' class='clinic_list double-digit' />")
                                        .html("<span class='number'>" + number + "</span><div><strong>" + lang[currCulture].name + v.getAttribute("name") + "</strong><div><span>" + lang[currCulture].address + ":</span> " + v.getAttribute("address") + "</div><div><strong>Website :</strong><a>"+v.getAttribute("website")+"</a>" + phoneFax + "<div id=d_" + number + " class='distance'><span id='disval' attr-dist='" + distancenode + "' class='value'>" + distancenode + "</span> <span class='units'></span> <span class='time2'></span></div></div><div class='products'>" + ctype + "</div>")
                                        .click(function() {
                                            //displayPoint(marker, i);
                                            infowindow.setContent(info_window_string);
                                            infowindow.open(map, marker);
                                            toggleBounce(marker);
                                        })
                                        .appendTo("#list");
                                } else {
                                    $("<li id='l_" + marker['__gm_id'] + "' class='clinic_list' />")
                                        .html("<span class='number'>" + number + "</span><div><strong>" + lang[currCulture].name + v.getAttribute("name") + "</strong><div><span>" + lang[currCulture].address + ":</span> " + v.getAttribute("address") + "</div><div><strong>Website :</strong><a>"+v.getAttribute("website")+"</a>"  + phoneFax + "<div id=d_" + number + " class='distance'><span id='disval' attr-dist='" + distancenode + "' class='value'>" + distancenode + "</span> <span class='units'></span> <span class='time2'></span></div></div><div class='products'>" + ctype + "</div><a id='la_" + marker['__gm_id'] + "' name='la_" + marker['__gm_id'] + "'></a>")
                                        .click(function() {
                                            //displayPoint(marker, i);
                                            infowindow.setContent(info_window_string);
                                            infowindow.open(map, marker);
                                            toggleBounce(marker);
                                        })
                                        .appendTo("#list");
                                }

                                // sort distance

                                // attach popup to click event
                                google.maps.event.addListener(marker, 'click', function() {
                                    $('#list .clinic_list').removeClass('active');
                                    $('#list').animate($("#l_" + marker['__gm_id'])[0].scrollIntoView(true));

                                    $('#l_' + marker['__gm_id']).addClass('active');
                                    toggleBounce(marker);
                                    infowindow.setContent(info_window_string);
                                    infowindow.open(map, marker);
                                });

                            }); // end loop

                            $('.clinic_list').click(function() {

                                $('#list .clinic_list').removeClass('active');
                                $(this).addClass('active');
                                $('div[title="Exit Street View"]').trigger('click');
                                map.setZoom(10);

                            });

                            $('#ajax_msg').html(lang[currCulture].found + "<span class='flash_good'>" + results.length + "</span>" + lang[currCulture].locations + lang[currCulture].searchResultName + lang[currCulture].matchYourSearch).fadeIn();
                        } else {
                            //                $("<li  />")
                            //                                									.html("<span class='number'>!</span><p>" + results.msg + "</p>")
                            //                                									.click(function () {
                            //                                									    //displayPoint(marker, i);
                            //                                									    infowindow.setContent(info_window_string);
                            //                                									    infowindow.open(map, marker);
                            //                                									    toggleBounce(marker);
                            //                                									})
                            //                                									.appendTo("#list");
                            // $('#ajax_msg').html("<p class='alert alert-block alert-error fade in'>" + results.msg + "</p>").fadeIn();

                            initmap();
                            $('#ajax_msg').html(lang[currCulture].notFound + lang[currCulture].searchResultName + lang[currCulture].matchYourSearch).fadeIn();
                        }

                        //sort_distance();
                    }
                });
            }
        });
    } else {
        gmap_province_lookup(distance, region, userlat, userlng);
    }
}

function gmap_province_lookup(distance, region, userlat, userlng) {
    $('#map_canvas').html("<img src='/Data/SiteImages/indicators/indicator1.gif' alt='Ajax Loading Image' />").show();
    $('#ajax_msg').hide();

    //                var marker = new google.maps.Marker({
    //                    map: map,
    //                    draggable: false,
    //                    animation: google.maps.Animation.DROP,
    //                    position: results[0].geometry.location,
    //                    title: 'Your entered address'
    //                });

    var shape = {
        coord: [31, 0, 32, 1, 33, 2, 33, 3, 33, 4, 33, 5, 33, 6, 33, 7, 33, 8, 33, 9, 33, 10, 33, 11, 33, 12, 33, 13, 33, 14, 33, 15, 33, 16, 33, 17, 33, 18, 33, 19, 33, 20, 33, 21, 33, 22, 33, 23, 33, 24, 33, 25, 33, 26, 33, 27, 33, 28, 33, 29, 33, 30, 33, 31, 33, 32, 32, 33, 31, 34, 29, 35, 26, 36, 25, 37, 25, 38, 24, 39, 23, 40, 23, 41, 22, 42, 22, 43, 21, 44, 20, 45, 16, 45, 15, 44, 14, 43, 14, 42, 13, 41, 13, 40, 12, 39, 12, 38, 11, 37, 10, 36, 6, 35, 4, 34, 3, 33, 2, 32, 1, 31, 1, 30, 0, 29, 0, 28, 0, 27, 0, 26, 0, 25, 0, 24, 0, 23, 0, 22, 0, 21, 0, 20, 0, 19, 0, 18, 0, 17, 0, 16, 0, 15, 0, 14, 0, 13, 0, 12, 0, 11, 0, 10, 0, 9, 0, 8, 0, 7, 0, 6, 0, 5, 1, 4, 1, 3, 2, 2, 3, 1, 4, 0, 31, 0],
        type: 'poly'
    };

    // clear all markers
    jQuery.each(markers, function(k, v) {
        v.setMap(null);
    });

    // clear list
    $('#list').empty();

    var parentZone = $('#hdnDealerLocatorZoneGuid').val();
    var iZoom = zoom; // global variable reset when ajax call
    var number = 0;
    $.ajax({
        url: "/DealerLocator/Services/GetDealerXml.ashx",
        dataType: "xml",
        type: "GET",
        //url:$('#clinic-finder-form').attr('action'),
        //data:"ajax=1&action=get_nearby_stores&distance="+distance+"&lat="+lat+"&lng="+lng+"&products="+$('#edit-products').val(),
        //data: "distance=" + distance + "&lat=" + lat + "&lng=" + lng + "&languageid=" + $('#hdnDealerLocatorLanguageId').val() + "&siteid=" + $('#hdnDealerLocatorSiteId').val() + "&province=" + $('#ddlProvince').val() + "&zoneguid=" + $('#hdnDealerLocatorZoneGuid').val() + "&district=" + $('#ddlDistrict').val(),
        data: {
            distance: distance,
            lat: userlat,
            lng: userlng,
            languageid: $('#hdnDealerLocatorLanguageId').val(),
            siteid: $('#hdnDealerLocatorSiteId').val(),
            zoneguid: parentZone,
            country: $('#ddlCountry').val(),
            province: $('#ddlProvince').val(),
            district: $('#ddlDistrict').val()
        },
        success: function(msg) {
            var results = msg.documentElement.getElementsByTagName("marker");

            if (results.length > 0) {
                totalrec = results.length;

                var infowindow = new google.maps.InfoWindow({
                    maxWidth: "400",
                    content: ''
                });

                myOptions = {
                    zoom: iZoom,
                    center: new google.maps.LatLng(results[0].getAttribute("lat"), results[0].getAttribute("lng")),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

                if (userlat != null && userlng != null) {
                    myOptions = {
                        zoom: iZoom,
                        center: new google.maps.LatLng(userlat, userlng),
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                }

                map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

                $i = 0;
                jQuery.each(results, function(k, v) {
                    var marker = new google.maps.Marker({
                        __gm_id: $i++,
                        map: map,
                        position: new google.maps.LatLng(v.getAttribute("lat"), v.getAttribute("lng")),
                        icon: iconUrl, //v.getAttribute("icon"),
                        shadow: shadow,
                        shape: shape,
                        title: v.getAttribute("name") + ' : ' + v.getAttribute("address")
                    });

                    if (userlat > 0 && userlng > 0) {
                        // calc distance
                        origin = new google.maps.LatLng(userlat, userlng);
                        dest = new google.maps.LatLng(v.getAttribute("lat"), v.getAttribute("lng"));
                        // set km / miles language	
                        themiles = 'miles'; //v.getAttribute("titlemiles");
                        thekm = 'km'; //v.getAttribute("titlekm");

                        var service = new google.maps.DistanceMatrixService();
                        service.getDistanceMatrix({
                            origins: [origin],
                            destinations: [dest],
                            travelMode: google.maps.TravelMode.DRIVING,
                            unitSystem: google.maps.UnitSystem.METRIC,
                            avoidHighways: false,
                            avoidTolls: false
                        }, callback);
                    }

                    // add to markers
                    markers.push(marker);

                    // build content string
                    var info_window_string = info_window_content(v);
                    ctype = '';
                    if (v.getAttribute("cat_img") != null) {
                        var ctype = '<img src="' + v.getAttribute("cat_img") + '" style="max-width:15px; max-height:15px;" />';
                    }

                    number++
                    //distancenode = google.maps.geometry.spherical.computeDistanceBetween(origin, dest).toFixed(2);
                    var phoneFax = "";
                    if (v.getAttribute("phone") != "") {
                        phoneFax += "<div><strong>" + lang[currCulture].phone + ":</strong> " + v.getAttribute("phone") + "</div>";
                    }
                    if (v.getAttribute("fax") != "") {
                        phoneFax += "<div><strong>Fax:</strong> " + v.getAttribute("fax") + "</div>";
                    }
                    if (v.getAttribute("des") != "") {
                        phoneFax += "<div><strong>Ưu đãi:</strong> " + v.getAttribute("des") + "</div>";
                    }
					
                    if (v.getAttribute("website") != "") {
                        phoneFax += "<div><strong>Website:</strong> " + v.getAttribute("website") + "</div>";
                    }
                    if (number > 9) {
                        $("<li id='l_" + marker['__gm_id'] + "' class='clinic_list double-digit' />")
                            .html("<div><strong>" + lang[currCulture].name + v.getAttribute("name") + "</strong><div><strong>" + lang[currCulture].address + ":</strong> " + v.getAttribute("address") + "</div>" + phoneFax + "<div id=d_" + number + " class='distance'><span id='disval' attr-dist='" + distancenode + "' class='value'>" + distancenode + "</span> <span class='units'></span> <span class='time2'></span></div></div><div class='products'>" + ctype + "</div>")
                            .click(function() {
                                //displayPoint(marker, i);
                                infowindow.setContent(info_window_string);
                                infowindow.open(map, marker);
                                toggleBounce(marker);
                            })
                            .appendTo("#list");
                    } else {
                        $("<li id='l_" + marker['__gm_id'] + "' class='clinic_list' />")
                            .html("<div><strong>" + lang[currCulture].name + v.getAttribute("name") + "</strong><div><strong>" + lang[currCulture].address + ":</strong> " + v.getAttribute("address") + "</div>" + phoneFax + "<div id=d_" + number + " class='distance'><span id='disval' attr-dist='" + distancenode + "' class='value'>" + distancenode + "</span> <span class='units'></span> <span class='time2'></span></div></div><div class='products'>" + ctype + "</div><a id='la_" + marker['__gm_id'] + "' name='la_" + marker['__gm_id'] + "'></a>")
                            .click(function() {
                                //displayPoint(marker, i);
                                infowindow.setContent(info_window_string);
                                infowindow.open(map, marker);
                                toggleBounce(marker);
                            })
                            .appendTo("#list");
                    }

                    // sort distance


                    // attach popup to click event
                    google.maps.event.addListener(marker, 'click', function() {
                        $('#list .clinic_list').removeClass('active');
                        $('#list').animate($("#l_" + marker['__gm_id'])[0].scrollIntoView(true));

                        $('#l_' + marker['__gm_id']).addClass('active');
                        toggleBounce(marker);
                        infowindow.setContent(info_window_string);
                        infowindow.open(map, marker);
                    });

                }); // end loop

                $('.clinic_list').click(function() {

                    $('#list .clinic_list').removeClass('active');
                    $(this).addClass('active');
                    $('div[title="Exit Street View"]').trigger('click');
                    map.setZoom(15);

                });

                if (userlat > 0 && userlng > 0)
                    $('#ajax_msg').html(lang[currCulture].found + "<span class='flash_good'>" + results.length + "</span>" + lang[currCulture].locations + lang[currCulture].searchResultName + lang[currCulture].nearYourLocation).fadeIn();
                else
                    $('#ajax_msg').html(lang[currCulture].found + "<span class='flash_good'>" + results.length + "</span>" + lang[currCulture].locations + lang[currCulture].searchResultName + lang[currCulture].matchYourSearch).fadeIn();
            } else {
                //                $("<li  />")
                //                                									.html("<span class='number'>!</span><p>" + results.msg + "</p>")
                //                                									.click(function () {
                //                                									    //displayPoint(marker, i);
                //                                									    infowindow.setContent(info_window_string);
                //                                									    infowindow.open(map, marker);
                //                                									    toggleBounce(marker);
                //                                									})
                //                                									.appendTo("#list");
                // $('#ajax_msg').html("<p class='alert alert-block alert-error fade in'>" + results.msg + "</p>").fadeIn();

                initmap();
                $('#ajax_msg').html(lang[currCulture].notFound + lang[currCulture].searchResultName + lang[currCulture].matchYourSearch).fadeIn();
            }
        }
    });

}

// sort distance

function sort_distance() {

    // r & d
    var numbersort = 1;
    var items = $('#list li').get();

    items.sort(function(a, b) {


        /*  Sort Alphabetical order 
	  
        var keyA = $(a).find('strong').text();
        var keyB = $(b).find('strong').text();
        console.log($(a).find('strong'));
	  
        if (keyA < keyB) { return -1; }
        if (keyA > keyB) { return 1; }
	   
        */

        /* Sort by distance  */

        var keyA = $(a).find('#disval').text();
        var keyB = $(b).find('#disval').text();
        //console.log($(a).find('#disval').text());


        if ((Math.round(parseFloat(keyA) * 100) / 100) < (Math.round(parseFloat(keyB) * 100) / 100)) { return -1; }
        if ((Math.round(parseFloat(keyA) * 100) / 100) > (Math.round(parseFloat(keyB) * 100) / 100)) { return 1; }

        return 0;
    });


    var ol = $('#list');
    $.each(items, function(i, li) {
        ol.append(li);
        $('#' + $(li).attr('id') + ' .number').text(numbersort);
        numbersort++;
    });


}

// bouncing marker

function toggleBounce(marker) {

    $(markers).each(function(i, marker2) {

        if (marker['__gm_id'] != marker2['__gm_id']) {
            marker2.setAnimation(null);
        }

    });



    if (marker.getAnimation() != null) {
        marker.setAnimation(null);
    } else {
        marker.setAnimation(google.maps.Animation.BOUNCE);
    }
}

//end function

function callback(response, status) {
    if (status == google.maps.DistanceMatrixStatus.OK) {
        var origins = response.originAddresses;
        var destinations = response.destinationAddresses;

        for (var i = 0; i < origins.length; i++) {
            var results = response.rows[i].elements;

            for (var j = 0; j < results.length; j++) {
                var element = results[j];
                if (element != null) {
                    var distance = (parseFloat(element.distance.value) / 1000).toFixed(1);

                    var un = '';
                    if ($('input[name=distance-units]:checked').val() == 'kms') {
                        un = themiles;
                    } else {
                        un = thekm;
                    }
                    var duration = element.duration.text;
                    var from = origins[i];
                    var to = destinations[j];

                    arr.push(distance);
                }
            }
        }
        distancecode++;

        if (distancecode == (totalrec + 1)) {
            distancecode = 0;
            arr.sort(function(a, b) { return a - b });

            for (k = 0; k <= arr.length; k++) {
                $('#d_' + (k + 1) + ' .value').html(arr[k]);
                $('#d_' + (k + 1) + ' .units').html(un);
            }
            arr = [];
        }
    }
}

// end function

/**
 * Change distance miles and km
 */

function changeDistanceUnits(units) {
    var milesToKm = 0.621371192237334;
    var results = $('#results');
    var dUnits = results.find('p.distance-units label');
    var distance = results.find('.distance');
    var unitsSpan = distance.find('.units');
    var valueSpan = distance.find('.value');

    dUnits.removeClass('unchecked');
    dUnits.filter(':not([units="' + units + '"])').addClass('unchecked');

    switch (units) {
        case 'km':

            unitsSpan.html(' ' + thekm + ' ');

            $.each(distance, function(i, val) {
                // values are already in kms so just round to 2 decimal places.
                i++;
                val = $('#d_' + i + ' .value').html();
                val = parseFloat(val);

                $('#d_' + i + ' .value').text((Math.round(val / milesToKm * 100) / 100));

            });

            break;

        case 'miles':

            unitsSpan.html(' ' + themiles + ' ');

            $.each(distance, function(i, val) {
                // Values are in kms so convert to miles then round down to two decimal places.
                i++;
                val = $('#d_' + i + ' .value').html();
                val = parseFloat(val);

                $('#d_' + i + ' .value').text(Math.round((val * milesToKm) * 100) / 100);
            });

            break;

        default:
    }
}

function info_window_content(v) {
    var info_window_string = "<div class='maps_popup'>";

    //    var splitaddress = "";
    //    saddress = v.getAttribute("address").split(" ");
    //    for (i = 0; i < saddress.length; i++) {
    //        splitaddress += saddress[i] + " ";
    //        if (i == 4) {
    //            splitaddress += "<br>";
    //        }
    //    }

    info_window_string += "<h1>" + lang[currCulture].name + v.getAttribute("name") + "</h1>";

    if (v.getAttribute("image") != null && v.getAttribute("image") != '') {
        info_window_string += "<div class='image'><img src='" + v.getAttribute("image") + "' alt='" + v.getAttribute("name") + "' /></div>";
    }

    if (v.getAttribute("address") != null && v.getAttribute("address") != '') {
        info_window_string += "<p class='address'><span>" + lang[currCulture].address + ":</span> " + v.getAttribute("address") + "</p>";
    }
    if (v.getAttribute("phone") != null && v.getAttribute("phone") != '') {
        info_window_string += "<p class='tel'><span>" + lang[currCulture].phone + ":</span> " + v.getAttribute("phone") + "</p>";
    }
    if (v.getAttribute("fax") != null && v.getAttribute("fax") != '') {
        info_window_string += "<p class='fax'><span>Fax:</span> " + v.getAttribute("fax") + "</p>";
    }
    if (v.getAttribute("email") != null && v.getAttribute("email") != '') {
        info_window_string += "<p class='email'><span>Email:</span> <a href='mailto:" + v.getAttribute("email") + "'>" + v.getAttribute("email") + "</a></p>";
    }

    if (v.getAttribute("website") != null && v.getAttribute("website") != '') {

        if (v.getAttribute("website").substring(0, 4) != "http") {
            info_window_string += "<p class='web'><span>Website:</span> <a href='http://" + v.getAttribute("website") + "' target='new'>http://" + v.getAttribute("website") + "</a></p>";
        } else {
            info_window_string += "<p class='web'><span>Website:</span> <a href='" + v.getAttribute("website") + "' target='new'>" + v.getAttribute("website") + "</a></p>";
        }
    }

    if (v.getAttribute("des") != null && v.getAttribute("des") != '') {
        info_window_string += "<p class='description'>" + v.getAttribute("des") + "</p>";
    }

    info_window_string += "<a href='javascript:zoomHere(" + v.getAttribute("lat") + "," + v.getAttribute("lng") + ");'>" + lang[currCulture].zoom + "</a> ";
	//<a href='javascript:direction(\"" + v.getAttribute("address") + "\"," + v.getAttribute("lat") + "," + v.getAttribute("lng") + ");'>" + lang[currCulture].direction + "</a>"
    info_window_string += "</div>";

    return info_window_string;
}

function streetView(lat, lng) {

    // street view
    street = new google.maps.StreetViewPanorama(document.getElementById("map_canvas"), {

        position: new google.maps.LatLng(lat, lng),
        zoomControl: false,
        enableCloseButton: true,
        addressControl: false,
        panControl: true,
        linksControl: true
    });

}

function zoomHere(lat, lng) {

    map.setZoom(15);
    var currentLatLng = new google.maps.LatLng(lat, lng);
    map.setCenter(currentLatLng);

}


function direction(dest, lat, lng) {

    $('#direction').show();
    $('#results').hide();
    $('#dest-direction').val(dest);
    $('#origin-direction').val($('#address').val());

    $('#get-direction').click(function() {
        var ori = $('#origin-direction').val();

        map.setZoom(7);
        var currentLatLng = new google.maps.LatLng(lat, lng);
        map.setCenter(currentLatLng);

        var directionsRenderer = new google.maps.DirectionsRenderer();
        directionsRenderer.setMap(map);
        directionsRenderer.setPanel(document.getElementById('direction'));

        var directionsService = new google.maps.DirectionsService();
        var request = {
            origin: ori,
            destination: dest,
            travelMode: google.maps.DirectionsTravelMode.DRIVING,
            unitSystem: google.maps.DirectionsUnitSystem.METRIC
        };
        directionsService.route(request, function(response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsRenderer.setDirections(response);
            } else {
                //alert('Error: ' + status);
                $('#direction').append('<table width="100%"><tr><td>' + lang[currCulture].directionNotFound + '</td></tr></table>');
            }
        });

        //$('#direction-form').nextAll().remove();

        return false;
    });
}

function directionBack() {

    $('#direction').hide();
    $('#results').show();
    resetDirection();
}

function resetDirection() {
    gmap_location_lookup($('#address').val(), $('#distance').val(), '');
    $('#direction').html('');
    $('#direction').html('<div id="direction-form"><p><table><tr><td>' + lang[currCulture].from + ':</td><td><input id="origin-direction" name="origin-direction" class="orides-txt" type=text /></td></tr><tr><td>' + lang[currCulture].to + ':</td><td><input id="dest-direction" name="dest-direction" class="orides-txt" type=text readonly /></td></tr></table><div id="get-dir-button" class="get-dir-button"><input type=submit id="get-direction" class="btn" value="' + lang[currCulture].direction + '"> <a href="javascript:directionBack()">' + lang[currCulture].back + '</a></div></p></div>');
    var origin_autocomplete = new google.maps.places.Autocomplete($("#origin-direction")[0], {});
}

$(document).ready(function(){
	$(".storecontent li").click(function(){
		$('.storecontent li').removeClass('active');
		$(this).addClass('active');
		var url=$(this).attr("data-url");
		var htmliframe='<iframe src="'+url+'" frameborder="0" scrolling="no" style="height:100%;width:100%"></iframe>';
		$("#map").html(htmliframe);
	});
});

