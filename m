Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5497E
	for <regressions@lists.linux.dev>; Wed, 19 Oct 2022 16:24:01 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id D431283528B
	for <regressions@lists.linux.dev>; Wed, 19 Oct 2022 18:18:15 +0200 (CEST)
Received: from zimbra59-e10.priv.proxad.net (unknown [172.20.243.209])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 0C8D819F5AF;
	Wed, 19 Oct 2022 18:18:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1666196288;
	bh=Pm/EqWEbJ0hJheqvBqZmNf9qn6cGXW/G7iT0GFcr5EY=;
	h=Date:From:To:Cc:In-Reply-To:Subject:From;
	b=G+SoyyooIx4gby1nJ7Fk7dFR/4C2USpgk9NFbtGHDXWEzc9oNrjBotZU43OtHCuh0
	 dfan4nUiccPx3gvmxzP4KXk0Pjhamo5LoL82PvyNKt6+xcqLuu2nNMx9nXHlJLmqcu
	 cHATROltxHcRaLTBRmVTO9oX7bVWTMlSkG+AfCXevWcHBENNkGsRmYUMgDkjWXYi6g
	 p+DanzlxvvgzF171TxwxHs91Hy4OuzPHyMIPRP+n1peqjJQoYMZUOKINUX7QzFOrCn
	 raQFH7s+Kzwz5XI5hmOyeUAC0/+whjpAc8EUbRXn9kAbgtVLbqIn8GE0HD3H8eSoHq
	 McSgEXpsNcd+Q==
Date: Wed, 19 Oct 2022 18:18:07 +0200 (CEST)
From: denis.chancogne@free.fr
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	regressions@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	xen-devel@lists.xenproject.org, 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <478267192.700718309.1666196287955.JavaMail.root@zimbra59-e10.priv.proxad.net>
In-Reply-To: <402ab0ef-8bea-6210-1585-2e0e217a2e08@leemhuis.info>
Subject: Re: Bug 216581 - Kernel panic on /init as busybox symbolic link
 with xen efi
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [90.83.51.20]
X-Mailer: Zimbra 7.2.0-GA2598 (ZimbraWebClient - GC80 (Win)/7.2.0-GA2598)
X-Authenticated-User: denis.chancogne@free.fr

>On 17.10.22 02:23, Marek Marczykowski-G=C3=B3recki wrote:
>> On Sun, Oct 16, 2022 at 01:08:53PM +0200, Thorsten Leemhuis wrote:
>
>>>>  Denis Chancogne 2022-10-13 22:00:19 UTC
>>>>
>>>> when I start Xen 4.15.3 in efi with kernel 5.18.19, all works well;
>>>> but since kernel 5.19, I have a kernel panic on my /init process as
>>>> busybox symbolic link inside initramfs.
>>>>
>>>> This is the kernel log :
>> [...]
>>=20
>> Thanks for forwarding.
>>=20
>> This is already fixed on the Xen side: https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dcommit;h=3Dc3bd0b83ea5b7c0da6542687436042eeea1e7909
>> The commit is also in 4.15 branch already:
>> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D7923ea47e578b=
ca30a6e45951a9da09e827ff028,
>> to be included in 4.15.4 rather soon.
>
>Hmmm. Well, strictly speaking this is still a kernel regression that
>should be fixed (or worked around) on the kernel level. But 5.19 is out
>for a while already and this afaics was the first report of this problem
>in kernel land. Maybe it's not worth it, so let's leave everything as it
>is for now, if that's okay for Denis. We IMHO will need to reconsider if
>more users run into this.
>
>Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>
>#regzbot introduced: 8ad7e8f69695
>#regzbot invalid: it is a kernel regression, but one that can be worked
>around by updating Xen hypervisor

Hi all,
thanks a lot for your responses, it's very well for me.
I will wait for xen-4.15.4 to use latest kernel release.
Regards
Denis
