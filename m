Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DFB171B1
	for <regressions@lists.linux.dev>; Fri, 26 May 2023 12:22:55 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q2WT0-0000gw-Dn; Fri, 26 May 2023 14:22:46 +0200
Message-ID: <ec3a1e77-82bf-46a6-08c3-fb00a99b7ad7@leemhuis.info>
Date: Fri, 26 May 2023 14:22:45 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linus Walleij <linus.walleij@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, jose.exposito89@gmail.com,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
 <ce0b54a6-807c-4afc-279e-022fc9ecaa7e@leemhuis.info>
In-Reply-To: <ce0b54a6-807c-4afc-279e-022fc9ecaa7e@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1685103775;ffc5c36c;
X-HE-SMSGID: 1q2WT0-0000gw-Dn

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Link: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 14.05.23 14:10, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> On 12.05.23 15:20, Linus Walleij wrote:
>> Sorry for late regression detection but this patch regresses
>> the Integrator AB IMPD-1 graphics, I bisected down to this
>> patch.
> 
> #regzbot ^introduced 37c90d589dc
> #regzbot title drm/fb-helper: downscaling apparently stopped to work
> with pl110_impd1
> #regzbot ignore-activity

#regzbot monitor:
https://lore.kernel.org/all/20230515092943.1401558-1-linus.walleij@linaro.org/
#regzbot fix: drm/pl111: Fix FB depth on IMPD-1 framebuffer
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

