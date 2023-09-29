Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37668399
	for <regressions@lists.linux.dev>; Fri, 29 Sep 2023 05:07:12 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qm5iX-00058B-R6; Fri, 29 Sep 2023 07:07:09 +0200
Message-ID: <70bc9c9d-2f7b-4254-a697-44f5e02308c4@leemhuis.info>
Date: Fri, 29 Sep 2023 07:07:07 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression?] escaping commas in overlayfs mount options
Content-Language: en-US, de-DE
To: Ryan Hendrickson <ryan.hendrickson@alum.mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <8da307fb-9318-cf78-8a27-ba5c5a0aef6d@alum.mit.edu>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <8da307fb-9318-cf78-8a27-ba5c5a0aef6d@alum.mit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695964033;23d5de6b;
X-HE-SMSGID: 1qm5iX-00058B-R6

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 29.09.23 03:07, Ryan Hendrickson wrote:
> Up to and including kernel 6.4.15, it was possible to have commas in the
> lowerdir/upperdir/workdir paths used by overlayfs, provided they were
> escaped with backslashes:
> 
>     mkdir /tmp/test-lower, /tmp/test-upper /tmp/test-work /tmp/test
>     mount -t overlay overlay -o
> 'lowerdir=/tmp/test-lower\,,upperdir=/tmp/test-upper,workdir=/tmp/test-work' /tmp/test
> 
> In 6.5.2 and 6.5.5, this no longer works; dmesg reports that overlayfs
> can't resolve '/tmp/test-lower' (without the comma).
> 
> I see that there is a commit between the 6.4 and 6.5 lines titled [ovl:
> port to new mount api][1]. I haven't compiled a kernel before and after
> this commit to verify, but based on the code it deletes I strongly
> suspect that it, or if not then one of the ovl commits committed on the
> same day, is responsible for this change.
> 
> [1]:
> https://github.com/torvalds/linux/commit/1784fbc2ed9c888ea4e895f30a53207ed7ee8208
> 
> Does this count as a regression? I can't find documentation for this
> escaping feature anywhere, even as it pertains to the non-comma
> characters '\\' and ':' (which, I've tested, can still be escaped as
> expected), so perhaps it was never properly supported? But a search for
> escaping commas in overlayfs turns up resources like [this post][2],
> suggesting that there are others who figured this out and expect it to
> work.
> 
> [2]: https://unix.stackexchange.com/a/552640
> 
> Is there a new way to escape commas for overlayfs options?

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced v6.4..v6.5.2
#regzbot title ovl: commas in overlayfs mount options broke
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
