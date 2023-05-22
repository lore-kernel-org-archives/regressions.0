Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se [213.80.101.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA94168B6
	for <regressions@lists.linux.dev>; Mon, 22 May 2023 19:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 2A9173F7EB;
	Mon, 22 May 2023 21:04:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.91
X-Spam-Level:
X-Spam-Status: No, score=-1.91 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JiL1dCS8CrPZ; Mon, 22 May 2023 21:04:08 +0200 (CEST)
Received: 
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 62B483F6F0;
	Mon, 22 May 2023 21:04:07 +0200 (CEST)
Received: from [192.168.0.127] (port=37066)
	by tnonline.net with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <forza@tnonline.net>)
	id 1q1ApC-0007Lc-S2; Mon, 22 May 2023 21:04:06 +0200
Date: Mon, 22 May 2023 21:04:05 +0200 (GMT+02:00)
From: Forza <forza@tnonline.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux btrfs <linux-btrfs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Stable <stable@vger.kernel.org>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>, a1bert@atlas.cz
Message-ID: <fcf1d04.faed4a1a.18844d8e78f@tnonline.net>
In-Reply-To: <efa04d56-cd7f-6620-bca7-1df89f49bf4b@gmail.com>
References: <efa04d56-cd7f-6620-bca7-1df89f49bf4b@gmail.com>
Subject: Re: Fwd: vmalloc error: btrfs-delalloc btrfs_work_helper [btrfs] in
 kernel 6.3.x
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Mailer: R2Mail2



---- From: Bagas Sanjaya <bagasdotme@gmail.com> -- Sent: 2023-05-22 - 15:25=
 ----

> Hi,
>=20
> I notice a regression report on Bugzilla [1]. Quoting from it:
>=20
>> after updating from 6.2.x to 6.3.x, vmalloc error messages started to ap=
pear in the dmesg
>>=20
>>=20
>>=20
>> # free=20
>>                total        used        free      shared  buff/cache   a=
vailable
>> Mem:        16183724     1473068      205664       33472    14504992    =
14335700
>> Swap:       16777212      703596    16073616
>>=20
>>=20
>> (zswap enabled)
>=20
> See bugzilla for the full thread and attached dmesg.
>=20
> On the report, the reporter can't perform the required bisection,
> unfortunately.
>=20
> Anyway, I'm adding it to regzbot:
>=20
> #regzbot introduced: v6.2..v6.3 https://bugzilla.kernel.org/show_bug.cgi?=
id=3D217466
> #regzbot title: btrfs_work_helper dealloc error in v6.3.x
>=20
> Thanks.
>=20
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217466
>=20

I have a similar experience with kernel 6.3 where vmalloc fails in a simila=
r way. I was able to reproduce it in a QEMU VM as well as on my system.=20

https://lore.kernel.org/all/d11418b6-38e5-eb78-1537-c39245dc0b78@tnonline.n=
et/T/



