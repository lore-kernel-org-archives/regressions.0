Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8161FA1
	for <regressions@lists.linux.dev>; Thu, 24 Mar 2022 15:02:45 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nXOz3-0006fy-QD; Thu, 24 Mar 2022 16:02:41 +0100
Message-ID: <ec2eeead-6f4f-a851-be21-0b9db8f4c22e@leemhuis.info>
Date: Thu, 24 Mar 2022 16:02:41 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Filippo Falezza <filippo.falezza@outlook.it>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Backlight Regression in i915 that isn't handled appropriately afaics
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1648134165;52becb19;
X-HE-SMSGID: 1nXOz3-0006fy-QD

Hi i915 maintainers, this is your Linux kernel regression tracker!
What's up with the following regression?

https://gitlab.freedesktop.org/drm/intel/-/issues/5284

That report it more than two weeks old now, but seems nothing of
substance happened. And the thing is: the report is older, as the issue
in fact was reported on 2022-01-31 already here:

https://bugzilla.kernel.org/show_bug.cgi?id=215553

After that there was a different ticket about it later here:
https://gitlab.freedesktop.org/drm/intel/-/issues/5027

But it got confusing, so the reporter created the ticket the first link
in this message points to. I fully understand some of the reasons why
this was not handled appropriately, but it looks like even the latest
ticket is mostly ignored, apart from some bug triaging.

So could anybody please take a look into this at at least tell the
reporter what to do to (bisection maybe?) get this solved?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

P.S.S.: for rezgbot:

Link:
https://lore.kernel.org/regressions/74ee2216-a295-c2b6-328b-3e6d0cc1847e@leemhuis.info/


