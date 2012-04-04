{html_style}{literal}
FORM.properties SPAN.property {
    float: left;
    font-weight: bold;
    margin: 0;
    padding: 0 0.5em 0 0;
    text-align: right;
    width: auto;
}
{/literal}{/html_style}

<div class="titrePage">
  <h2>{'Stripped & Columns Theme Configuration'|@translate}</h2>
</div>
<form method="post" class="properties" action="" ENCTYPE="multipart/form-data" name="form" class="properties">
<div id="configContent">
  <fieldset>
    <legend>{'Displaying options'|@translate}</legend>
    <ul>
    <li>
      <label for="color_main"><span class="property">{'color main'|@translate}</span>&nbsp;</label>
      <input type="text" id="color_main" name="f_color_main" size="6" maxlength="6" value="{$options.color_main}" style="text-align:center;">
    </li>
    <li>
    <li>
      <label for="column_width"><span class="property">{'Width of columns'|@translate}</span>&nbsp;</label>
      <input type="text" id="column_width" name="f_column_width" size="4" maxlength="4" value="{$options.column_width}" style="text-align:center;">
      &nbsp;{'pixels'|@translate}
    </li>
    <li>
      <label for="column_width"><span class="property">{'Width of thumbnails'|@translate}</span>&nbsp;</label>
      <input type="text" id="column_width" name="f_thumbnail_width" size="4" maxlength="4" value="{$options.thumbnail_width}" style="text-align:center;">
      &nbsp;{'pixels'|@translate}&nbsp;{'(it need to be inferior than the width of columns)'|@translate}
    </li>
    <li>
      <label for="every_x"><span class="property">{'Create a big thumbnail every'|@translate}</span>&nbsp;</label>
      <input type="text" id="every_x" name="f_every_x" size="5" maxlength="5" value="{$options.every_x}" style="text-align:center;">
       {'Thumbnails'|@translate}&nbsp;{'(set 0 to disable)'|@translate}
    </li>
    <li>
      <label for="starting_to"><span class="property">{'... starting to the position number'|@translate}</span>&nbsp;</label>
      <input type="text" id="starting_to" name="f_starting_to" size="2" maxlength="2" value="{$options.starting_to}" style="text-align:center;">
      &nbsp;{'(set 0 to disable)'|@translate}
    </li>
    <li>
      <br><br>
        <label for="thumbnail">{'About big thumbnails, for the albums :'|@translate}</label>
      <br><br>
      <label>
        <input type="radio" name="f_catthumb" id="catthumb" value="none"  {if $options.catthumb=="none"}checked{/if}>
        &nbsp;{'don\'t generate big thumbnails'|@translate}</label>
      <br>
      <label>
        <input type="radio" name="f_catthumb" id="catthumb" value="same" {if $options.catthumb=="same"}checked{/if}>
        &nbsp;{'use the same config as above'|@translate}</label>
      <br>
      <label>
        <input type="radio" name="f_catthumb" id="catthumb" value="all" {if $options.catthumb=="all"}checked{/if}>
        &nbsp;{'always generate big thumbnails'|@translate}</label>
      <br>
    </li>
  </fieldset>
  </ul>
</div>
<p>
  <input class="submit" type="submit" value="{'Submit'|@translate}" name="submit_stripped_black_bloc" />
</p>
</form>
