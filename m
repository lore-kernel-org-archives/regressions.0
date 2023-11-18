Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F057D107BB
	for <regressions@lists.linux.dev>; Sat, 18 Nov 2023 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r4Lc4-0004jA-If; Sat, 18 Nov 2023 14:43:56 +0100
Message-ID: <932a34b2-b1b8-43f9-8a1e-3707147a271a@leemhuis.info>
Date: Sat, 18 Nov 2023 14:43:55 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: platform/x86/intel/pmc: regression found in commit
 804951203aa541ad6720c9726c173d18aeb3ab6b
Content-Language: en-US, de-DE
To: Linux kernel regressions list <regressions@lists.linux.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAD+OKUp=MA6VahvoM0cXgrM1uSwGtqaTV80-+x2VBLgN1RPzag@mail.gmail.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAD+OKUp=MA6VahvoM0cXgrM1uSwGtqaTV80-+x2VBLgN1RPzag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1700315044;5339c740;
X-HE-SMSGID: 1r4Lc4-0004jA-If

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 13.11.23 16:42, James Hutchinson wrote:
> Running here on an Intel NUC 8i3BEH Coffee Lake machine under Arch Linux.
> 
> Connected to this machine I have 4x USB DVB Cards (2xDVBSky S960
> DVB-S2 adapters & 2xGeniatech T230 DVB-T2 adapters), and I stream TV
> Channels around the house via Tvheadend.
> 
> Since linux kernel v6.5 onwards I noticed a bad performance regression
> whereby the streams are basically unstable. There are tons of
> continuity errors in the Tvheadend logfile, and the picture and sound
> are badly broken up as though the system is throttled or does not have
> the bandwidth to cope with the streams.
> 
> Sometimes the stream will work for a minute or so after reboot, before
> then becoming unstable, and then seems to remain unstable until the
> next cold reboot.
> 
> I dropped back to v6.1 LTS (where everything is fine) and re-tested
> following the release of v6.6...
> ...the problem had not gone away so I performed a git bisect to
> identify the culprit and found this to be:
> 
> 804951203aa541ad6720c9726c173d18aeb3ab6b: platform/x86:intel/pmc:
> Combine core_init() and core_configure()
> 
> I can work around the issue by either reverting this commit or by
> disabling CONFIG_INTEL_PMC_CORE and rebuilding the kernel manually,
> either of which results in perfect DVB streaming once more.
> 
> Happy to test any potential patches or otherwise provide further
> information as required.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 804951203aa541ad6720c9726
https://bugzilla.kernel.org/show_bug.cgi?id=218143
#regzbot title platform/x86/intel/pmc: bad performance regression
whereby the TV streams are basically unstable
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
