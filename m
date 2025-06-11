Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54FB157A67
	for <regressions@lists.linux.dev>; Wed, 11 Jun 2025 17:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749661858; cv=none; b=uuc7a17ENBsNJu6AH/Qqgbcqij3+2wMBLdte32ZdPgVi8f481DXfikJsRnEfd3hgI4tzDAZ6n4RR3Gae2qFvuK/ZPZDF5lkYdz7XqpuONPKgF4WmlJVke7TEjSPoyxSwnoMpPfb7mYFKJ7OMKP8bp9DXwU5xbQagk4idhBebRR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749661858; c=relaxed/simple;
	bh=wfGTFbVzrnm/eFJldsr80LKPWcoUnp2SqjZ2kKDQPrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rALv+OdC7wmqvYoHDA2OXfUdb/mjk7XYKWkMvN0zvE6v/zZ+3ugmjedu/XHIJztdQgtVpgy75ZNPdW7e2dX5r8iu6OgjrKwoU8iTgyK9gUatiEKFdmP/InhzTE5z+xnG5zX/QpYOFhMAZa8kmQ4ctp1ELd0M2A3NtRSCnAq2ysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=1GyyAiZu; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="1GyyAiZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1749661826; x=1750266626; i=christian@heusel.eu;
	bh=OEGHZmIjk+ceUvrd8ghMlpfcoXbIaBBA/lq77JDDIEY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=1GyyAiZuFbY8ihp0K7RyPkKlWZnNxe4Yve6cghuq1J19s4aITNLNJePoofhP6d6V
	 +eriskdAfjNiB69PIiiHiVP3kH2NQ02VtcY0j8KHdSEqBvoKPWlwXju+KAEgTOXX4
	 UiMmNboO0v4jRnr4ZJIhlPCzPHbWpYdvS0tS32XQEY1DKTVPaMy27UvAy/BFfWb5F
	 pWaOTFsLnXkz86JM73gPrmCWk36a9BuGL5Ch4hG13YQZzaQh/TaIrAe5JLWDxYqs/
	 9lvf6Ek01dq9R5fwpiI+8CQMx6OA2WzTJVg6UuU0ptTmoJjupk+uif5bNTNIesrKB
	 DFhuAwjbxYji/f5DKQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([89.244.90.56]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M890H-1uU3w91Y2N-00C4J0; Wed, 11 Jun 2025 19:10:26 +0200
Date: Wed, 11 Jun 2025 19:10:24 +0200
From: Christian Heusel <christian@heusel.eu>
To: Kuniyuki Iwashima <kuni1840@gmail.com>
Cc: davem@davemloft.net, difrost.kernel@gmail.com, dnaim@cachyos.org, 
	edumazet@google.com, horms@kernel.org, kuba@kernel.org, kuniyu@amazon.com, 
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com, netdev@vger.kernel.org, 
	pabeni@redhat.com, regressions@lists.linux.dev
Subject: Re: [REGRESSION] af_unix: Introduce SO_PASSRIGHTS - break OpenGL
Message-ID: <b5628073-3d14-42a9-9b91-3ec31db8f7f9@heusel.eu>
References: <58be003a-c956-494b-be04-09a5d2c411b9@heusel.eu>
 <20250611164339.2828069-1-kuni1840@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pvxh2zg2om6kjmmk"
Content-Disposition: inline
In-Reply-To: <20250611164339.2828069-1-kuni1840@gmail.com>
X-Provags-ID: V03:K1:aPP1kRugb8Gbyx5XYk0iGW9/YSGeRy4gHEeQocsJrZRUzb8N94G
 oyX59AnGy5Wq2qsKTEwEVjAlDWR91DGT0xIzcvbhOri8Fo9K6orhXeK6LBtGZdp+gBjaqww
 sJWFmqs2zRk0j25GnRA+RNVxNrUGtk2xjeEJKBEScUNUkgQa3SYgk02+F2yE26rZzjoXTfx
 tVT122yEqPzOywbLyBrIQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:waETIkTmEQ0=;RANLL2hysgIQ1irtNkBCoAzhZ3N
 HaXhpdNXN/1PPNW+nLTrjKPs+zx6j0oDaDvYf4OqmEw94CUPl7trm2X8DHCtTYfca8i0qCrKp
 owvVmwvh2N3397U2XL4quF0gNNk5QC/MMHxU/kGveowE3KZwBEdj6jQGJEscfWUXmXS/pemCw
 y+Hb4jY42inA0ZvHZKMBvyZGY9tbW1iJT7Vm7LkZWGfICkLxyh1aThm/airtOWAJLbT3mbLGP
 exxk9BQCHDUu0nAP9i9auVZMu3/FYfjjUISjlPCnn5VA+l2iXFSblyDYmW0gQG33fjRw3+LTi
 EpUQOoc8/fM1G6rwxBIdht14WNsVHGu+9fwmDTLZ/ukSuMJgFp08aorEQbeES1qrpYy9x0cYF
 SWcMqJGEyaRdLyplKtoU9KtNO7mjrqLIFD+0O8V1q7Fkja6+zipJXwbZjP+d9cg6PGt9FGTsj
 KF7uCuPms+oR9BaptG7T5oXdm+YlqEB3kzTDD2JcSCtSoDEu1lXTNipWOSp9gDde1Hp7aYdsn
 NhtJS8cysUdVUAl+dyrxjigTbNngzCas6XSCb6dbvzW/XvujGTgkHdMUoV6Nb1sU79SjDHR22
 f13Shg9+slwr/18VRCFDge8iuku66BEoUGQC3Fuk/0aj8DWEe8RpWaQkZj/+vS+cYPENIv8Fj
 TgVsg4YJJXlDF4pBALCEilMzY/yKVpwEHR0TzO94UbxYewdAVdgmYkoGsUT/S/gz0pRY1EK8Z
 XyKQVvmhPfu/PRQxoiYxg+uh5KerMTj50EyNhEsBnOvrOeDkDR6Ty59VsbZvD0RbDNZox1NTx
 DPxPLfVFYxYLLmn2uxM8G1VWJIlOgR2MPg++j1/bzL43UwkDI7Kce3uYTn6XkKpTIeJqLfBwa
 /B3gbytAZ2V1Vdwyfuun+RLe65xsg5IIQvgxDuNksnKY3SFOKKi/aMNooJW2x4HFqn3yOd9mS
 YU6rb9UKt8YXaZ7nD0jaUwSw2nWvHFwV2QcVfB3IXMf43VHKU6/g1tBa3pLznwaesXid45UcB
 XOOiVHaY69Fd3zeVW7rDw6jHaNuXi2hrprukbPMIK6GA2tPBrCXrQtuTG3idEcX2nv/eUE3s7
 oblV4HdR3iLvZx65ho6OjHPea+vTpkcqyf82/l/RDXCPqNXtR9RLBazDqSDpv7MW4EScdgphW
 EoKQfcsb+gD62BJqmBTwVVuNMEqyT8m1P59hHbarczjuZAYCuPzyYe5cQbTQb4KaPo7NokApU
 tbLEJazq3OWYVg30gNkVXCYQR/QmmFfxlqTDHKT20r8JG0mO5WG+SxfsDK+gihfKA3yy4NkN7
 /2HQ3wxgkJNY0DDyOFim4kOox0O/1uUoDRG4J47bRJDTM5b7EoLRIaRgwChB03PubD+p+/r3l
 JZmEwSFG8Ga/6wHngkAHySx05Km0jNiMEbYQjs2vHb8LyxFyJfa6mkxKdt


--pvxh2zg2om6kjmmk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] af_unix: Introduce SO_PASSRIGHTS - break OpenGL
MIME-Version: 1.0

