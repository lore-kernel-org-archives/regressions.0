Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9420B362
	for <regressions@lists.linux.dev>; Wed, 12 Apr 2023 04:17:27 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id h24-20020a17090a9c1800b002404be7920aso10370327pjp.5
        for <regressions@lists.linux.dev>; Tue, 11 Apr 2023 21:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681273047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hq/mTM6vqO5fl2BFqwBvgyto2iWy4lzSUp2jXy0gRvg=;
        b=RlIwUSvX9oZQhTPSDp7e+uIzThMoEzwTnlmdzri1CU8jQEHwALdI51Ah9ME0rf11m8
         7FBcjhBbnQsB2nj7UQ252Cm2VovvzUnIWs5NgJC82dc2QEKzbvedLwHoBiYjteANduV+
         TncT6mBXRyL5H+gKtP2KFuRPMhbBxhVCoTAIt1QQX+T/AZW7Ds2+D659FZ2HTIDDXhBP
         XmFiCFMCMG6N9AaAfEkio6U97Kc4LEWSW170wVV1FfqW8wgH8c3AMGdwWUnWqbandO+L
         1IBoF+a+I0TrGwnCV20sM9chdMgodtRD9VNBAP/BH2ATfU6bnm4QwzC4ZO/WdJq3TNXb
         CGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681273047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hq/mTM6vqO5fl2BFqwBvgyto2iWy4lzSUp2jXy0gRvg=;
        b=35/w8G6oyJk9Vc91Q4zeoN9z10MwwYxSlTD1YD2g+qrvPR1f0dijdPHhbBDjySa1co
         d1RKVOY/euRdjKp7UmrCRLSbm9IrcRQzIso5YEbS5YizhtYGPQOqs3XrAHj+qyFb6QQF
         W8xRY6cH9IBTka9K8Sn7xx59duwAgMMDiE8OgPW4B2QE8tAmrqHDswBZYDkgYLKl9bQA
         PzxXZSC8rJCLmmJeYW3H/4Jgx0NDzBphnBseiCBYLKVZkhGbiLLnhAmg45zyHaC19Ldk
         YAcDJj0pevUXkCLMFONZWalIOw1Rwl+vkEgqj+bc0V0013FHbFo3R8Xn5a2trIjfr+a6
         zjvg==
X-Gm-Message-State: AAQBX9e+QvjhsGqq4ztNigbVuQwcOoMoNJ+ztNjrqGCD6KEvXHqoBDGe
	Ph5YStw6iT8R0rOrMte4yV0=
X-Google-Smtp-Source: AKy350a1z06v0KqJPjvsjepiCUuBZua9rRdG2dJCxmd9vvnWAItbO2F6KpdEGZApvgHF1OZx5jWKFg==
X-Received: by 2002:a05:6a20:b705:b0:d9:a792:8e52 with SMTP id fg5-20020a056a20b70500b000d9a7928e52mr3986430pzb.57.1681273046927;
        Tue, 11 Apr 2023 21:17:26 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-66.three.co.id. [180.214.233.66])
        by smtp.gmail.com with ESMTPSA id x24-20020a62fb18000000b0062de9ef6915sm10571496pfm.216.2023.04.11.21.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 21:17:26 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id C07181068E7; Wed, 12 Apr 2023 11:17:22 +0700 (WIB)
Date: Wed, 12 Apr 2023 11:17:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	Jani Nikula <jani.nikula@linux.intel.com>
Cc: Intel GFX Mailing List <intel-gfx@lists.freedesktop.org>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
	Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
	Manasi Navare <manasi.d.navare@intel.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux regression tracking <regressions@leemhuis.info>
Subject: Re: Linux 6.2.1 hits a display driver bug (list_del corruption,
 ffff88811b4af298->next is NULL)
Message-ID: <ZDYw0vVg7Y1oExJL@debian.me>
References: <6feae796-db3f-1135-a607-cfefb0259788@gnuweeb.org>
 <ZAGqet3U8AMm4Uf1@debian.me>
 <ZAOTU5CRwdEC1lGH@biznet-home.integral.gnuweeb.org>
 <87v8jetaik.fsf@intel.com>
 <ZAXT1B1GTlmA78Ld@biznet-home.integral.gnuweeb.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="riLMWEg/4LOAeueD"
Content-Disposition: inline
In-Reply-To: <ZAXT1B1GTlmA78Ld@biznet-home.integral.gnuweeb.org>


--riLMWEg/4LOAeueD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 06:51:48PM +0700, Ammar Faizi wrote:
> On Mon, Mar 06, 2023 at 12:54:59PM +0200, Jani Nikula wrote:
> > Please file a bug at fdo gitlab:
> >=20
> > https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-bugs
>=20
> OK, I posted it here https://gitlab.freedesktop.org/drm/intel/-/issues/82=
74
>=20

Hi,

=46rom gitlab issue above, I don't see any progress on bisection attempt.
Ammar, have you successfully boot Ubuntu 20.04 with v5.10 kernel and
test there?

Anyway, I'm adding this to regzbot (with tentative commit range):

#regzbot introduced: v5.10..v5.15.103
#regzbot title: Linux 6.2.1 hits a display driver bug (list_del corruption,=
 ffff88811b4af298->next is NULL)
#regzbot link: https://gitlab.freedesktop.org/drm/intel/-/issues/8274

(Also Cc: Thorsten)

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--riLMWEg/4LOAeueD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZDYwzAAKCRD2uYlJVVFO
o5/sAQCOZEp244paV37hHVVszEf/eKSIXWtgAAMsix36DcZ4pQEAkRjyNdxRZdYv
qEYxt6Z1lmleaN5i4eQGxbGF4VyCHw8=
=6JIi
-----END PGP SIGNATURE-----

--riLMWEg/4LOAeueD--
