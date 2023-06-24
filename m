Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6EC378
	for <regressions@lists.linux.dev>; Sat, 24 Jun 2023 01:34:45 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6687446eaccso1044885b3a.3
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 18:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687570485; x=1690162485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NweAbjy52dJmvgrS5Se3FN0lnSLavmsB+nKxFGPGvW0=;
        b=VSGfQTWVWsbp9D+RhlgroWtsItjwsd+PAsju+hPuWGHSmM2/N6JW/0cyml04B5fnDA
         S6Oja8X71oM1CVdjhclXpm3mU3WwX/vzDHeHPqLfz5PFyuGHNzknB3hAjH89MEMfszI0
         D7qh7o4mervwSD6aRKthAHFjjCLVmOG90BqJ9r4jfR91KjFoFLHUN4FPNi4/od9UnaAP
         Fu5sq0g8N68zOOIGbpCp+pGjSvzyN7kt9GY5h52bNLOGoaAOZk2lbrB25Lzve2A9CmcD
         lTosl3lLEdYxYlsRATwecnEOk19Eeu5zot2eFK45XTNHzPSdVRyu1GAszlfdQ2LQMVbM
         O8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687570485; x=1690162485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NweAbjy52dJmvgrS5Se3FN0lnSLavmsB+nKxFGPGvW0=;
        b=PIMIF0d9NxAm3ANhwqKBrWF4NvWs1MA5B00dTVAmovdWvgediBvErs5jzrncVotZp2
         U/rHNuiNcQy/ouT01Ln6Ier2zOCzwK/kkCEv6gT9w+cgIffvtYoHsxDXaFDyB0lX+8z7
         hR+hmhl4EpLG8zAMUk6LcFzTPknl78lFM1xCN1xObY78uG0iCH7EpLHj1h2uFj8fWEPl
         ESBebJhLtgMipLSW2Kd9Je5uUM6DuiakvPyfQcGA3WCjtDsC+rQNsnyWMJbEgDRyUuEo
         axnsDAgN88WvQfVek5V7oErCBIOK3VMQD3+acNW7IFvl01ABNBP8HNA3xyxyylLKbTcy
         /9Rw==
X-Gm-Message-State: AC+VfDyg3/XYXwvh4zDtI6gf/8TBpc1iH5+V05bqQdmaoD/3qUaWIKTv
	ICk3Yv+lMjxE/vFpmC/x0Sg=
X-Google-Smtp-Source: ACHHUZ4EaqFt6nWD83dMOJjUmyNBRz7LaE9yDDNtm67kqPMvxGc6jCP04lmsfP6QNI8sfJL/8U7eVw==
X-Received: by 2002:a05:6a20:2588:b0:11d:2764:d9c1 with SMTP id k8-20020a056a20258800b0011d2764d9c1mr27851326pzd.51.1687570485339;
        Fri, 23 Jun 2023 18:34:45 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id 24-20020a631258000000b0054fe07d2f3dsm240316pgs.11.2023.06.23.18.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 18:34:44 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 467208BFA791; Sat, 24 Jun 2023 08:25:40 +0700 (WIB)
Date: Sat, 24 Jun 2023 08:25:39 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Elmar Stellnberger <estellnb@elstel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Memory Management <linux-mm@kvack.org>,
	Linux Stable <stable@vger.kernel.org>
Subject: Re: Fwd: kernel fault on hibernation: get_zeroed_page/swsusp_write
Message-ID: <ZJZGE4ZxJzrhRznA@debian.me>
References: <5d4959b7-61da-8ab0-6bc6-21305d37c7aa@gmail.com>
 <ZJXFgfldS6W_LCiI@mail.dotplex.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r2ki5HdcOTzEK4x7"
Content-Disposition: inline
In-Reply-To: <ZJXFgfldS6W_LCiI@mail.dotplex.com>


--r2ki5HdcOTzEK4x7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2023 at 06:17:05PM +0200, Elmar Stellnberger wrote:
> Hi all, Hi Bagas S.
>=20
> As the issue didn't reproduce the way I would have liked (did not
> reproduce at all here, not even with the same kernel version; no
> further comment) I have now uploaded the /proc/kcore and the kernel
> binaries and symbol files I still had on disk at
> https://upload.elstel.info (This may move to something like
> upload.elstel.info/bugs/kernpagealloc in the future)
>=20

First, tl;dr:

> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>=20
> A: No.
> Q: Should I include quotations after my reply?
>=20
> http://daringfireball.net/2007/07/on_top

Can you attach [1] to your Bugzilla report? Also, any report on bisection?

Also, you don't need to upload full kernel images instead; people can
grab /proc/config.gz you uploaded on Bugzilla and then `make olddefconfig`
=66rom it.

Anyway, telling regzbot:

#regzbot link: https://upload.elstel.info/kcore.xz

Thanks.

[1]: https://upload.elstel.info/kcore.xz

--=20
An old man doll... just what I always wanted! - Clara

--r2ki5HdcOTzEK4x7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZJZGCwAKCRD2uYlJVVFO
o8DMAQC6zR1yWAa7UjG6IkGQnqbipk2vCuN918vTrru6uzJIMQEA3roDgr7VTrHm
nimvRUDgB4IcrFpNlJFzdVpaRrSpDws=
=DDa0
-----END PGP SIGNATURE-----

--r2ki5HdcOTzEK4x7--
