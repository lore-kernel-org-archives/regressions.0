Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A75E29CA
	for <regressions@lists.linux.dev>; Wed, 26 Jan 2022 07:42:23 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nCcwf-0007ms-W3; Wed, 26 Jan 2022 08:42:22 +0100
Message-ID: <46a28c62-4610-00df-610c-ca3cc8861265@leemhuis.info>
Date: Wed, 26 Jan 2022 08:42:21 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: nfs: noresvport + nfsv4 no longer working as expected (fwd from
 bugzilla)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1643182943;aa6d64c5;
X-HE-SMSGID: 1nCcwf-0007ms-W3

Hi, this is your Linux kernel regression tracker speaking.

There is a regression dealt with in bugzilla I'd like to add to the
tracking:

#regzbot introduced: v5.11.11..v5.12.19
#regzbot from: Daire Byrne <daire@dneg.com>
#regzbot title: nfs: noresvport + nfsv4 no longer working as expected
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215526

Quote:

> When mounting with "-o vers=4.2,noresvport", it seems to be ignored such that the client still uses a reserved port (or ports with nconnect).
> 
> It still works as expected when doing "-o vers=3,noresvport".
> 
> A very quick test of some kernels I had prebuilt suggests this stopped working somewhere between 5.11.11 and 5.12.19. That might make it one of:
> 
>     * tag 'nfs-for-5.12-2' of git://git.linux-nfs.org/projects/anna/linux-nfs:
>       nfs: we don't support removing system.nfs4_acl
>       NFSv4.2: fix return value of _nfs4_get_security_label()
>       NFS: Fix open coded versions of nfs_set_cache_invalid() in NFSv4
>       NFS: Fix open coded versions of nfs_set_cache_invalid()
>       NFS: Clean up function nfs_mark_dir_for_revalidate()
>       NFS: Don't gratuitously clear the inode cache when lookup failed
>       NFS: Don't revalidate the directory permissions on a lookup failure
>       SUNRPC: Set memalloc_nofs_save() for sync tasks
>       NFS: Correct size calculation for create reply length
>       nfs: fix PNFS_FLEXFILE_LAYOUT Kconfig default
> 
> I will try and get a bisect done this week.

Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat)

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply, that's in everyone's interest.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.

---
Additional information about regzbot:

If you want to know more about regzbot, check out its web-interface, the
getting start guide, and/or the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for reporters: when reporting a regression it's in your interest to
tell #regzbot about it in the report, as that will ensure the regression
gets on the radar of regzbot and the regression tracker. That's in your
interest, as they will make sure the report won't fall through the
cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot once
it's involved. Fix the issue as you normally would, just remember to
include a 'Link:' tag to the report in the commit message, as explained
in Documentation/process/submitting-patches.rst
That aspect was recently was made more explicit in commit 1f57bd42b77c:
https://git.kernel.org/linus/1f57bd42b77c
