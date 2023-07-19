Received: from mail.lichtvoll.de (luna.lichtvoll.de [194.150.191.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095DA3D8B
	for <regressions@lists.linux.dev>; Wed, 19 Jul 2023 06:55:27 +0000 (UTC)
Received: from 127.0.0.1 (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mail.lichtvoll.de (Postfix) with ESMTPSA id 98A70747972;
	Wed, 19 Jul 2023 08:55:24 +0200 (CEST)
Authentication-Results: mail.lichtvoll.de;
	auth=pass smtp.auth=martin smtp.mailfrom=martin@lichtvoll.de
From: Martin Steigerwald <martin@lichtvoll.de>
To: Tim Cuthbertson <ratcheer@gmail.com>, linux-btrfs@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Scrub of my nvme SSD has slowed by about 2/3
Date: Wed, 19 Jul 2023 08:55:24 +0200
Message-ID: <2585111.Lt9SDvczpP@lichtvoll.de>
In-Reply-To: <3526703.iIbC2pHGDl@lichtvoll.de>
References:
 <CAAKzf7=yS9vnf5zNid1CyvN19wyAgPz5o9sJP0vBqN6LReqXVg@mail.gmail.com>
 <1d611dbb-8aee-9a6e-701c-6498f1b51c34@leemhuis.info>
 <3526703.iIbC2pHGDl@lichtvoll.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Martin Steigerwald - 19.07.23, 08:42:58 CEST:
> Hi Thorsten.
>=20
> #regzbot monitor:
> https://lore.kernel.org/linux-btrfs/cover.1689744163.git.wqu@suse.com
> /
>=20
> I hope that does it.
>=20
> Above links to a patch of Qu about asking for other ideas to fix the
> regression. It however has been superseded by a later patch of him.

=46WIW time-wise it was the other way around. The other patch was slightly=
=20
earlier, but it not fully recover the original speed of scrubbing of=20
NVME devices in 6.3=B9. Thus Qu was asking for additional ideas.

[1] https://lore.kernel.org/linux-btrfs/4f48e79c-93f7-b473-648d-4c995070c8a=
c@gmx.com/T/#t

Best,
=2D-=20
Martin


