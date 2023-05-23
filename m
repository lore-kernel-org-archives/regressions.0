Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D19BA4C
	for <regressions@lists.linux.dev>; Tue, 23 May 2023 21:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 53B533F4FA;
	Tue, 23 May 2023 23:25:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.91
X-Spam-Level:
X-Spam-Status: No, score=-1.91 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWoa5MYq7N-Q; Tue, 23 May 2023 23:25:42 +0200 (CEST)
Received: 
	by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 61CCF3F414;
	Tue, 23 May 2023 23:25:41 +0200 (CEST)
Received: from [192.168.0.126] (port=60034)
	by tnonline.net with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <forza@tnonline.net>)
	id 1q1ZVk-000GEM-Nn; Tue, 23 May 2023 23:25:40 +0200
Date: Tue, 23 May 2023 23:25:38 +0200 (GMT+02:00)
From: Forza <forza@tnonline.net>
To: Uladzislau Rezki <urezki@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux btrfs <linux-btrfs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Stable <stable@vger.kernel.org>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	a1bert@atlas.cz, urezki@gmail.com
Message-ID: <26007e3.faed4a1b.1884a80d9e8@tnonline.net>
In-Reply-To: <ZGyVVQxnw6Tn7Xb8@pc636>
References: <efa04d56-cd7f-6620-bca7-1df89f49bf4b@gmail.com> <fcf1d04.faed4a1a.18844d8e78f@tnonline.net> <ZGwcVTpQNBoJHBB+@debian.me> <ZGyVVQxnw6Tn7Xb8@pc636>
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



---- From: Uladzislau Rezki <urezki@gmail.com> -- Sent: 2023-05-23 - 12:28 =
----

> On Tue, May 23, 2023 at 08:52:21AM +0700, Bagas Sanjaya wrote:
>> On Mon, May 22, 2023 at 09:04:05PM +0200, Forza wrote:
>> > I have a similar experience with kernel 6.3 where vmalloc fails in a s=
imilar way. I was able to reproduce it in a QEMU VM as well as on my system=
.=20
>> >=20
>> > https://lore.kernel.org/all/d11418b6-38e5-eb78-1537-c39245dc0b78@tnonl=
ine.net/T/
>>=20
>> Thanks for your similar report. Telling regzbot about it:
>>=20
>> #regzbot link: https://lore.kernel.org/all/d11418b6-38e5-eb78-1537-c3924=
5dc0b78@tnonline.net/
>>=20
> It is good that you can reproduce it. Could you please test below patch?

Yes, applied it to my test VM and will let it run over night to see how it =
turns out. I'll post again tomorrow.=20

Thanks.=20
>=20
> <snip>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 31ff782d368b..7a06452f7807 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2957,14 +2957,18 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
>                         page =3D alloc_pages(alloc_gfp, order);
>                 else
>                         page =3D alloc_pages_node(nid, alloc_gfp, order);
> +
>                 if (unlikely(!page)) {
> -                       if (!nofail)
> -                               break;
> +                       if (nofail)
> +                               alloc_gfp |=3D __GFP_NOFAIL;
>=20
> -                       /* fall back to the zero order allocations */
> -                       alloc_gfp |=3D __GFP_NOFAIL;
> -                       order =3D 0;
> -                       continue;
> +                       /* Fall back to the zero order allocations. */
> +                       if (order || nofail) {
> +                               order =3D 0;
> +                               continue;
> +                       }
> +
> +                       break;
>                 }
>=20
>                 /*
> <snip>
>=20
> Thanks!
>=20
> --
> Uladzislau Rezki


