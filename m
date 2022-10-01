Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383B02569;
	Sat,  1 Oct 2022 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1664621277;
	bh=9XcJyiSJ1zJOKxj+k/EYV2eN/hgD2oEwwEhsyZZ5Q0I=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BbbTJV9mvfDhz45C0Pre80rfnT4czDmXGb8sPQys7LfPcu7lfOnMiLUgOrqSKiXMK
	 MwzfeBqZ/BCyZXEvRYcwDJOWrKg42u6qlDR2RKlCzxbmWs8/nYiWk7m2H3iwxVrQ42
	 cM8L/BOPrK4X+RMZZy5KRG4jZNoQGG2Bn9h5Sggw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.30.110.10] ([143.244.37.31]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MNbkp-1oqRiI1Rb1-00P8hC; Sat, 01
 Oct 2022 12:47:57 +0200
Message-ID: <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
Date: Sat, 1 Oct 2022 10:47:55 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com> <YzgY9X/DM9t/ZuJe@kroah.com>
From: "Artem S. Tashkinov" <aros@gmx.com>
In-Reply-To: <YzgY9X/DM9t/ZuJe@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Dn5dV2ricA5RCQPQUQ/zta9bptHyZLI4UGcOd00wnTM/PrFsn0Q
 Dg+ZEBC7VDJDZbm0zzXrk3RScsZeiIoykiRVDV7mSmjJyy5dMnTMbj6UlXTSvn39IpbVekK
 Q3jsFdiXM+1BHswm8Kyxl8qw0tvxIjxykq8KxAGFiYomIM5pK3JowSJHnVeFu3DPCHJvmmT
 ONKmMiDIQga2Lmk8PCsVw==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:IPgGJ+a1NZo=:zCCDuaHPZDpBebj3QFISWLOL
 5mxEVAdGFKJ16sSyejPMC6yHIQHisLBmhDeCS8CKKpaPVxN+vQq/n9TfEdRjj4d31cYDm4u4H
 eFZJrfLzVPxQcr47okond/XXM1+moQANhChYrcz1JjTpR+a8ryvZCOWf0aH1wMEldP9iTTh6G
 4+WhlKNI/XRzqEJ5IMoW/ZyBIyorR+iF/BTo+b9HyA9+3ppodboWP6pS6/3IIKjwUVgVKLhk8
 VPIza0UWkYMb2StKDTFQN4aJ2GfftkEmDb8Hk/WYwZyQuGhGZRhZDEyWWb3fls0m9IRw1lU4I
 DlcWliEGSWH/MsGoqUPLsbpw6MMryFhAHQqw1+hpYx4TpXZRWh5tL5CNUVshsiBstWxwqHIBy
 ZutqwkSreYxvJ6b4BuKH2/BjTUB5eR+/wJaHwnFLKpxjEiuXbp3BLPKK1yoi3TZkIl3rJJLuh
 VUP6uomn7fdCNxBr2LOxA9kBI+KmQQsTNgrWZdeE4rfPaSjybyyInTWzoZYdROu49Mdz4sZkh
 YDn14n2lA7j1iEG9wBqhgn3zOJlFtseC3cDqSvFL+nkcm3lsHcYNPjN7G2UGgqZaefs7m+8ID
 05g1lqvRNFhVwTmr6Eb8GrI17fQEy+NPI8rVXv+JwP0Uk2h0BdX1UoDONORSCLLU8ttEAJfIe
 wKONda/TLjEDESxQMiB+C0Q1N/JE+EStIVH5JOOslZeUF1m2wY4bL5JLe8vGac7KE//nA96Wh
 yF5S19sgDtoXYhFaoB0AKMgyUHsFI66ZM+Ms4vUOxLWM1HiLZf6Fs3+EkXiI3gtNjXw2YnVjI
 lVJMqrwJTLslpe/qesV8y/ZcOk/KWWuPfQ97uNeMx7vz9yvS1VT0L/cFqgftsaot4oZetUQD6
 +Jxte1oTYKPwebNrBoEObSoYmkc0Iz2fbjJ5tS3PusMi+O/BF7UGLtaIu9q5Qh8Iz6nbZDa3C
 VNnBim17+30QB3OebVhATyJqPW3Yimg7+xdWNSUVSwNwO0dk0LJJC5KfNyCWnYorp6y6tQFdY
 ekNUJBpFkRniCgzF/DJ6V9cf3ZR7e6emz0WVqM8hD/pNb980EWcm1RI4cuZXmzxpApTR8vDEM
 o3wGLgE2qunF41W6DnJrG4kE745zlCjj3DWlQ8IkZyDgwHEmLShvYcOnviX7lO9C2rj/3qzbk
 OCDOtPc7aZgCQXeynYbuQgHBsq2xlEX1STVnSddBgncYKA==



On 10/1/22 10:39, Greg KH wrote:
> On Sat, Oct 01, 2022 at 10:30:22AM +0000, Artem S. Tashkinov wrote:
>> Here are two other issues which absolutely suck in terms of dealing wit=
h
>> the kernel.
>>
>> - 1 -
>>
>> I have a 20+ years experience in IT and some kernel issues are just
>> baffling in terms of trying to understand what to do about them.
>>
>> Here's an example: https://bugzilla.kernel.org/show_bug.cgi?id=3D216274
>>
>> What should I do about that? Who's responsible for this? Who should I C=
C?
>
> Input subsystem.

It's great you've replied immediately, what about hundreds or even
thousands of other bug reports where people have no clue who has to be
CC'ed?

>
>> Here's what I'm getting with Linux 5.19.12:
>>
>> platform wdat_wdt: failed to claim resource 5: [mem
>> 0x00000000-0xffffffff7fffffff]
>
> $ find . | grep wdat_wdt
> ./drivers/watchdog/wdat_wdt.c
> $ ./scripts/get_maintainer.pl --file ./drivers/watchdog/wdat_wdt.c
> Wim Van Sebroeck <wim@linux-watchdog.org> (maintainer:WATCHDOG DEVICE DR=
IVERS)
> Guenter Roeck <linux@roeck-us.net> (maintainer:WATCHDOG DEVICE DRIVERS)
> linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS)
> linux-kernel@vger.kernel.org (open list)
>
>> ACPI: watchdog: Device creation failed: -16
>> ACPI BIOS Error (bug): Could not resolve symbol
>> [\_SB.PCI0.XHC.RHUB.TPLD], AE_NOT_FOUND (20220331/psargs-330)
>> ACPI Error: Aborting method \_SB.UBTC.CR01._PLD due to previous error
>> (AE_NOT_FOUND) (20220331/psparse-529)
>
> Send to ACPI list as described in the MAINTAINERS file.

The more important question is whether I should even bother anyone in
the first place.

And it's not just ACPI, what about "platform wdat_wdt: failed to claim
resource 5", "platform MSFT0101:00: failed to claim resource 1",
"lis3lv02d: unknown sensor type 0x0"?

I know you can probably identify the related components in a few
seconds, but I'm quite sure you won't be doing that for every bug report.

Should this be addressed?

Best regards,
Artem
