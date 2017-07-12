{{strip}}
  <tr class="battle-row" data-period="{{$model->period|escape}}">
    <td class="nobr">
      <a href="{{url route='show-v2/battle' screen_name=$model->user->screen_name battle=$model->id}}" class="btn btn-primary btn-xs">
        {{'Detail'|translate:'app'|escape}}
      </a>
      {{if $model->link_url}}
        {{use class="app\components\widgets\EmbedVideo"}}
        {{use class="rmrevin\yii\fontawesome\FontAwesome"}}
        &#32;
        {{if EmbedVideo::isSupported($model->link_url)}}
          <a href="{{$model->link_url|escape}}" class="btn btn-default btn-xs" rel="nofollow">
            {{FontAwesome::icon('video-camera')->fixedWidth()}}
          </a>
        {{else}}
          <a href="{{$model->link_url|escape}}" class="btn btn-default btn-xs" rel="nofollow">
            {{FontAwesome::icon('link')->fixedWidth()}}
          </a>
        {{/if}}
      {{/if}}
    </td>
    <td class="cell-lobby">
      {{$model->lobby->name|default:'?'|translate:'app-rule2'|escape}}
    </td>
    <td class="cell-rule">
      {{$model->rule->name|default:'?'|translate:'app-rule2'|escape}}
    </td>
    <td class="cell-rule-short">
      <span class="auto-tooltip" title="{{$model->rule->name|default:'?'|translate:'app-rule2'|escape}}">
        {{$model->rule->short_name|default:'?'|translate:'app-rule2'|escape}}
      </span>
    </td>
    <td class="cell-map">
      {{$model->map->name|default:'?'|translate:'app-map2'|escape}}
    </td>
    <td class="cell-map-short">
      <span class="auto-tooltip" title="{{$model->map->name|default:'?'|translate:'app-map2'|escape}}">
        {{$model->map->short_name|default:'?'|translate:'app-map2'|escape}}
      </span>
    </td>
    <td class="cell-main-weapon">
      {{if $model->weapon}}
        <span title="{{*
            *}}{{'Sub:'|translate:'app'|escape}}{{$model->weapon->subweapon->name|default:'?'|translate:'app-subweapon2'|escape}} / {{*
            *}}{{'Special:'|translate:'app'|escape}}{{$model->weapon->special->name|default:'?'|translate:'app-special2'|escape}}" class="auto-tooltip">
          {{$model->weapon->name|default:'?'|translate:'app-weapon2'|escape}}
        </span>
      {{else}}
        ?
      {{/if}}
    </td>
    <td class="cell-main-weapon-short">
      {{if $model->weapon}}
        <span title="{{*
            *}}{{$model->weapon->name|translate:'app-weapon2'|escape}} / {{*
            *}}{{'Sub:'|translate:'app'|escape}}{{$model->weapon->subweapon->name|default:'?'|translate:'app-subweapon2'|escape}} / {{*
            *}}{{'Special:'|translate:'app'|escape}}{{$model->weapon->special->name|default:'?'|translate:'app-special2'|escape}}" class="auto-tooltip">
          {{$model->weapon->name|default:'?'|translate:'app-weapon2'|weapon_shorten|escape}}
        </span>
      {{else}}
        ?
      {{/if}}
    </td>
    <td class="cell-sub-weapon">
      {{$model->weapon->subweapon->name|default:'?'|translate:'app-subweapon2'|escape}}
    </td>
    <td class="cell-special">
      {{$model->weapon->special->name|default:'?'|translate:'app-special2'|escape}}
    </td>
    <td class="cell-level">
      {{$model->level|default:''|escape}}
    </td>
{{*
    <td class="cell-level-after">
      {{$model->level_after|default:''|escape}}
    </td>
*}}
    <td class="cell-result">
      {{if $model->is_win === null}}
        ?
      {{elseif $model->is_win}}
        <span class="label label-success">
          {{'Won'|translate:'app'|escape}}
        </span>
      {{else}}
        <span class="label label-danger">
          {{'Lost'|translate:'app'|escape}}
        </span>
      {{/if}}
    </td>
    <td class="cell-kd nobr">
      <span class="kill">
        {{if $model->kill === null}}
          ?
        {{elseif $model->death !== null && $model->kill >= $model->death}}
          <strong>{{$model->kill|escape}}</strong>
        {{else}}
          {{$model->kill|escape}}
        {{/if}} 
      </span> / <span class="death">
        {{if $model->death === null}}
          ?
        {{elseif $model->kill !== null && $model->kill <= $model->death}}
          <strong>{{$model->death|escape}}</strong>
        {{else}}
          {{$model->death|escape}}
        {{/if}} 
      </span>
      {{if $model->kill !== null && $model->death !== null}}
        &#32;
        {{if $model->kill > $model->death}}
          <span class="label label-success">&gt;</span>
        {{elseif $model->kill < $model->death}}
          <span class="label label-danger">&lt;</span>
        {{else}}
          <span class="label label-default">=</span>
        {{/if}}
      {{/if}}
    </td>
    {{if $model->kill_ratio !== null}}
      <td class="text-right kill-ratio cell-kill-ratio" data-kill-ratio="{{$model->kill_ratio|escape}}">
        {{$model->kill_ratio|number_format:2|escape}}
      </td>
    {{else}}
      <td class="cell-kill-ratio"></td>
    {{/if}}
    {{if $model->kill_rate !== null}}
      <td class="text-right kill-rate cell-kill-rate" data-kill-ratio="{{$model->kill_ratio|escape}}">
        {{$model->kill_rate|percent:1|escape}}
      </td>
    {{else}}
      <td class="cell-kill-rate"></td>
    {{/if}}
    <td class="cell-point">
      {{if $model->my_point !== null}}
        {{$model->inked|default:'?'|escape}}
      {{/if}}
    </td>
    <td class="cell-rank-in-team">
      {{$model->rank_in_team|default:'?'|escape}}
    </td>
    <td class="cell-datetime">
      {{if $model->end_at === null}}
        {{'N/A'|translate:'app'|escape}}
      {{else}}
        {{$model->end_at|as_datetime:'short':'short'|escape}}
      {{/if}}
    </td>
    <td class="cell-reltime">
      {{if $model->end_at === null}}
        {{'N/A'|translate:'app'|escape}}
      {{else}}
        {{$t = $model->end_at|strtotime}}
        <span class="auto-tooltip" title="{{$model->end_at|as_datetime|escape}}">
          {{$app->formatter->asRelativeTime($t)|escape}}
        </span>
      {{/if}}
    </td>
  </tr>
{{/strip}}
