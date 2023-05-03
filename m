Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B59D7E4
	for <regressions@lists.linux.dev>; Wed,  3 May 2023 04:31:17 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-63b64a32fd2so5253846b3a.2
        for <regressions@lists.linux.dev>; Tue, 02 May 2023 21:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683088276; x=1685680276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j36FxbwcTfFp+Gw+OcG7+yTUIaRmnbVgGu4hODtTOa0=;
        b=citAXFKdtFhDlYnMr+GPqWXwjQYIvHLtz/niHkqQih/1UNzeLl3TEUTEeb+3Z21JXJ
         WP0PogRcYNrjxnnih1jSjvxB4iRIrPEv4IV5vmDfIa7cvtGzed2C2bNeFrGR/N/lLmmx
         CndsSzUQd8zF6VqgbCnal2ZGPgIa4wjfHC8uCssmN+6As/oZ1InjHs6GiZ4b2vnSWqqE
         Cn4RSAXzV+1yVvnc1ljIrnfow/J3GuthUY0JN59EfER1TNmyJDIjByOYy2dhdLAujOOd
         UDGMSbS792NCH53/sf23pAg6Ifkh9bnmFdtNR20TrEvH6In0WHiZ30tnAWu7XfZD0tfd
         +Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683088277; x=1685680277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j36FxbwcTfFp+Gw+OcG7+yTUIaRmnbVgGu4hODtTOa0=;
        b=UqG1uBFIe972+Nhr6sJjtwwXLi7NhgXMCkzkpu72GG5AP49fd6hJMymQkXGkRta3zD
         NI75oYj2yimsy7T2AweeAbnlUeCxFH9hJ0RdF01IlE4l16Kx0xDD+9Eeic/9Ouf1FP/t
         wRav3V8qMhjL6xf5Yj9HWT4hLPJPu9jFJMQMbZhlicyUi8YGcvdrBYxyhl9JDRlze8Eh
         4FgGh3rzjkubejFd6u15YMs7CMUA5+Oad/9cugKUSplBswfgXOO5RgTmdJUYPwi8ufjZ
         8XNFaNAEbp1Xkt13oJZcJDv5SHbu+cQj1IeWJXElU+IgmmrrrE00ZH2N5hpNE/ibA9Ep
         tMRQ==
X-Gm-Message-State: AC+VfDy+kCPIs5p3/7/cTezSmgbtQk2yUAv74whG2B7iwlhq69ljJghy
	hsLCwOirbXZMeIUe7AtposQ=
X-Google-Smtp-Source: ACHHUZ7fgYIek3AW/jmP9fqZIwYfJQKDV4HBGtHSbzm88HjynunVyvK7sLCzkGyJubW9ytiB59fATw==
X-Received: by 2002:a05:6a00:a26:b0:641:3c61:db27 with SMTP id p38-20020a056a000a2600b006413c61db27mr21516460pfh.13.1683088276567;
        Tue, 02 May 2023 21:31:16 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-39.three.co.id. [116.206.28.39])
        by smtp.gmail.com with ESMTPSA id n7-20020a056a00212700b0063b6fb4522esm22460215pfj.20.2023.05.02.21.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 21:31:16 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 61B83106248; Wed,  3 May 2023 11:31:13 +0700 (WIB)
Date: Wed, 3 May 2023 11:31:13 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Acid Bong <acidbong@tilde.cafe>, regressions@lists.linux.dev
Cc: stable@vger.kernel.org, linux-acpi@vger.kernel.org,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [REGRESSION] Asus X541UAK hangs on suspend and poweroff (v6.1.6
 onward)
Message-ID: <ZFHjkb75lgzKRhRr@debian.me>
References: <CRVU11I7JJWF.367PSO4YAQQEI@bong>
 <5f445dab-a152-bcaa-4462-1665998c3e2e@gmail.com>
 <ZE+1pKbfy1l/tTo6@debian.me>
 <CSB8TSV6LXJ8.7SHI9VM2YMAR@bong>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qzZ1tcaqoAMep0dQ"
Content-Disposition: inline
In-Reply-To: <CSB8TSV6LXJ8.7SHI9VM2YMAR@bong>


--qzZ1tcaqoAMep0dQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 12:02:26AM +0300, Acid Bong wrote:
> Hi there, and thank you for the reminder.
>=20
> Bisecting, unfortunately, takes a long time: I'm only trying out the 7th
> commit, 15e7433e1dc2 (previous 6 marked as bad). The bug, as noted in
> the head, doesn't have any (strict) patterns and takes randomly long
> times: some kernels hung on the next day after compilation, one took 5
> days. I'm not excluding a possibility that I might've got the versions
> wrong and the bug occured on the update from 6.1-pf1 to 6.1-pf2 (6.1 and
> 6.1.3; could be unrelated, but I saw a bunch of commits related to i915
> and Skylake).

OK, try keep updating on bisection process.

> What exactly do you mean by "swapping the hardware"? I'm already sure
> it's not related to my storage, because a month ago I replaced my faulty
> HDD with an SSD, but the bug still remained. Unfortunately, I don't have
> spare PCs or resources to purchase new hardware.

In case of laptops, I mean buying out new laptop (maybe with similar
hardware specs as your current one) and try reproducing the regression
there.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--qzZ1tcaqoAMep0dQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZFHjkAAKCRD2uYlJVVFO
o0hGAP0bEioOcTuwLyb+gkUo3DPx3R9ztyRQPLu3u8KxtSe9LQEAoy7Rm/yGzwrQ
uibC0VjplPdI/WpcMp7epkioqm6SnQY=
=Tnp8
-----END PGP SIGNATURE-----

--qzZ1tcaqoAMep0dQ--