On 25/06/11 09:42AM, Kuniyuki Iwashima wrote:
> From: Christian Heusel <christian@heusel.eu>
> Date: Wed, 11 Jun 2025 13:46:01 +0200
> > On 25/06/10 09:22PM, Jacek =C5=81uczak wrote:
> > > Hi,
> >=20
> > Hey,
> >=20
> > > Bisection points to:
> > > [3f84d577b79d2fce8221244f2509734940609ca6] af_unix: Inherit sk_flags
> > > at connect().
> >=20
> > I'm also suffering from an issue that I have bisected to the same commi=
t,
> > although in a totally different environment and with other reproduction
> > steps: For me the Xorg server crashes as soon as I re-plug my laptops
> > power chord and afterwards I can only switch to a TTY to debug. No
> > errors are logged in the dmesg.
> >=20
> > I can also confirm that reverting the patch on top of 6.16-rc1 fixes the
> > issue for me (thanks for coming up with the revert to Naim from the
> > CachyOS team!).
> >=20
> > My xorg version is 21.1.16-1 on Arch Linux and I have attached the
> > revert, my xorg log from the crash and bisection log to this mail!
> >=20
> > I'll also CC a few of the netdev people that might have further insights
> > for this issue!
> >=20
> > > Reverting entire SO_PASSRIGHTS fixes the issue.
>=20
> Thanks for the report.
>=20
> Could you test the diff below ?

