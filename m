Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2BB2581
	for <regressions@lists.linux.dev>; Mon, 12 Jun 2023 06:20:54 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-655d1fc8ad8so3244689b3a.1
        for <regressions@lists.linux.dev>; Sun, 11 Jun 2023 23:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686550854; x=1689142854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/JK3TU7YFRj/e68GIZTEHv4xrVfCyD4VBzaHU6EBRGQ=;
        b=aUa5nt3Z+69SyeNiK7yPDV0XLk7GzaJ1aQBLWuPOPiCkiHgSpgXDzPNOHeCh9WQ35P
         UnmhQvm7XbQ+BnkZ5dGabdJ294JCp/che7tA/nTi8LYdcg43Bdh3PIrYmU4HnfXeXVmP
         SEECUNPfPr/ykHDt06HStvFyW7V8em8Nd+0UvtAc/3TSZ0THzXUbVKVRUlsNZODhtFsE
         B+mIXMupQqcdg03n2AyO+emkN8tutn0xSdS3C/CSARL1xYniDF+n5IBpIS1NwRwtI0Gr
         Y2rwTzpuptPqwTV1S708H0LQUZLjrFtQ/XfO3w+BGpYDq67lLliKdvPxfd8Vinv/hEt9
         CQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686550854; x=1689142854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JK3TU7YFRj/e68GIZTEHv4xrVfCyD4VBzaHU6EBRGQ=;
        b=koWznRY5pHoaxU9qBNQzei8U2CPOPlwR2icJfsGkgCmn0mxt4eliw0FfD5DNf2Bqut
         EYzyxO65fdQ1VXzUD6qom27yEGXoMJs5byYOv1WcaIMG02/P9305Ps3if0oBjMNAo5aX
         gXYK6lFB6pNJ5nmcslhmFWoY6LTWgTFOB+EOzs0hru85lPoWwyQ7cfu/exg7w/TOkOjW
         mAtzwVLe/xIaL/StD4TBG6DQ1lUPv4LiUhD1bBEto31GC+rt20s4spCMIXHSFtse0qaj
         nc7JZ8JzSNo4j7bSOVMrXwz5NE55Zoxj6h6Ss6KPdGV+nxfsIcfrjGitpVQ47rX4LiMn
         lVgA==
X-Gm-Message-State: AC+VfDyNEMGyyaTGv1tXJRelyKSqhKkWcmsEpGSFcd0GRCXOyAwgGsu9
	gGuDhuBDVmWTaS15uN3/yAk=
X-Google-Smtp-Source: ACHHUZ47hq6fy+3dOE/9k3HLlR5J6NXUjY5+c8Xdb8hoek4U+8usGCZMz9GYBPy/DFFGlsARY+FkSA==
X-Received: by 2002:a05:6a21:6da3:b0:10a:be5c:6e2d with SMTP id wl35-20020a056a216da300b0010abe5c6e2dmr9208618pzb.39.1686550854098;
        Sun, 11 Jun 2023 23:20:54 -0700 (PDT)
Received: from debian.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id c14-20020aa7880e000000b0063d46ec5777sm6162834pfo.158.2023.06.11.23.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 23:20:53 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 4DE28106C10; Mon, 12 Jun 2023 13:20:48 +0700 (WIB)
Date: Mon, 12 Jun 2023 13:20:47 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sean Greenslade <sean@seangreenslade.com>, linux-ext4@vger.kernel.org,
	Ye Bin <yebin10@huawei.com>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: RO mount of ext4 filesystem causes writes
Message-ID: <ZIa5P1HqE62rmzqu@debian.me>
References: <ZIauBR7YiV3rVAHL@glitch>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oXjBG6aBq0cIy8y4"
Content-Disposition: inline
In-Reply-To: <ZIauBR7YiV3rVAHL@glitch>


--oXjBG6aBq0cIy8y4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2023 at 10:32:53PM -0700, Sean Greenslade wrote:
> Hello, folks.
>=20
> I noticed a change in behavior of ext4 in recent kernels. I make use of
> several luks loopback images formatted as ext4 that I mount read-only
> most of the time. I use rsync to synchronize the backing images between
> machines. In the past, mouning the images as read-only would not touch
> the backing image contents at all, but recently this changed. Every
> mount, even ones that are RO from the start, will cause some small
> writes to the backing image and thus force rsync to scan the whole file.
>=20
> I confirmed that the issue is still present on v6.4.rc6, so I performed
> a bisect and landed on the following commit:
>=20
> > eee00237fa5ec8f704f7323b54e48cc34e2d9168 is the first bad commit
> > commit eee00237fa5ec8f704f7323b54e48cc34e2d9168
> > Author: Ye Bin <yebin10@huawei.com>
> > Date:   Tue Mar 7 14:17:02 2023 +0800
> >=20
> >     ext4: commit super block if fs record error when journal record wit=
hout error
>=20
> That certainly looks like a likely cause of my issue, but I'm not
> familiar enough with the ext4 code to diagnose any further. Please let
> me know if you need any additional information, or if you would like me
> to test anything.
>=20

Can you show dmesg when regression happens?

Ye: It looks like this regression is caused by your commit. Would you like
to take a look on it?

Anyway, thanks for the bug report. I'm adding it to regzbot:

#regzbot ^introduced: eee00237fa5ec8
#regzbot title: commit super block writes even in read-only filesystems

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--oXjBG6aBq0cIy8y4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZIa5OAAKCRD2uYlJVVFO
ow0cAQC7IbRS13IAEmBezzjzEsFelZvVP5CenQsOEP8upCcnJgD9F7Q7Prz3KHjS
cfIlPECSx7tGH7s1tiQymT3LZ/C78w0=
=/u+c
-----END PGP SIGNATURE-----

--oXjBG6aBq0cIy8y4--
