Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707ED17C5
	for <regressions@lists.linux.dev>; Sat,  9 Sep 2023 05:37:25 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68a4bcf8a97so2165524b3a.1
        for <regressions@lists.linux.dev>; Fri, 08 Sep 2023 22:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694237845; x=1694842645; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bFQ0t0uD6xgDoywgg3aN4cVqH93hmn9yTMWxAqceJW8=;
        b=JzYsDUNbDbqCZtsgJRfGfibpp+6zZOQS7/xrn40YI5ilo/G3LgWggyZbE3MTLJWESK
         xsSmgvViH3AYM5EkaFDu8vDshPEM5g49lmQTBCpBaV4b1HUE2mIajqpCGKBuFRWXw+Fv
         ft/VcBUZ+pzlEJ6au+7s/TADPfsRv+GLvIvvPYUngr+5nknxjKy/29F56T8JB1UaXdAe
         qZ18mJbfGKkXSjNQgJxXGk3bJh5jSRIuIqexZsPZy+M6BSdMqi2ocibNITHbonNpXWBD
         wkI0CFSRSJ8y1MfSoG5fCHcEAgJ0Y0JJikDBO95WFUv2pPfsPKrlVrIboSHy56V+EQoS
         uPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694237845; x=1694842645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFQ0t0uD6xgDoywgg3aN4cVqH93hmn9yTMWxAqceJW8=;
        b=PwooAZPTzAi3K1Zoa0ioDBu+Wlv4nv5Z7NVS6Lx+90uS0pmwSIGfAVL+QRpmT3K/tT
         hWBNKlq20u+C9iuSu2mbvuNfeK2Q1k8SrnIpMtzM7zavu4JgoVmia8M+ZNOboDgyHcUB
         6oiSprw3EG9d2FY2RbfMv748lZ4mKKNno6pHjz1cSPa7YnClZGy9z8AHN4TG/Yf7ONly
         kd64o6H2J/tpLuETZhFGq8KZqVd7mWrF552qoyrViBw4LlNEt87lHn9WNyP3JEK+W5qk
         qVUAsHfg2HmctUlpCa6mNZQ7lbSutBo4udaq0Fk9+mP3CjCQpxdnFN+txp3vGNeubvKi
         ynoQ==
X-Gm-Message-State: AOJu0Ywx6OJBK2/JxbcV6lfe/pHVOHry/Z59uW4/stl+MpKz3FRA56St
	XxJVRh5U81WApl7O3zad9RQ=
X-Google-Smtp-Source: AGHT+IHNFDByETjzv4HPnQxVupj6RSk7YkzviBjkYMWjW45k+/RS05dM1OIhmQeWqnE91WNyi4a92g==
X-Received: by 2002:a05:6a21:61c:b0:14c:e089:94a8 with SMTP id ll28-20020a056a21061c00b0014ce08994a8mr3788602pzb.27.1694237844670;
        Fri, 08 Sep 2023 22:37:24 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id jj18-20020a170903049200b001b9d95945afsm2456479plb.155.2023.09.08.22.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 22:37:24 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 5F1519A5D462; Sat,  9 Sep 2023 12:37:21 +0700 (WIB)
Date: Sat, 9 Sep 2023 12:37:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
	shenlinghai@163.com, Jens Axboe <axboe@fb.com>,
	Sagi Grimberg <sagi@grimberg.me>, dwmw2@infradead.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux NVMe <linux-nvme@lists.infradead.org>
Subject: Re: Fwd: Ubuntu 22.04, "nvme list" will hang for 60 seconds after
 "nvme subsystem-reset"
Message-ID: <ZPwEkVraLm9WIkYK@debian.me>
References: <8edde583-2b5f-2332-e59a-f1f4688b9e40@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MPojfPQaeXRUiCUh"
Content-Disposition: inline
In-Reply-To: <8edde583-2b5f-2332-e59a-f1f4688b9e40@gmail.com>


--MPojfPQaeXRUiCUh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 06:41:01PM +0700, Bagas Sanjaya wrote:
> #regzbot introduced: 1e866afd4bcdd0 https://bugzilla.kernel.org/show_bug.=
cgi?id=3D217745
> #regzbot title: listing nvme devices hangs after subsystem reset
>=20

#regzbot invalid: regression reported using downstream kernel

--=20
An old man doll... just what I always wanted! - Clara

--MPojfPQaeXRUiCUh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPwEkQAKCRD2uYlJVVFO
o5XAAP9HgtdqEDXnbtYY8DMvg7aMO62dgHjsURSMH2FST36TvQD+IMVvnH2iXslb
028fbd/9PzCQCfhZLz5BrPf2TWQ5WQk=
=G5rm
-----END PGP SIGNATURE-----

--MPojfPQaeXRUiCUh--
