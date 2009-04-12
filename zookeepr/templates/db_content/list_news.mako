<%inherit file="/base.mako" />
<h1>${ h.lca_info['event_name'] } News</h1>

%if len(c.db_content_collection) is 0:
<p>Sorry, there are currently no news posts.</p>
%endif

% for d in c.db_content_collection:
<h2>${ h.link_to(d.title, url=h.url_for(action="view", id=d.id)) }</h2>
<p class="submitted">
Submitted on ${ d.creation_timestamp.strftime("%Y-%m-%d %H:%M") }
</p>
<% (teaser, read_more) = h.make_teaser(d.body) %>
${ teaser |n}
%   if read_more:
<p>${ h.link_to('Read full article', url=h.url_for(action='view', id=d.id)) }</p>
%   endif
%endfor

% if c.result == True:
<p>
% if c.db_content_pages.next_page:
    <span style="float: right;">${ h.link_to('Next page', url=h.url_for(page=c.db_content_pages.next_page)) }</span>
% endif
% if c.db_content_pages.previous_page:
    <span>${ h.link_to('Previous page', url=h.url_for(page=c.db_content_pages.previous_page)) + '  ' }</span>
% endif
</p>
% endif

<%def name="title()">
News -
 ${ caller.title() }
</%def>
