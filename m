Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F341B21358
	for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 06:53:59 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c43b4b02c1so24578525ad.3
        for <regressions@lists.linux.dev>; Mon, 18 Sep 2023 23:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695106439; x=1695711239; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4JrZnIbFr81fyCrGJLUv7gvnp4WA+u4UAg0ITzEeBQA=;
        b=cExckNmTv6OoCwsY0Drtx3p0TDKyOHt3aCE8RGHhfIgbp7BVb8C6UEo2jusS6Ns41r
         5LgpumwBW/dWWy/l+iLp2kVItCRcTE7742SpJf7+C9qhfKLevCn7jxjz+aiMsJXmGFo/
         7PK5NvZy9guapE1cAACahGvmbyfR48ha4u7xQQ51kOJvSFJ88Fl2VPqRfFc2o2LXCRo0
         thav49eEZ7IuQLsWrBwxuCTwRYfUl0ToE0sT9QAgMZeSjVPbiWloO1F5z02gc0j1BvYl
         9HWSjQaHZvVv4Nb7A2seyvYU2BiRXoxVN3YNT+9hqgKqC/DGYzqKEIAhEn85VRCJ5yPf
         p0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695106439; x=1695711239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JrZnIbFr81fyCrGJLUv7gvnp4WA+u4UAg0ITzEeBQA=;
        b=DKkhefU7rX6dSK5D+p8QekfQ5yZ8kDkWMXBOX4hOuv/I6KhmKVcvCppRNUj8JU4D7e
         s8SwqQwbDTz6vytg7OHHcjivkbebwyHC/9TnDSDZS+gWNHjpDPO6XCgTZ2Uk5yupVlRg
         Qi5sYyMphrNvHuhhck/kfW6P5qA9Z6ED5Xs56uePeyLAryQzbohWQR/9trIm2XcrCFAs
         RrteeqUlQujNdB9ymIDHmRspzq4OBf6RtZma7O1koowk+CUksIgJ7EOyNrByNT91yhRz
         ej6vsDgDwTMmM7E6pcBmjZm6kU8rkpls9kIRDNpBni7dlk6jpGR/FMxHaIGxSx/+ypt5
         o6xA==
X-Gm-Message-State: AOJu0YyDZDcI8nC3BeO+Pgy5g0f96eGRbgnGqAdUpY3XOCc0DQlCb2LQ
	9EuntR0pUN0EUhtfWlcW/Ls=
X-Google-Smtp-Source: AGHT+IGMP5NsHVZjmSi0Vp0O55hNYbTudKLiyCcpM3EX+lbrIZBfzGSRrcHKVwGrQqLqcbzPEIvN+g==
X-Received: by 2002:a17:902:ea0f:b0:1bf:557c:5a2c with SMTP id s15-20020a170902ea0f00b001bf557c5a2cmr10880147plg.44.1695106439085;
        Mon, 18 Sep 2023 23:53:59 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id l7-20020a170902f68700b001bda30ecaa6sm9338288plg.51.2023.09.18.23.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 23:53:58 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 2DDEF81B96EC; Tue, 19 Sep 2023 13:53:56 +0700 (WIB)
Date: Tue, 19 Sep 2023 13:53:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Damien Le Moal <dlemoal@kernel.org>, Song Liu <song@kernel.org>,
	Timo Gurr <timo.gurr@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux SCSI <linux-scsi@vger.kernel.org>,
	Linux IDE and libata <linux-ide@vger.kernel.org>,
	Linux RAID <linux-raid@vger.kernel.org>
Subject: Re: Fwd: Marvell RAID Controller issues since 6.5.x
Message-ID: <ZQlFg4GsULu633P1@debian.me>
References: <224f10a4-7a6a-48bb-88be-491faf8ecff7@gmail.com>
 <ZQf9mh3v5qfN5Tm0@x1-carbon>
 <ZQgCoJ17UioOtdOJ@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6jU0HxXziu/VyJx9"
Content-Disposition: inline
In-Reply-To: <ZQgCoJ17UioOtdOJ@debian.me>


--6jU0HxXziu/VyJx9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 02:56:16PM +0700, Bagas Sanjaya wrote:
> On Mon, Sep 18, 2023 at 07:34:50AM +0000, Niklas Cassel wrote:
> > On Mon, Sep 18, 2023 at 07:18:28AM +0700, Bagas Sanjaya wrote:
> >=20
> > Hello Bagas,
> >=20
> > This is a duplicate of:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D217902
> >=20
> > Problem is solved by:
> > https://lore.kernel.org/linux-scsi/20230915022034.678121-1-dlemoal@kern=
el.org/
> >=20
> >=20
>=20
> I have asked the reporter on Bugzilla to check the fix above. When he
> reports back successfully, I'll mark this report as fixed.
>=20

Another user has confirmed the fix (see Bugzilla), so:

#regzbot fix: https://lore.kernel.org/linux-scsi/20230915022034.678121-1-dl=
emoal@kernel.org/

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--6jU0HxXziu/VyJx9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQlFfgAKCRD2uYlJVVFO
owDyAP0RHtQvjlMD6aj+pXaLGlKI2/uSHkRaBy0v0QW8rlurUQEArZwuCVUahkRb
pL10drC+YaEem5L2bn6mk4iPiP+U4QA=
=8Uj2
-----END PGP SIGNATURE-----

--6jU0HxXziu/VyJx9--
