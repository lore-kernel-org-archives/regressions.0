Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4AF7F3
	for <regressions@lists.linux.dev>; Tue,  4 Apr 2023 08:16:10 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id dw14so20873059pfb.6
        for <regressions@lists.linux.dev>; Tue, 04 Apr 2023 01:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680596170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JS2FebHY5XwGhoN8TK3eRaOmFfR0S3vZkA1YVoRMUIs=;
        b=lmQlXPLcQk6v+53GmQWwPGiWFGaxgNywsTVDf6emWF3qMsGLzWEkolbpW9Wab/+Hng
         ccDnoRU2CF0+FUZYKm83Zx2yEpqaXvwbZ4Clbna+TkGtx+HYHVRSW9VgVbpUJ44Il3pC
         XPzn2hwAk18MrT79n+0FBTOUaMqTqgTqq7Je4wE8/GIw2zsSkEirfbcZzI4jyiVhFt9W
         40B7+jPgS34L2Yo6zaLeLBP9f918xVTSNj8JJt9udTXHGg6HovC3fdUrEEJ7UAsbnI13
         FN/nUeN8Cm/35c6RXqjpY3DJ6aw+osJNV6HpSvvcsrhPc0w3oGEhApmgaCMfQlQsG1lk
         NyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680596170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JS2FebHY5XwGhoN8TK3eRaOmFfR0S3vZkA1YVoRMUIs=;
        b=YEV68Owd2sNubybtH6Y5Jsh8K7o39C5zPaxeWYLYurwSopceTmkTOQvD1IpGB7uI+c
         TJdsRhRdL9tttW+9ogfIXpuBzOlXplLQRm9Fe184BjMXz1SzB1FfEJfRg63XYJY0VfOg
         eKqYh+MuvKJ+rYVYakJyKmUHIZjpyNpsla3iGCjh9cQJJUaH41bcKNtKWPABwesBtT2y
         kVEw9LODRCF37Bk5KmUovwkfXXjaUiS4zhS8Q+z0mXVSPzOcBLxuxqEiQu4DyFIOMfDc
         6Z26Rv4YXvYhXmq2HOi7nQ9r1b0QHdTR/O0an/VBHwO7U0AKTl27qH4puGYBU3MPTEB+
         CYVA==
X-Gm-Message-State: AAQBX9eJszCGYB092aSpSuLIovlxxQBzgVBHbYShANwM2b1TTvcd8RBd
	ljbrkVjlC2NLOmalg3zUswbZy8J2eu49qw==
X-Google-Smtp-Source: AKy350Z4lly1T9IcXIhHUYSMRnTU3AptmLhEk+dLJn8of07Eqd+zRBjpehfcp30hgdrCUe2+X/xYCA==
X-Received: by 2002:a62:6203:0:b0:62a:9d6f:98dc with SMTP id w3-20020a626203000000b0062a9d6f98dcmr1296816pfb.11.1680596169931;
        Tue, 04 Apr 2023 01:16:09 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-10.three.co.id. [180.214.232.10])
        by smtp.gmail.com with ESMTPSA id e14-20020a62aa0e000000b00622e01989cbsm1028070pff.176.2023.04.04.01.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 01:16:09 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 181A41067AD; Tue,  4 Apr 2023 15:16:05 +0700 (WIB)
Date: Tue, 4 Apr 2023 15:16:05 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	workflows@vger.kernel.org, aros@gmx.com,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	tools@linux.kernel.org
Subject: Re: Introducing bugbot
Message-ID: <ZCvcxVJBl/6pRMAw@debian.me>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XVlanjBueVby0D6k"
Content-Disposition: inline
In-Reply-To: <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>


--XVlanjBueVby0D6k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 07:58:40AM +0200, Thorsten Leemhuis wrote:
> How does one make bugbot forward a bug to everyone in the signed-off-by
> chain of a commit that caused a regression, which might or might not
> have a bugzilla account?  When the reporter performed a bisection these
> are the primary contacts that need to be reached out to, but the
> maintainers and lists for the subsystem obviously should be CCed.

The logic should be similar as on finding commit signers in
get_maintainer.pl.

--=20
An old man doll... just what I always wanted! - Clara

--XVlanjBueVby0D6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZCvcwAAKCRD2uYlJVVFO
o2uhAQCMyE+Ey5rq+16PrdKhShHXPwd8HI5Q80T81YsEud+RHgEAtU2tL23X0loi
hZWkyQ2/YpWj5RbjIBL9u5mAgL1EkAs=
=kk/f
-----END PGP SIGNATURE-----

--XVlanjBueVby0D6k--
