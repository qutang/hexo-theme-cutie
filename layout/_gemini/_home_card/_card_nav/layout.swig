<div class="swiper-container card-nav">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            {{ partial('_gemini/_home_card/_card_nav/title_and_time', {is_link_post: is_link_post, 
                                                             external_link: external_link, 
                                                             page_url: page_url, 
                                                             title_display: title_display, 
                                                             archive_url: archive_url,
                                                             page_date: page_date
                                                             }) }}
        </div>
        <div class="swiper-slide">
            {{ partial('_gemini/_home_card/_card_nav/stats', {is_link_post: is_link_post,
                                                    use_post_stats: use_post_stats,
                                                    comment_url: comment_url
            }) }}
        </div>
    </div>
</div>