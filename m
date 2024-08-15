Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3B646434
	for <regressions@lists.linux.dev>; Thu, 15 Aug 2024 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723763853; cv=none; b=ibuqFWcAh56/t1GJJY6wT85ygqlV2KlDmKi+5Sa4fRaM7a2U/RezgZXXiD5s72SV0mtnhWYya0SD9t01BeB/b4rQpJzpKbcFyzW41IfagBVYG3VMvRYjYKdZoZAcMhh8OnZMBicA/W6NO/TIN9MDruGluh/JEDVbiZKmn4YKRCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723763853; c=relaxed/simple;
	bh=ivkvcRmNd/mrdnVRXNhcw+By4UWRoQeYHE4hO6Lx0fc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YH7G/+/LoNEclIlNaWX+vkPmsOYaEVmSmEiPLe0GCbidHTX9C8kEswRYI/geN9qhMxf4GaH3SI512awYA+YdfyafDvwqE/kHh/kTZ3t2A8RZ4mwhZiUW2FFMBkU19QvF2+435yh2x2su7BrjpXk0uYeuHM8rnWsuZHd4hkFyU6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name; spf=pass smtp.mailfrom=intelfx.name; dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b=RF3nDhda; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intelfx.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b="RF3nDhda"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4280c55e488so7344975e9.0
        for <regressions@lists.linux.dev>; Thu, 15 Aug 2024 16:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google; t=1723763850; x=1724368650; darn=lists.linux.dev;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ivkvcRmNd/mrdnVRXNhcw+By4UWRoQeYHE4hO6Lx0fc=;
        b=RF3nDhdav9XeKs2HhyJte3csohK0txxpTHPV/QtfJctIfLckOcVey6B++jwIv/nVRE
         YFY5NpkAU64oGq4cMeD5WvJkUAh0jIQYxY9McfaXpKtQlHKhVc/dQlSCkq1IO+aW0+5t
         gmSiaVInYXJog30WFYEygW1Hfw8jCNYMVIikc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723763850; x=1724368650;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivkvcRmNd/mrdnVRXNhcw+By4UWRoQeYHE4hO6Lx0fc=;
        b=CwsFFDY7b2IkQ0e4EQIW1869whu3XWaCIvQzA6P3J59GLLEzXuf2QiMsz0EEkbaAnq
         5e6Jhdvddfsj2qAH/ChjkuRg7TzLPk5bkbiplqoz+17poCEGzKirmNiZq0duQj0fDYhD
         opsqSNppEdgeJ141n/vpJt2sHlYmcflK2pzHj600RQrJy7su/uKONDCEowydAttjrmNo
         5ujvr5ln6xAHau/bbVJVgiHkGiXoZdEEG9EFJMfkK+inFo3JrNQ8YrCLbcTb/lBeZNLk
         eivasIZyNDQaB36ESDHb4+8nTphgKcJxyuK8WmYtHw/f8QPLP+hUM1vnapl/12WVSPlj
         3cAg==
X-Forwarded-Encrypted: i=1; AJvYcCUTQSX+VcGrlP4omRDu+J4RZAYxNRYq3PCGVS+q+KJzyEhv9HSbPp0OONCoy23mTkkqvMGjAsPRof+nIfQAaDJOBpw3D0vhpq/nAlY=
X-Gm-Message-State: AOJu0YxJVxT2EpFs038XCmJZ1KiS5pz3PgDGMzU7srJ7QAvlFylFSt+/
	W8xbgxsPsvaNP76j+i8mFcm1QhcTqVjZEFv6cHlQ5nKEltnUivbytG4pFykgPPI=
X-Google-Smtp-Source: AGHT+IF45XZ50Dc6FvJw2iUbgluWK/lEsrdFw8abHp/UTECZ21MeTe+5oXiRaA3Y8cRHemjhSa1xMg==
X-Received: by 2002:a05:600c:450c:b0:424:8743:86b4 with SMTP id 5b1f17b1804b1-429e232b8a0mr32518245e9.6.1723763849630;
        Thu, 15 Aug 2024 16:17:29 -0700 (PDT)
