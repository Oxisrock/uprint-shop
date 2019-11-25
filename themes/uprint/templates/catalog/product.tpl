{**
* 2007-2018 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License 3.0 (AFL-3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* https://opensource.org/licenses/AFL-3.0
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2018 PrestaShop SA
* @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
* International Registered Trademark & Property of PrestaShop SA
*}
{extends file=$layout}

{block name='head_seo' prepend}
<link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
<meta property="og:type" content="product">
<meta property="og:url" content="{$urls.current_url}">
<meta property="og:title" content="{$page.meta.title}">
<meta property="og:site_name" content="{$shop.name}">
<meta property="og:description" content="{$page.meta.description}">
<meta property="og:image" content="{$product.cover.large.url}">
<meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
<meta property="product:pretax_price:currency" content="{$currency.iso_code}">
<meta property="product:price:amount" content="{$product.price_amount}">
<meta property="product:price:currency" content="{$currency.iso_code}">
{if isset($product.weight) && ($product.weight != 0)}
<meta property="product:weight:value" content="{$product.weight}">
<meta property="product:weight:units" content="{$product.weight_unit}">
{/if}
{/block}

{block name='content'}

<section id="main" itemscope itemtype="https://schema.org/Product">
  <meta itemprop="url" content="{$product.url}">
  <div class="container">
    <div class="row">
      <div class="col-md-4">
        {block name='page_header_container'}
        {block name='page_header'}
        <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
        {/block}
        {/block}
        {block name='page_content_container'}
        <section class="page-content" id="content">
          {block name='page_content'}
          {block name='product_flags'}
          <ul class="product-flags">
            {foreach from=$product.flags item=flag}
            <li class="product-flag {$flag.type}">{$flag.label}</li>
            {/foreach}
          </ul>
          {/block}

          {block name='product_cover_thumbnails'}
          {include file='catalog/_partials/product-cover-thumbnails.tpl'}
          {/block}
          <div class="scroll-box-arrows">
            <i class="material-icons left">&#xE314;</i>
            <i class="material-icons right">&#xE315;</i>
          </div>

          {/block}
        </section>
        {/block}
        <div id="accordion" class="accordionproducts">
          <div class="card">
            <div class="card-header" id="fileCheck">
              <h5 class="mb-0">
                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                  <i class="fa fa-check"></i> Chequeo de archivo gratis
                </button>
              </h5>
            </div>

            <div id="collapseOne" class="collapse" aria-labelledby="fileCheck" data-parent="#accordion">
              <div class="card-body p-2">
                <p><b>Como parte de nuestro servicio revisaremos gratuitamente lo siguiente:</b></p>
                <p><i class="fa fa-circle-o"></i>  Ancho y alto del archivo a imprimir.</p>
                <p><i class="fa fa-circle-o"></i>  PDF como formato del archivo.</p>
                <p><i class="fa fa-circle-o"></i>  Que tenga una calidad mínima de impresión, cercana a los 266 ppp.</p>
                <p><i class="fa fa-circle-o"></i>  Color en modo CMYK. Si hay colores Pantone® serán convertidos automáticamente a CMYK, salvo que el cliente haya pagado adicionalmente un servicio de igualación de color.</p>
                <p><i class="fa fa-circle-o"></i>  Qué el número de páginas corresponda con el pedido. No se verifica el orden de las mismas ni si hay algunas repetidas.</p>
                <a href="">Ver más...</a>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header" id="headingTwo">
              <h5 class="mb-0">
                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                  <i class="fa fa-print"></i>  Prepará tus archivos para imprimir
                </button>
              </h5>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse in" aria-labelledby="headingTwo" data-parent="#accordion">
              <div class="card-body p-2">
                <p><i class="fa fa-circle-o"></i>  Resolución mínima 266 ppp (dpi).</p>
                <p><i class="fa fa-circle-o"></i>  Modo de color CMYK.</p>
                <p><i class="fa fa-circle-o"></i>  Formato PDF. Cada página debe estar separada; pero todas contenidas en un solo archivo.</p>
                <p><i class="fa fa-circle-o"></i>  Fuentes convertidas a curvas e imágenes incrustadas.</p>
                <p><i class="fa fa-circle-o"></i>  Demasía interna y externa de 3 mm por lado de corte.</p>
                <br>
                <p>Si detectamos algún detalle que pueda quitarle calidad al resultado final de tu trabajo, te contactarémos.</p>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header" id="attention">
              <h5 class="mb-0">
                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                <i class="fa fa-exclamation-circle"></i>  Ten en cuenta esto
                </button>
              </h5>
            </div>
            <div id="collapseThree" class="collapse" aria-labelledby="atenccion" data-parent="#accordion">
              <div class="card-body p-2">              
                <p><i class="fa fa-circle-o"></i>  El precio mostrado corresponde a un solo modelo para cada pedido. Si quieres  varios modelos del mismo producto, debes ordenar cada modelo con su respectiva cantidad.</p>
                <p><i class="fa fa-circle-o"></i>  El tiempo de producción comienza a partir del momento en que se aprueba el arte final.</p>
                <p><i class="fa fa-circle-o"></i>  No está contemplado en el plazo de entrega los tiempos de envíos, estos corre por cuenta de las empresas de transporte.</p>
                <p><i class="fa fa-circle-o"></i>  La factura se emite a nombre de la persona que haga la compra, en caso de querer que sea a nombre de otra persona, por favor indícalo en “Información adicional” al momento de comprar.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-4">

        <div class="product-information">

          <div class="product-actions">
            {block name='product_buy'}
            <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
              <input type="hidden" name="token" value="{$static_token}">
              <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
              <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

              {block name='product_variants'}
              {include file='catalog/_partials/product-variants.tpl'}
              {/block}

              {block name='product_pack'}
              {if $packItems}
              <section class="product-pack">
                <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                {foreach from=$packItems item="product_pack"}
                {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                {/block}
                {/foreach}
              </section>
              {/if}
              {/block}
              {block name='product_add_to_cart'}
              {include file='catalog/_partials/product-add-to-cart.tpl'}
              {/block}
              {block name='product_discounts'}
              {include file='catalog/_partials/product-discounts.tpl'}
              {/block}
              {* Input to refresh product HTML removed, block kept for compatibility with themes *}
              {block name='product_refresh'}{/block}
              {/block}

            </div>
          </div>

        </div>
        <div class="col-md-4">

          {block name='product_prices'}
          {include file='catalog/_partials/product-prices.tpl'}
          {/block}
          <hr>
          {if $product.is_customizable && count($product.customizations.fields)}
          {block name='product_customization'}
          {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
          {/block}
          {/if}
          <button class="btn btn-success mb-1 btn-cart" style="width:100%;" id="add_cart_custom"><i class="fa fa-cart-plus fa-lg"></i>&nbsp;&nbsp;Añadir al Carrito</button>
          <img src="{$urls.base_url}img/03.JPG" class="img-fluid" style="width:100%;"> 
        </form>
      </div>
      <div class="col-md-4">
      </div>
      <div class="col-md-8">
        {block name='product_tabs'}
        <div class="tabs mb-2">
          <ul class="nav nav-tabs" role="tablist">
            {if $product.description}
            <li class="nav-item">
              <a
              class="nav-link{if $product.description} active{/if}"
              data-toggle="tab"
              href="#description"
              role="tab"
              aria-controls="description"
              {if $product.description} aria-selected="true"{/if}>{l s='Description' d='Shop.Theme.Catalog'}</a>
            </li>
            {/if}
            <li class="nav-item">
              <a
              class="nav-link{if !$product.description} active{/if}"
              data-toggle="tab"
              href="#product-details"
              role="tab"
              aria-controls="product-details"
              {if !$product.description} aria-selected="true"{/if}>{l s='Product Details' d='Shop.Theme.Catalog'}</a>
            </li>
            {if $product.attachments}
            <li class="nav-item">
              <a
              class="nav-link"
              data-toggle="tab"
              href="#attachments"
              role="tab"
              aria-controls="attachments">{l s='Attachments' d='Shop.Theme.Catalog'}</a>
            </li>
            {/if}
            {foreach from=$product.extraContent item=extra key=extraKey}
            <li class="nav-item">
              <a
              class="nav-link"
              data-toggle="tab"
              href="#extra-{$extraKey}"
              role="tab"
              aria-controls="extra-{$extraKey}">{$extra.title}</a>
            </li>
            {/foreach}
          </ul>

          <div class="tab-content" id="tab-content">
            <div class="tab-pane fade in{if $product.description} active{/if}" id="description" role="tabpanel">
              {block name='product_description'}
              <div class="product-description">{$product.description nofilter}</div>
              {/block}
            </div>

            {block name='product_details'}
            {include file='catalog/_partials/product-details.tpl'}
            {/block}

            {block name='product_attachments'}
            {if $product.attachments}
            <div class="tab-pane fade in" id="attachments" role="tabpanel">
              <section class="product-attachments">
                <p class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</p>
                {foreach from=$product.attachments item=attachment}
                <div class="attachment">
                  <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                  <p>{$attachment.description}</p
                    <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                     {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                   </a>
                 </div>
                 {/foreach}
               </section>
             </div>
             {/if}
             {/block}

             {foreach from=$product.extraContent item=extra key=extraKey}
             <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
              {$extra.content nofilter}
            </div>
            {/foreach}
          </div>  
        </div>
        {/block}
      </div>
      {block name='product_accessories'}
      {if $accessories}
      <section class="product-accessories clearfix">
        <p class="h5 text-uppercase">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
        <div class="products">
          {foreach from=$accessories item="product_accessory"}
          {block name='product_miniature'}
          {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
          {/block}
          {/foreach}
        </div>
      </section>
      {/if}
      {/block}

      {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
      {/block}

      {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
      {/block}

      {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
        <!-- Footer content -->
        {/block}
      </footer>
      {/block}
  </div>
</section>

{/block}
