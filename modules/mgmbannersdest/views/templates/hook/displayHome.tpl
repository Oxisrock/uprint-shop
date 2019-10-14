<div class="container">
    <div class="row">
    {$count = count($data)}
        <div id="mgm_slider_banners">
        {foreach from=$data key=myId item=i}
        {if $count%3 == 0}
         <div class="container">
            <div class="row">
        {/if}
        {if $count%3 == 0}
                <div class="col-lg-6 col-md-6 col-xs-12">
                        <div class="row">
                            <a href="{$i.mgmd_url}" ><img src="{$i.mgmd_image}"  class="img-fluid pbannerg"/></a>
                        </div>
                </div>
                
        {else}
                <div class="col-lg-3 col-md-3 col-xs-6">
                        <div class="row">
                            <a href="{$i.mgmd_url}" ><img src="{$i.mgmd_image}" class="img-fluid pbannerpl"/></a>
                        </div>
                    </div>            
                
        {/if}
        {!$count--}
        {if $count%3 == 0}
                </div>
            </div>
         {/if}
        {/foreach}
        </div>
     </div>
</div>