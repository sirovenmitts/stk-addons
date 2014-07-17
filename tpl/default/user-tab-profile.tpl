<div class="tab-pane active" id="profile">
    <div>
        <h1>
            {$user.username|escape}
            {if !$is_owner}
                {*Friend buttons*}
                <div data-id="{$user.user_id}">
                {if !empty($logged_friend)}
                    {if $logged_friend.is_pending}
                        {if $logged_friend.is_asker}
                            <button type="button" id="btn-accept-friend" class="btn btn-xs btn-default pull-right">{t}Accept friend request{/t}</button>
                            <button type="button" id="btn-decline-friend" class="btn btn-xs btn-default pull-right">{t}Decline friend request{/t}</button>
                        {else}
                            <button type="button" id="btn-cancel-friend" class="btn btn-xs btn-default pull-right">{t}Cancel friend request{/t}</button>
                        {/if}
                    {else}
                        <button class="btn btn-xs btn-default pull-right disabled">{t}Already friends{/t}</button>
                    {/if}
                {else}
                    <button class="btn btn-xs btn-default pull-right">{t}Send friend Request{/t}</button>
                {/if}
                </div>
            {/if}
        </h1>
    </div>
    <div class="container">
        <div class="row form-group">
            <div class="col-md-3">{t}Username:{/t}</div>
            <div class="col-md-3" id="user-username">{$user.username|escape}</div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">{t}Registration Date:{/t}</div>
            <div class="col-md-3">{$user.date_registration|escape}</div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">{t}Real Name:{/t}</div>
            <div class="col-md-3" id="user-realname">{$user.real_name|escape}</div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">{t}Role:{/t}</div>
            <div class="col-md-3" id="user-role">{$user.role|escape}</div>
        </div>
        {if $can_see_email}
            <div class="row form-group">
                <div class="col-md-3">{t}Email:{/t}</div>
                <div class="col-md-3">{$user.email|escape}</div>
            </div>
        {/if}

        {$homepage_class=""}
        {if empty($user.homepage)}
            {$homepage_class=" hide"}
        {/if}
        <div class="row form-group{$homepage_class}" id="user-homepage-row">
            <div class="col-md-3">{t}Homepage:{/t}</div>
            <div class="col-md-3" id="user-homepage"><a href="{$user.homepage|escape}">{$user.homepage|escape}</a></div>
        </div>
    </div>
    <div>
        {foreach $user.addon_types as $addon_type}
            <div>
                <h2>{$addon_type.heading}</h2>
                {if !empty($addon_type.items)}
                    <ul>
                        {*the list is already filtered in the code*}
                        {foreach $addon_type.items as $item}
                            <li class="{$item.css_class}">
                                <a href="addons.php?type={$addon_type.name}&amp;name={$item.id}">{$item.name|escape}</a>
                            </li>
                        {/foreach}
                    </ul>
                {else}
                    {$addon_type.no_items}
                    <br>
                {/if}
            </div>
        {/foreach}
    </div>
</div>