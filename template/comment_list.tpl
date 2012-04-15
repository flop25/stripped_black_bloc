{* $Id$ *}
<ul class="commentList">
	{foreach from=$comments item=comment name=comment_loop}
		<li class="comment">
			{if isset($comment.TN_SRC)}
				<div class="illustration">
					<a href="{$comment.U_PICTURE}"><img src="{$comment.TN_SRC}" alt="{$comment.ALT}" /></a>
				</div>
			{elseif isset($comment.src_image)}
				<div class="illustration">
					<a href="{$comment.U_PICTURE}"><img src="{$pwg->derivative_url($derivative_params, $comment.src_image)}" alt="{$comment.ALT}" /></a>
				</div>
			{/if}
			<div class="description">
				{if isset($comment.U_DELETE) or isset($comment.U_VALIDATE) or isset($comment.U_EDIT) }
					<div class="actions">
						{if isset($comment.U_DELETE)}
							<a href="{$comment.U_DELETE}" title="{'delete this comment'|@translate}" onclick="return confirm('{'Are you sure?'|@translate|@escape:javascript}');">
								[{'Delete'|@translate}]
							</a>
						{/if}
						{if isset($comment.U_EDIT) and !isset($comment.IN_EDIT)}
							<a class="editComment" href="{$comment.U_EDIT}#edit_comment" title="{'edit this comment'|@translate}">
								[{'edit'|@translate}]
							</a>
						{/if}
						{if isset($comment.U_VALIDATE)}
							<a href="{$comment.U_VALIDATE}" title="{'validate this comment'|@translate}">
								[{'validate'|@translate}]
							</a>
						{/if}
					</div>
				{/if}
				<span class="author">{$comment.AUTHOR}</span> - <span class="date">{$comment.DATE}</span>
				{if isset($comment.IN_EDIT)}
					<a name="edit_comment"></a>
					<form  method="post" action="{$comment.U_EDIT}" class="filter" id="editComment">
						<fieldset>
							<legend>{'Edit a comment'|@translate}</legend>
							<label><textarea name="content" id="contenteditid" rows="4" cols="80">{$comment.CONTENT|@escape}</textarea></label>
							<input type="hidden" name="key" value="{$comment.KEY}">
							<input type="hidden" name="image_id" value="{$comment.IMAGE_ID|@default:$current.id}">
							<input class="submit" type="submit" value="{'Submit'|@translate}">
						</fieldset>
					</form>
				{else}
					<blockquote><div>{$comment.CONTENT}</div></blockquote>
				{/if}
			</div>
		</li>
	{/foreach}
</ul>
<div style="clear: both;"></div>
{footer_script}{literal}
	jQuery("document").ready(function(jQuery) {
		var rT=jQuery(".replyTo");
		if (rT.length !=0) {
			var trT=rT.attr("title");
			var pe=trT.search(" ");
			if (pe>0) trT=trT.substring(0,pe);
			rT.text("["+trT+"]");
		}
	});
{/literal}{/footer_script}
