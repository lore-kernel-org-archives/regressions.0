Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEB7AD5D
	for <regressions@lists.linux.dev>; Tue,  7 Nov 2023 07:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3RzfM8M"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6b5af4662b7so4358748b3a.3
        for <regressions@lists.linux.dev>; Mon, 06 Nov 2023 23:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699340567; x=1699945367; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MhImXZki+e3l9q5cMOcKEg5tKeJtLJw2KQuBsfan6o8=;
        b=G3RzfM8M8029DRI9xTTNwKdRkr7JpV1fwZ8UsMtbTIwiLUU/W5hlc/A7QXchvZI6LA
         rTPZOZeNPyVzPMQZ3yfcWFc/wEyUknr+R/bFBYL/TsltpzDplkw2U6qg4AeFcwmtZc92
         rvP5fgp5SEdg9yIQzGfrFUWbbvStkhrbG5I+bOswf2T3Ih10t3Jee8RIUj2mUOiDoXCd
         4JlwZLt+v8aCx5ScCi5hq/iN4zWGyWQtFE4BS6Y92GLuKtD8v0q5TQHfYRuQ9bv+kvMk
         ssG0IyvZBp+dQSc4hBzWENLALgsmcP0wkVltjBS84bbI1t7gM0caoX50QTTenTDYqdLi
         37VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699340567; x=1699945367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhImXZki+e3l9q5cMOcKEg5tKeJtLJw2KQuBsfan6o8=;
        b=t8x93d+bd+Gxd6XDPDwey/5LnKTbI+LK0AItyiwZc+zHjnMXLdKqAue7NT7+cWiNTA
         WKxBas1WN1ZxXVNn/mIAgw2TT5qKBvHrQp/5K4syowsEMKd1jPrSC94gcwu+pYT0kV64
         ncZJe0TboUli2rmeoePJaUA8CkbpmCBJJKMiLogHufZQI3mVJw5wKsrA+Axh/Iuy90w5
         RYQ9k+uCnBZwqBmbQfDaRiMOEDadxbnqS4FWodNjPyFAz206FV4Z9KQObNt1U3datbAN
         dmTBge/46g9gEO3/aHVgoyySTZ0qco7ojSeqc//XvBeaFP3DJdJYK/Yd9pIZVd+M15ys
         vbMg==
X-Gm-Message-State: AOJu0Yxqhcoor1wB47UyxyqfHEWZQXueaTt2pmQ1Uy+VbTqqR0/79MzH
	/taSr+zvtg5VcubmRwIifVM=
X-Google-Smtp-Source: AGHT+IHo9Z3Zf5L0UZcK0SWcgVGHEc2d9mBm3oQcU4t2hdwJYLrV5Eg0O2JJfBr6d1ES1w53hyvasQ==
X-Received: by 2002:a05:6a00:814:b0:6b2:2a2d:7a26 with SMTP id m20-20020a056a00081400b006b22a2d7a26mr32198550pfk.28.1699340567209;
        Mon, 06 Nov 2023 23:02:47 -0800 (PST)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id v15-20020aa7850f000000b006c34f198b87sm6559385pfn.203.2023.11.06.23.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 23:02:46 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id A8750812C340; Tue,  7 Nov 2023 14:02:42 +0700 (WIB)
Date: Tue, 7 Nov 2023 14:02:42 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	o-takashi@sakamocchi.jp
Cc: Mark Broadworth <a.mark.broadworth@gmail.com>,
	matthias.schrumpf@freenet.de, LKML <linux-kernel@vger.kernel.org>,
	aros@gmx.com,
	Linux FireWire <linux1394-devel@lists.sourceforge.net>
Subject: Re: Regression from dcadfd7f7c74ef9ee415e072a19bdf6c085159eb
Message-ID: <ZUnhEjtUihOFQ9t1@debian.me>
References: <f878b188-3fe4-420c-9bcb-b431ac6088dd@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3q6Fnqfq+qDr1d0"
Content-Disposition: inline
In-Reply-To: <f878b188-3fe4-420c-9bcb-b431ac6088dd@amd.com>


--w3q6Fnqfq+qDr1d0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2023 at 02:14:39PM -0600, Mario Limonciello wrote:
> Hi,
>=20
> I recently came across a kernel bugzilla that bisected a boot problem [1]
> introduced in kernel 6.5 to this change.
>=20
> commit dcadfd7f7c74ef9ee415e072a19bdf6c085159eb (HEAD -> dcadfd7f7c7)
> Author: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Date:   Tue May 30 08:12:40 2023 +0900
>=20
>     firewire: core: use union for callback of transaction completion
>=20
> Removing the firewire card from the system fixes it for both reporters
> (CC'ed)
>=20
> As the author of this issue can you please take a look at it?
>=20

Thanks for the forwarding regression report from Bugzilla. I'm adding it
to regzbot:

#regzbot introduced: dcadfd7f7c74ef https://bugzilla.kernel.org/show_bug.cg=
i?id=3D217993
#regzbot title: completing firewire transaction callback with union bootloo=
ps AMD Ryzen 7 system
#regzbot link: https://lore.kernel.org/regressions/f878b188-3fe4-420c-9bcb-=
b431ac6088dd@amd.com/

--=20
An old man doll... just what I always wanted! - Clara

--w3q6Fnqfq+qDr1d0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUnhDQAKCRD2uYlJVVFO
o7DUAP0RP7rzxGwMmKVmB1kMWNKdIa8/UWwlBYAbo73vLrBZCAEAiVscNSgGX9ua
+Vbu034qiRymtcE7krqgrX9QZ5HheA0=
=0pXV
-----END PGP SIGNATURE-----

--w3q6Fnqfq+qDr1d0--