Received: from able.exile.i.intelfx.name ([109.172.181.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded36f55sm60169175e9.26.2024.08.15.16.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 16:17:28 -0700 (PDT)
Message-ID: <95f2c790f1746b6a3623ceb651864778d26467af.camel@intelfx.name>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted
 increased execution time of the kswapd0 process and symptoms as if there is
 not enough memory
From: intelfx@intelfx.name
To: Filipe Manana <fdmanana@kernel.org>, Jannik =?ISO-8859-1?Q?Gl=FCckert?=
	 <jannik.glueckert@gmail.com>
Cc: andrea.gelmini@gmail.com, dsterba@suse.com, josef@toxicpanda.com, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mikhail.v.gavrilov@gmail.com, regressions@lists.linux.dev
Date: Fri, 16 Aug 2024 01:17:25 +0200
In-Reply-To: <3df4acd616a07ef4d2dc6bad668701504b412ffc.camel@intelfx.name>
References: 
	<CAL3q7H5zfQNS1qy=jAAZa-7w088Q1K-R7+asj-f++6=N8skWzg@mail.gmail.com>
	 <277314c9-c4aa-4966-9fbe-c5c42feed7ef@gmail.com>
	 <CAL3q7H4iYRsjG9BvRYh_aB6UN-QFuTCqJdiq6hV_Xh7+U7qJ5A@mail.gmail.com>
	 <3df4acd616a07ef4d2dc6bad668701504b412ffc.camel@intelfx.name>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-/UW35KO1Zk3+yHX84VkT"
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-/UW35KO1Zk3+yHX84VkT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2024-08-16 at 00:21 +0200, intelfx@intelfx.name wrote:
> On 2024-08-11 at 16:33 +0100, Filipe Manana wrote:
> > <...>
> > This came to my attention a couple days ago in a bugzilla report here:
> >=20
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D219121
> >=20
> > There's also 2 other recent threads in the mailing about it.
> >=20
> > There's a fix there in the bugzilla, and I've just sent it to the maili=
ng list.
> > In case you want to try it:
> >=20
> > https://lore.kernel.org/linux-btrfs/d85d72b968a1f7b8538c581eeb8f5baa973=
dfc95.1723377230.git.fdmanana@suse.com/
> >=20
> > Thanks.
>=20
> Hello,
>=20
> I confirm that excessive "system" CPU usage by kswapd and btrfs-cleaner
> kernel threads is still happening on the latest 6.10 stable with all
> quoted patches applied, making the system close to unusable (not to
> mention excessive power usage which crosses the line well *into*
> "unusable" for low-power systems such as laptops).
>=20
> With just 5 minutes of uptime on a freshly booted 6.10.5 system, the
> cumulative CPU time of kswapd is already at 2 minutes.

As a follow-up, after 1 hour of uptime of this system the total CPU
time of kswapd0 is exactly 30 minutes. So whatever is the theoretical
OOM issue that the extent map shrinker is trying to solve, the solution
in its current form is clearly unacceptable.

Can we please have it reverted on the basis of this severe regression,
until a better solution is found?

Thanks,
--=20
Ivan Shapovalov / intelfx /


--=-/UW35KO1Zk3+yHX84VkT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJJBAABCgAzFiEE5N8nvImcx2nJlFGce94XyOTjDp0FAma+jIYVHGludGVsZnhA
aW50ZWxmeC5uYW1lAAoJEHveF8jk4w6dTn4P/1/xgXVh3B1jS4KCk3eKQoFAvfw3
h2QG0oSaXeLOrG/0YlhPBx5Rvhfjcqvq1FZ0jA3MDMsPl5ATxqLuR33H9cMdTYF3
Cup0Q+b5S3LbEzj6wzFlPyK1LUA0I5fJWSdcp/AjYU4mAdUHF/3zrW1Ck7wDambV
Y3tgSokU2DxO2s7dq6udOJJLnhE/D6X0kRCoCr1t/jkwg+4dMg0onvxdCzKit5ao
sz3SEUf/kIQdQfJKO88tsZGn/qUOy81FLyYWoK6CuFxxjuz6uhVvyVIqQrEpWNAo
/1uR/G5Rbi7xJzERCIVoRPABMKoTrTTbhx2pK7Qx5OFVSntl85P5aNUIZ7JSJQeg
OEhnqgy1Qf5znpkAhAmaX29XyVEOFcAfGQ+M5693rqXWVltlWruucMe9Mnds6XWG
ensKZ9mwtytgT67nXoGE0NnqEJnSkVJR4w+2hCANt03LKuUkna4YIw25b6z1E8Hd
mcddCIpN1Ss6df/MxikM9YPuEPg4WwjxP51+wS8dc28GT9WHlzGwVQdj7sXU+yBa
uRg3wBFv176R1eArrmRvjqGCb65HfBsaTL8ifjtDv6FaezWMRklEU1OeLQZXwu/p
fa3wcgKT5v0c6ojrKyC5lvhyEpJ8zbwG4yvFrmABVOYfNN1+tEKh3HLgGtW1wrpH
ApsVf3l7UJ/Imieb
=GyTv
-----END PGP SIGNATURE-----

--=-/UW35KO1Zk3+yHX84VkT--
