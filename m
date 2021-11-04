Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4FB2C80
	for <regressions@lists.linux.dev>; Thu,  4 Nov 2021 08:50:14 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1miYRo-0005F2-GA; Thu, 04 Nov 2021 09:50:12 +0100
Message-ID: <e75eb70e-2495-dce5-34b2-0b933d887f4a@leemhuis.info>
Date: Thu, 4 Nov 2021 09:50:12 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-BS
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <42bcbea6-5eb8-16c7-336a-2cb72e71bc36@redhat.com>
 <466b8730-1424-dfc0-3f14-f279954188b9@leemhuis.info>
 <YYOF9+wDS2J0oqU8@kroah.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: 5.14.14+ USB regression caused by "usb: core: hcd: Add support
 for deferring roothub registration" series
In-Reply-To: <YYOF9+wDS2J0oqU8@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1636015814;d8b65103;
X-HE-SMSGID: 1miYRo-0005F2-GA

aOn 04.11.21 08:04, Greg KH wrote:
> On Thu, Nov 04, 2021 at 07:53:37AM +0100, Thorsten Leemhuis wrote:
>> On 03.11.21 10:02, Hans de Goede wrote:
>>>
>>> We (Fedora) have been receiving multiple reports about USB devices stopping
>>> working starting with 5.14.14 .
>>>
>>> An Arch Linux user has found that reverting the first 2 patches from this series:
>>> https://lore.kernel.org/all/20210909064200.16216-1-kishon@ti.com/
>>>
>>> Fixes things (the 3th patch is just some mostly unrelated refactoring/cleanup).
>>>
>>> See here for the Arch-linux discussion surrounding this:
>>> https://bbs.archlinux.org/viewtopic.php?pid=2000956#p2000956
>>>
>>> And here are 2 Fedora bug reports of Fedora users being unable to use their
>>> machines due their mouse + kbd not working:
>>>
>>> https://bugzilla.redhat.com/show_bug.cgi?id=2019542
>>> https://bugzilla.redhat.com/show_bug.cgi?id=2019576
>>>
>>> Can we get this patch-series reverted from the 5.14.y releases please ?
>> #regzbot ^introduced: b7a0a792f864583207c593b50fd1b752ed89f4c1
>> #regzbot ignore-activity
> 
> Process question.  Is there anything I need to do here when this is
> resolved?  I'm thinking of reverting the offending patches in 5.16-rc1,
> but when/if that happens, how will the regzbot know this?

You don't need to do something special, but you need to do something ;-)
Regzbot will know the regression got resolved if the commit message of
the fix (a proper one or a revert) in mainline links to the report with
a Link: tag. Hence, the commit should have something like this:

Link:
https://lore.kernel.org/stable/42bcbea6-5eb8-16c7-336a-2cb72e71bc36@redhat.com/

This is something you and many other developers often do already -- and
something that submitting-patches.rst since a few days states
explicitly: https://git.kernel.org/torvalds/c/1f57bd42b77c

But even if you forget that: As a regression tracker I still have an eye
on things and likely would tell regzbot about it myself, *if* I notice
the fix/revert got merged (and if not, I might send a quick 'hey' what's
up here' mail, which will be a bit annoying for the involved parties,
but that's how it is).

Side note: regbot will even notice if a patch with above Link-Tag gets
posted to one of the mainline list and link to it.


That afaics answered the question, but TWIMC: this report created some
challenges for me/regzbot due to two aspects:

1) the report specifies two commits as culprit
2) the problematic changes are in mainline, 5.15.y and 5.14.y, and I'm
unsure as of now how to handle such situations

For the first aspect I for now settled on "well, just mentioned the
second of the two commits, that's good enough for regzbot, the details
are in the report anyway".

I'm ignoring the second aspect for now and told regzbot only about the
commit in mainline, as my focus for regzbot is on mainline. I guess to
handle this properly, it would be possible to enhance regzbot and then
tall it about 807ac762afee (that's the backport of b7a0a792f864 to 5.14)
as well. But you and Sasha afaics handle things like this already quite
well afaics. But if that would make your life easier, just let me know,
than I'll put it higher on my todo list.

Ciao, Thorsten
