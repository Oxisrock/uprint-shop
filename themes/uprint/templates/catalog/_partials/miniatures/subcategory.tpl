<div class="icon-cont">
	<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="img">
		<img class="replace-2x" src="{$urls.base_url}img/c/{$subcategory.id_category}_thumb.jpg" alt="{$subcategory.name|escape:'html':'UTF-8'}" />
		<center>{$subcategory.name|truncate:25:'...'|escape:'html':'UTF-8'}</center>
	</a>
</div>