It seems like the patch you posted has fixed the issue for me, thanks
for the lightning-fast answer!

> look like some programs start listen()ing before setting
> SO_PASSCRED or SO_PASSPIDFD and there's a small race window.
>=20
> ---8<---
> diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> index fd6b5e17f6c4..87439d7f965d 100644
> --- a/net/unix/af_unix.c
> +++ b/net/unix/af_unix.c
> @@ -1971,7 +1971,8 @@ static void unix_maybe_add_creds(struct sk_buff *sk=
b, const struct sock *sk,
>  	if (UNIXCB(skb).pid)
>  		return;
> =20
> -	if (unix_may_passcred(sk) || unix_may_passcred(other)) {
> +	if (unix_may_passcred(sk) || unix_may_passcred(other) ||
> +	    !other->sk_socket) {
>  		UNIXCB(skb).pid =3D get_pid(task_tgid(current));
>  		current_uid_gid(&UNIXCB(skb).uid, &UNIXCB(skb).gid);
>  	}
> ---8<---

Have a great week everyone!
Chris

--pvxh2zg2om6kjmmk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmhJuIAACgkQwEfU8yi1
JYV8IQ/4q05ypgWVUCyUkdHVeTY4QNiayhgnfex9hX2ya3Qx2J4LoKoFGM2JYwF9
v3xvC4HTqWC/fMIgwncD8wph10wpE1Mme1aHLP2iUK2J0eukv2nn5tNSgHFUtjiE
V+b1yFbV1GNgp9AtNVfQun0oW0TVqu+GE2IE0PaaKJryIOhl0HEWrck5HpyYOnaO
Oqs7B2fD8tQ43qngXLwQZEqGY1RKplndGJ9FvJtGrgwCYFlha638uj4tQm2yh7im
4mHvWy0HQBe5VOvWoPwk37giAHZfx0NMpFqNzXAtsI4v6SLr38MRTjp9wctgfFvM
OqFjuZkCVEjV7Qr3ZDMzJWgo4lMMgYmJ9SWvW0BfXWGN4Ym5Bw4KWoYyNCfW3s+r
ZHZnoH2cDP8we2FHZhHa8w8dTy+VAerVE1QCoiwBOZrTAVcY5g3SIf+XAAYCbGRb
BflcnGE9B5fZTYh7SgrjVInL6uOOn/5ouj23ZvukJlepaCKv5EvvZYeQ5NRgY9lp
4YDEmuglyaRXUZGzYd+JUbRdcoxLV8xwPYYWYX//YRP8YCisYGADxMu/FtGaM0TS
GpnW4SW1J++j9nAiAgLJW+R4XrLZkTxh1vfbSvLAb4OQDLynF/wzp8kR20GXc4V0
uUusdclFornCeHctDA0p8NIA5qlItdJfiC30NPxyhlIyLOai8w==
=RB66
-----END PGP SIGNATURE-----

--pvxh2zg2om6kjmmk--
