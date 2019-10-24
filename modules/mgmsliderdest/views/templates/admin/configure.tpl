<div class="row">
	<div class="col-lg-12">
		<div class="panel">
			<table class="table tableDnD cms" id="cms_block_0">
				<thead>
					<tr class="nodrag nodrop">
						<th>ID</th>
						<th>Imagen destop</th>
						<th>Imagen responsive</th>
						<th>Url</th>
						<th>Accion</th>
					</tr>
				</thead>
				<tbody>
				{foreach from=$data key=myId item=i}
					<tr class="not_alt_row row_hover" id="tr_0_1_0">
						<td>{$i.id}
						<input type="hidden" name="data_{$i.id}" id="data_{$i.id}" value="{$i|json_encode}">
						</td>
                        <td>
						{if $i.mgmd_image != ''}
							<a href="{$i.mgmd_image}" target="_blank">
								<img class="img-fluid" src="{$i.mgmd_image}" style="max-width: 100%;">
							</a>
						{else}
							No Registra
						{/if}

						</td>
						 <td>
						{if $i.mgmd_image_responsive != ''}
							<a href="{$i.mgmd_image_responsive}" target="_blank">
								<img class="img-fluid" src="{$i.mgmd_image_responsive}" style="max-width: 100%;">
							</a>
						{else}
							No Registra
						{/if}

						</td>
						<td>{$i.mgmd_url}</td>
						<td>
							<div class="btn-group-action">
								<div class="btn-group">
									<a class="btn btn-default mgmd_update" data-reg='{$i|json_encode}' title="Modificar">
										<i class="icon-edit"></i> Modificar
									</a>
									<button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down"></i>&nbsp;
									</button>
									<ul class="dropdown-menu">
									<li>
										<a class="mgmd_delete" data-id='{$i.id}' title="Eliminar">
											<i class="icon-trash"></i> Eliminar
										</a>
									</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>
				{/foreach}
				</tbody>
			</table>
		</div>
	</div>
</div>
<form id='form_delete' action="{$action_url}" method="post" enctype="multipart/form-data">
	<input type="hidden" value="" name="id_delete" id="id_delete">
	<input type="hidden" value="1" name="mgmd_delete">
	<input type="hidden" value="1" name="{$generic_delete}" id="{$generic_delete}">
</form>