<div class="container">
    <div class="row">
    {$count = count($data)}
        <div id="img-slider" class="hidden-xs-down">
        {foreach from=$data key=myId item=i}
                <a href="{$i.mgmd_url}" ><img src="{$i.mgmd_image}" class="img-fluid"/></a>
        {/foreach}
        </div>
          <div id="img-slider-responsive" class="hidden-sm-up">
        {foreach from=$data key=myId item=i}
                <a href="{$i.mgmd_url}" class="d-none" ><img src="{$i.mgmd_image_responsive}" class="img-fluid"/></a>
        {/foreach}
        </div>
     </div>
</div>