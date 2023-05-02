Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F6510E4
	for <regressions@lists.linux.dev>; Tue,  2 May 2023 11:41:34 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ptoNt-0003FQ-17; Tue, 02 May 2023 13:41:29 +0200
Message-ID: <2f07294a-b9a2-62c2-29a3-cd52d0ecb386@leemhuis.info>
Date: Tue, 2 May 2023 13:41:26 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Fwd: 6.1.23: 0fc6fea41c71 breaks GPD Pocket 3 modeset
Content-Language: en-US, de-DE
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <4115dc28-45b6-cad1-1e38-39e5a0484a8a@garloff.de>
 <fce7ea8d-d89c-daf0-f900-d26455d1bb74@garloff.de>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kurt Garloff <kurt@garloff.de>, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <fce7ea8d-d89c-daf0-f900-d26455d1bb74@garloff.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1683027694;e38e0c78;
X-HE-SMSGID: 1ptoNt-0003FQ-17

[CCing the intel drm maintainers and the lists; also CCing the
regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 29.04.23 23:38, Kurt Garloff wrote:
> Hi Ville,
> 
> (sorry for the resend, had forgotten that LKML still believes
> that multipart with an HTML version is evil)
> 
> While
> 0fc6fea41c71 drm/i915: Disable DC states for all commits
> (cherry picked from commit 41b4c7fe72b6105a4b49395eea9aa40cef94288d)

/me wonders if 6.3 is affected as well, but will treat it as stable
specific regression for now

> does look correct to me, it does break modesetting on the
> GPD Pocket 3, a i7-1195G7 laptop. I run the kernel with
> fbcon=rotate:1 video=DSI-1:panel_orientation=right_side_up \
>   mem_sleep_default=s2idle
> No special i915 parameters.
> 
> Hardware is described here:
> https://wiki.archlinux.org/title/GPD_Pocket_3
> 
> I disected this patch which was merged (backported) for 6.1.23.
> I currently run 6.1.26 with it reverted and life is good.
> 
> Without reverting it, when fbcon is switched to show the splash
> screen (GPD logo with Ubuntu added in on working kernels), the
> screen remains black (backlight on, but nothing displayed) and
> nothing happens any more. It looks like something more serious
> than just blackness, as SysRq or Ctrl-Alt-Del don't do anything.
> Deadlocking?

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 0fc6fea41c71
#regzbot title drm: i915: GPD Pocket 3 modeset broken
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
