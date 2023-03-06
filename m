Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440AB20F0
	for <regressions@lists.linux.dev>; Mon,  6 Mar 2023 04:14:35 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id cp12so4904078pfb.5
        for <regressions@lists.linux.dev>; Sun, 05 Mar 2023 20:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678076075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iRYT+UlvIz1HnVfkh0dnicFIjsrPsayy6Avx5zWeKzI=;
        b=QdoGJZq+RivIHmp9obanI376MxUh/BRwV6dqJ41M3UD3wDXQuOn9mwsjwOuXdw80cw
         AmqHPOqxW4JLBUhMxNJpyRZj7pGf4BfvInaH6iB31a0Lx7PVjtKXxZd621I/7aYJZHWR
         kEG4ipJ56ENRqZWgutIAW89IVgQ0lsFrNCIHXAq1iBnkg3zsD+LyKqoCIiVqisoVDIDk
         zp0BJ+uS9B28yjt8/wq7SniwKOfkrI+9M/NITeze66R8BSAoNR+eFIBB4FxG/avDyB6p
         Nws4IN4Vjkl7hjFX5xYkTUddIl9NPOOzRSXGloyOVQfqgfoTfhqxJ/6/welCLQsFTsDd
         BJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678076075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRYT+UlvIz1HnVfkh0dnicFIjsrPsayy6Avx5zWeKzI=;
        b=HKdKTmxztmVIRTvDm7b6QfKTEVrFiyfWJ0eq8seb/njazFCsukSMpyemE8lTcV0pqZ
         OD9B+gcMCYO+dlg0zQjhJu/p00NeLEIYoZJp3l1fSEPk9GJ/0bbacorAW1NOHw1rCodb
         oXP4ZG6kzSETU7H74gEfq4bCXbO9cAU6RCVWkYSCNzMdj61HkpTJ7a49kqhqZylEoSkd
         xGValZjONzlqgW9U6MjLzcYx7nyTcbQcNbP3cK9uCpMayrozfUc0rnvJ7ArWoCpY6kLN
         Wgj9nazz3ODpRfAAJ0+A1h3OUvSn0f2jyZfV1EIlta1ixvApEVCMTj9/C7nxBB6Crb6x
         TE3w==
X-Gm-Message-State: AO0yUKV5Vk2Lo0H2PYx/scSlZyzBCVZGm7ze6+dxRxCAN4UkwYDWf/BY
	8XSGylvscN4CWbVOUIHbuVQ=
X-Google-Smtp-Source: AK7set/3lZJwqF+6Lrq0ycq/JtlwLW3C4HPIyJabqgnLE66iTx7L7RzvEN4t2CCKeYamCpoD/SAkOQ==
X-Received: by 2002:a62:64d0:0:b0:593:d276:1931 with SMTP id y199-20020a6264d0000000b00593d2761931mr8657094pfb.14.1678076074612;
        Sun, 05 Mar 2023 20:14:34 -0800 (PST)
Received: from debian.me (subs03-180-214-233-84.three.co.id. [180.214.233.84])
        by smtp.gmail.com with ESMTPSA id a15-20020aa7864f000000b005a8b28c644esm5237892pfo.4.2023.03.05.20.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 20:14:34 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 10079106595; Mon,  6 Mar 2023 11:14:30 +0700 (WIB)
Date: Mon, 6 Mar 2023 11:14:30 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v3] docs: describe how to quickly build a trimmed kernel
Message-ID: <ZAVopho26SPotT6v@debian.me>
References: <1a788a8e7ba8a2063df08668f565efa832016032.1678021408.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l2C+jfgZOE0mRcHu"
Content-Disposition: inline
In-Reply-To: <1a788a8e7ba8a2063df08668f565efa832016032.1678021408.git.linux@leemhuis.info>


--l2C+jfgZOE0mRcHu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 05, 2023 at 02:04:44PM +0100, Thorsten Leemhuis wrote:
> +.. _patching_sbs:
> +
> + * In case you want to apply a kernel patch, do so now. Often a command =
like
> +   this will do the trick::
> +
> +     patch -p1 < ../proposed-fix.patch
> +
> +   If the ``-p1`` is actually needed, depends on how the patch was creat=
ed; in
> +   case it does not apply thus try without it.
> +
> +   If you cloned the sources with git and anything goes sideways, run ``=
git
> +   reset --hard`` to undo any changes to the sources.

Alternatively, if you have ``b4`` installed, you can prepare the patch
with ``b4 am -l <message-id of the patch>``. The -l option adds a Link:
to lore.kernel.org for the patch. Apply the resulting patch with
``git am``.

It is often wise to branch-off from mainline before applying patches, to
keep the remote-tracking mainline pristine. Create a branch with ``git
checkout -b <branch name>``.

> +Changes merged into the mainline repository are only synced to the maste=
r branch
> +of the Linux stable repository  every few hours. This lag most of the ti=
me is
> +not something to worry about; but in case you really need the latest cod=
e, just
> +add the mainline repo as additional remote and checkout the code from th=
ere::
> +
> +    git remote add mainline \
> +      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> +    git fetch mainline
> +    git checkout --detach mainline/master

You will most likely change the tracking remote for your master branch
to mainline by ``git branch --set-upstream-to=3Dmainline/master``.

> +The step-by-step guide uses the default make targets (e.g. 'bzImage' and
> +'modules' on x86) to build the image and the modules of your kernel, whi=
ch later
> +steps of the guide then install. You instead can also directly build eve=
rything
> +and directly package it up by using one of the following targets:
> +
> + * ``make -j $(nproc --all) bindeb-pkg`` to generate a deb package
> +
> + * ``make -j $(nproc --all) binrpm-pkg`` to generate a rpm package
> +
> + * ``make -j $(nproc --all) tarbz2-pkg`` to generate a bz2 compressed ta=
rball

I used to try compiling kernel in rpm-based systems (at that time
CentOS). make binrpm-pkg generates kernel headers, image, and sanitized
kernel headers for libc packages. These three packages have to be
installed together. However, the generated libc headers package most
likely overwrite distro-installed one, thus rebuilding the world is
necessary. I mind of that significant overhead, so I proceed to manually
install the kernel.

Thanks. =20

--=20
An old man doll... just what I always wanted! - Clara

--l2C+jfgZOE0mRcHu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZAVooAAKCRD2uYlJVVFO
owDAAP4w333MHzbYf5dITc8aDBgVSvDZi9N/s0IA9sir9ao6lwD+Lc7wATVyrMHT
ya5cxV872i+eq03GeJar1RRXgv3zbww=
=EGyc
-----END PGP SIGNATURE-----

--l2C+jfgZOE0mRcHu--
