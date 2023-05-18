Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE7B23C7D
	for <regressions@lists.linux.dev>; Thu, 18 May 2023 13:12:08 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-64cfb8d33a5so1024108b3a.2
        for <regressions@lists.linux.dev>; Thu, 18 May 2023 06:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684415528; x=1687007528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hGN2Xn1/y4nxz6sqvPsCN0vbEykHl0P+bF4ElA00DBs=;
        b=X9kB1RU8NBGfYG40MfB604JqrcQdmVSVkWBpnHu4TuhqnEsk96TZ3ri7trsBxqHuas
         pxEPdABtEctmjOmDEczsOynfWSkwswLsWhhi+HK8MJHvwZ18U67AzKg5zOmZsuAscJ7H
         Ami77IW9/BI1gbdicZ3KuRKsFW+MFATedONala6OI/M2shsoKD+TPFyC+GjyHCLtr50H
         POgPfe+ikUd3ZcKy/W3yezzb2OayBpKJpMXJyK5U70RoIrgHqbxgNUZTedEAk4uoazMv
         1IlgAE4SCDEm+XFnbfgNAPmQiYuLv+bIrWlW9NxkHLLcP5akqwmKGOOp+6l5zVygSDms
         53ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684415528; x=1687007528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGN2Xn1/y4nxz6sqvPsCN0vbEykHl0P+bF4ElA00DBs=;
        b=DcDXFRujBWZSDxm/HmXaN+MOBVitxL4ai206w9Ax2G6uFYLShcBDPv9nd0gmL99gtn
         neIMgRNXwnXyN1NVWxLz2GCLxAIJSJ3kNjLXtAiK9xRhixcltzGfP6GPYmnz6JfenMJO
         w6cceoiMOfYTLbHrSY0C7XV5+pIwLcaZsROsVwPUxS3IwcVxamK+liIjo/DVZx5RjKBf
         uo/GNLZ1RpFVZBIrMNaqj3p53FNDwjy2rct0xMkCb4Ec4kI1O2DOIuboOxV7CWaUYk8c
         rAws52IBzus1Up1fjlrUZCtx0Cw3EZKVNulzs990AUHp4c3xz3GB62UarC0fnQMDhrP2
         JAwA==
X-Gm-Message-State: AC+VfDxGwIdZqOFoV18u7lb+/51xFqf0gG2GLGQTYQpbfk0DiS9xWuW1
	LZYUhnO6jHQcF02LX3TYQtI=
X-Google-Smtp-Source: ACHHUZ5zAZ8IAGdmbuDU0W9FVajNnoEGidt01DFtxp2ppa1598wb5+MlB8N2Z7u0ygkAIoZ8bc2JHQ==
X-Received: by 2002:a05:6a20:d817:b0:100:132e:c7c4 with SMTP id iv23-20020a056a20d81700b00100132ec7c4mr2080684pzb.11.1684415528069;
        Thu, 18 May 2023 06:12:08 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-78.three.co.id. [180.214.233.78])
        by smtp.gmail.com with ESMTPSA id cq20-20020a17090af99400b002535a0f2028sm1676081pjb.51.2023.05.18.06.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 06:12:07 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 58CE21069DF; Thu, 18 May 2023 14:39:30 +0700 (WIB)
Date: Thu, 18 May 2023 14:39:29 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: =?utf-8?B?w4lyaWM=?= Brunet <eric.brunet@ens.fr>,
	stable@vger.kernel.org
Cc: regressions@lists.linux.dev, ville.syrjala@linux.intel.com,
	jouni.hogander@intel.com, jani.nikula@intel.com,
	gregkh@linuxfoundation.org
Subject: Re: Regression on drm/i915, with bisected commit
Message-ID: <ZGXWMdTactecOP/0@debian.me>
References: <3236901.44csPzL39Z@skaro>
 <ZGQXELf3MSt4oUsR@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+8GRMAJR8db13eJZ"
Content-Disposition: inline
In-Reply-To: <ZGQXELf3MSt4oUsR@debian.me>


--+8GRMAJR8db13eJZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 06:51:44AM +0700, Bagas Sanjaya wrote:
> On Tue, May 16, 2023 at 03:04:53PM +0200, =C3=89ric Brunet wrote:
> > Hello all,
> >=20
> > I have a HP Elite x360 1049 G9 2-in-1 notebook running fedora 38 with a=
n Adler=20
> > Lake intel video card.
> >=20
> > After upgrading to kernel 6.2.13 (as packaged by fedora), I started see=
ing=20
> > severe video glitches made of random pixels in a vertical band occupyin=
g about=20
> > 20% of my screen, on the right. The glitches would happen both with X.o=
rg and=20
> > wayland.
> >=20
> > I checked that vanilla 6.2.12 does not have the bug and that both vanil=
la=20
> > 6.2.13 and vanilla 6.3.2 do have the bug.
> >=20
> > I bisected the problem to commit e2b789bc3dc34edc87ffb85634967d24ed351a=
cb (it=20
> > is a one-liner reproduced at the end of this message).
> >=20
> > I checked that vanilla 6.3.2 with this commit reverted does not have th=
e bug.
> >=20

There is a similar regression reported on freedesktop gitlab tracker
(by different reporter):

#regzbot link: https://gitlab.freedesktop.org/drm/intel/-/issues/8475

--=20
An old man doll... just what I always wanted! - Clara

--+8GRMAJR8db13eJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZGXWIQAKCRD2uYlJVVFO
o2gVAQDLNFodNLRIMTBFAijZkPKoToY4dzUk95BosvRCNP6VbAEAoYrMSgfiQ1ia
4HVtW1MqhLC+Vw0FeyIoUxK/jq1PPQ0=
=7rEA
-----END PGP SIGNATURE-----

--+8GRMAJR8db13eJZ--
