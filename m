Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165BD101E4
	for <regressions@lists.linux.dev>; Thu, 25 May 2023 14:04:52 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ae85b71141so13922445ad.0
        for <regressions@lists.linux.dev>; Thu, 25 May 2023 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685023491; x=1687615491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5OTtpvBZsd1mzIar/P+7WCe42Wjpq9sEz4353rghUnk=;
        b=og/EY73MWp6vFDXAgLGjJXne44Xe6KFU24j/h8OLEkZLZCSbUOdt8EH80nqlW0xV7j
         hlYoGllMwTl94Cf3flS2MresG0DFpfkvSNkQPBMEd+JSA9i7kAm6awYrjsR3qh6sD0Py
         XGMNDdWP3A+NE1nb7PGHts1FyTGheVSIvNdk/RqqTJ8dr84fRlAxEHHGvHS4bpwFIXJI
         pkVkNaUBPUSh0AyBF8GyBDOSqRvXwg4i7jpX5Y2fcCxLz/1NN9QpOnRhboivUCW9y4T0
         7H6X/v08qFmcVE0sa4pkd/QOFuMNgP26MOp+clFonTTKjv5y3E5C51w/GbdWtmgDlRwi
         lkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685023491; x=1687615491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OTtpvBZsd1mzIar/P+7WCe42Wjpq9sEz4353rghUnk=;
        b=kguvO0TcJjy2tGYpC8CAxXZrMXMi5JMiojHgrlFfTkz+9t6Ew4SDVMmyoo+GqHVK0P
         JsfQ2Dz1mu+mfmoGFd8JYl4eQiQUA4dn7NFG0nUIXKIbo/5Sq1fuoRkan34+b9A8f1rv
         0v4Ic12drm8zTo5QEC1p6I7lYKyUmcLIDVuwIuAtpv1EiyB3BaQZcT3Xtr1xpsvA576I
         hPkzRdM0ldbwR1mWBkV6fPvWLZwciDn5ICWipgxg+aWMtK5f8Drh+beEABPfJzPCUfsP
         +4Kd2OHzFPsD0WRCJZ+CBKUQGjnrXTd7Ga10wjS+3sp1gdDzwhthaImoaIAm/dJkdxsW
         0jdA==
X-Gm-Message-State: AC+VfDyAQ4dqWRUAsYxuQo9weoXCIm1LvTtZRXhgKZhWVOPoUiK2sChv
	13ks2UWA4yfHwXMQHtL7dII=
X-Google-Smtp-Source: ACHHUZ5ph8WUg3toWhCGyBDAVOLPd9jm+Mr4SBQCkwQjrwZcjsUKsQv6aQKJWln09yU5hmCxQ4Q5WQ==
X-Received: by 2002:a17:902:bc8a:b0:1ad:1c29:80ef with SMTP id bb10-20020a170902bc8a00b001ad1c2980efmr1575077plb.18.1685023491295;
        Thu, 25 May 2023 07:04:51 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-28.three.co.id. [180.214.233.28])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e80400b001a682a195basm1475018plg.28.2023.05.25.07.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 07:04:50 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id F066D1068F8; Thu, 25 May 2023 21:04:45 +0700 (WIB)
Date: Thu, 25 May 2023 21:04:45 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Framebuffer <linux-fbdev@vger.kernel.org>,
	DRI Development List <dri-devel@lists.freedesktop.org>,
	Linux Nouveau/NVIDIA <nouveau@lists.freedesktop.org>,
	Linux Stable <stable@vger.kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
	Antonino Daplas <adaplas@gmail.com>,
	Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>, Felix Miata <mrmazda@earthlink.net>
Subject: Re: Fwd: absent both plymouth, and video= on linu lines, vtty[1-6]
 framebuffers produce vast raster right and bottom borders on the larger
 resolution of two displays
Message-ID: <ZG9q_bb1rDj79mgv@debian.me>
References: <e8f93560-a2f6-8e9f-031a-88d333482a31@gmail.com>
 <585f36f8-431a-e929-0a04-ffb65f02e9df@gmail.com>
 <b34c7037-7f4b-e4bb-dac8-48bbbade327c@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tX6NsCAgxtfTaPFl"
Content-Disposition: inline
In-Reply-To: <b34c7037-7f4b-e4bb-dac8-48bbbade327c@gmail.com>


--tX6NsCAgxtfTaPFl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 06:37:05PM +0700, Bagas Sanjaya wrote:
> Oops, again, I messed up the regzbot entry (reporter field still assigned
> to me). Inconclusiving...
>=20
> #regzbot inconclusive: Wrong reporter assigned (from: doesn't take effect)
>=20
> Please ignore this thread as I will send a new one with proper regzbot
> commands.

No need to resend this report as Thorsten noted that DRM subsystem already
have gitlab tracker [1].

Sorry for inconvenience.

[1]: https://lore.kernel.org/regressions/d4879ff1-b9ac-0373-ceb2-beaa645fba=
23@leemhuis.info/

--=20
An old man doll... just what I always wanted! - Clara

--tX6NsCAgxtfTaPFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZG9q+QAKCRD2uYlJVVFO
o2BVAQDxdf+VgNKjUWWNEhoNwmXh+P+87BVSt4rVppMOM1QEUQD/ZeG6yqM0deuL
YNpG/cKVM4KHln3Qnh18gmVJbXFlIgg=
=O6hc
-----END PGP SIGNATURE-----

--tX6NsCAgxtfTaPFl--
