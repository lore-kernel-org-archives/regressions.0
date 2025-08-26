Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9840835334D
	for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756218372; cv=none; b=fH9PgDmJINxYX42gajMq57wtU4dn/1fsWDx9V2YRSofJFbtvx65fSF+/t817fGJVHk3ujlWIhJvGSpjfY2mtDIb2O+wi+wtGisndAFw3Py4RfnNVS5lXi8Dc5jORm3Qvm+5ApKyhtXLvhY0cz0p7yF93FL3C9iGXcBbrpa2uufE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756218372; c=relaxed/simple;
	bh=q9j2PZULGXZHOrc5kNbcezwPm4NZHYRo32d1BVrCjbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrKkY5A0rHAjm/iPA8rVmxMLNiJTZHU3h0O5jmDuNBGqEEbuRExoDiX0IYgfOgE8D0LYAt21ajHcrFqi7+2SoCA7QieqlXeteAsC0Wks5BacHU8DsQFmpNISz7+S44lJZ0I6eC2gYYUIiGyX1iS14U0KI4hoVXL6OKVG7ODLr7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BWJNe9+2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BWJNe9+2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3c79f0a5c29so2621659f8f.0
        for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 07:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756218369; x=1756823169; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q9j2PZULGXZHOrc5kNbcezwPm4NZHYRo32d1BVrCjbg=;
        b=BWJNe9+2aPCnSoCO/bXNFWG1Zr5wlJXJDgTN81R27DpPmzvjeKmjNFS5SHLm3ORNoY
         mNMTUkT1FUyUUA8mrNOn9DxLuaMjQtGNUQDV/sesSrVZpuqrgydZhST8DRryU1GW/VAN
         eBxLEd6ICmK84YOFpR+IJ0CmAAbKo3zgEvqeAkyBxeOQJyIt/eNT5kRS6kIQejPKpYSc
         /IPQhUoBe49DeIDrm0I3LfpXrfIfvfH5AqTHogw5SDBX07QzOEABg5g6THG1/Zwl3cmz
         gxHyrbadRSX+rcdYgOYj0vQIPDhDe++YtVOQfTc8wd8g5NH7jrsIRqdnwGXbnxYg3kVn
         59RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756218369; x=1756823169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9j2PZULGXZHOrc5kNbcezwPm4NZHYRo32d1BVrCjbg=;
        b=Nl3fXdH7SmhOCoKHKA9Vy6dhBjavw1pWQ+N2/YGuWJCCpg1nvvLMW3BRPvGg2s42V2
         9kI/b+Faek5BMWPLknSfSANAKTA5JbFK60XLhMg8l7lRJBTwCyLt8x2kUHBZsZmX50Cf
         WymWFRSzogDYGTuqisPP7xmGEyAg9IKfnHBtqB8jcXkYADx1Z6ChvzqS6OcNTR1/tvdf
         VTT8bbPxn0j4EoLgneloEcqAUNucTtAzRPQD855VNrpmfVo0AshMmjwXAXY2DHzZrY2I
         scQA7dqnoIY+d9hsLkUuDRi/IQIkH8aGJohItjEM5mYbKcRL8aO0WCGIGc4Dr8vAo9aq
         gzIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtF4sxkTvpChArdnlNpxwGZhlNIuHvPTa4qMIluEMb9rqga8vyecTK++yV/f0sCelvgLamNNYfWipKkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeWoiEfqPLK+CXBc4sP8Cz8S1pFm1zrCUn3RZ/aMmtbYD3Oh+5
	OS2XICRH7vfD4LZSiplRpC9r8sHZ17AqLxrTv+mofduS1QsDgzxBwc0fu+afzXRyfb4=
X-Gm-Gg: ASbGnctXhOWGyON4Ii8JJOoa2TdYzeaAcZR2ftpRYfaaYH88X+oc9/5uPDR0bY6Kktq
	zC1yq8anKGE+73rte1HhSPhLMEScIgFuLFuGPaPeBsjYKvBiOyjmUCMtNeaC1t+Q2oYo+8TlC88
	som4tZH+CEfVoA4OL1Om9vHahxPLFtBT8DYIXTMGmqrF5KGfl0fil1VpoeT1deCEGkHNJb8Aknq
	tcSJNVHAx39caamG7y2mlsQawtgRhZyqFrVIieoEsEAiqvWcdLq5dgCheu2bw2ZPxlg/u1TIa6V
	8p3DjPcj4KwD3qTfZJcQ/Tj+5g3Sjr4N1RNgI6VqIoVQkwR7hHy6zPMjSptawR0u4PZqyFYrclU
	1bYUU2QC4SGCKlumXAuAp0xTJHZM9p/4DhPygVyffzyc=
X-Google-Smtp-Source: AGHT+IHNuSehu+kC/8JT6eOvIgtP+0NWIiWUAOSb8fB6NxBNImXOnuq9wHCo/AxRrqB9def2TYx5ig==
X-Received: by 2002:a05:6000:40cd:b0:3b7:8da6:1bb4 with SMTP id ffacd0b85a97d-3c5dcefcf18mr14788726f8f.58.1756218368812;
        Tue, 26 Aug 2025 07:26:08 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668880368sm97231965ad.109.2025.08.26.07.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 07:26:08 -0700 (PDT)
Date: Tue, 26 Aug 2025 16:25:55 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Cgroups <cgroups@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, kamalesh.babulal@oracle.com
Subject: Re: next-20250805: ampere: WARNING: kernel/cgroup/cpuset.c:1352 at
 remote_partition_disable
Message-ID: <hyqcffknmjwjuogoe4ynubs3adk47t2iw4urnpjscdgjjivqz7@b5ue6csrs2qt>
References: <CA+G9fYtktEOzRWohqWpsGegS2PAcYh7qrzAr=jWCxfUMEvVKfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="23hhozo72xquqq7g"
Content-Disposition: inline
In-Reply-To: <CA+G9fYtktEOzRWohqWpsGegS2PAcYh7qrzAr=jWCxfUMEvVKfQ@mail.gmail.com>


--23hhozo72xquqq7g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: next-20250805: ampere: WARNING: kernel/cgroup/cpuset.c:1352 at
 remote_partition_disable
MIME-Version: 1.0

Hi.

On Thu, Aug 07, 2025 at 01:57:34PM +0530, Naresh Kamboju <naresh.kamboju@li=
naro.org> wrote:
> Regressions noticed intermittently on AmpereOne while running selftest
> cgroup testing
> with Linux next-20250805 and earlier seen on next-20250722 tag also.
>=20
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Intermittent
>=20
> First seen on the next-20250722 and after next-20250805.

Naresh, can you determine also the last good revision? That would be
ideal to have some endpoints for bisection. (To look for any interacting
changes that Waiman was getting at.)

Thanks,
Michal

--23hhozo72xquqq7g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaK3D8RsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AjraQEA/sATM9lqrOJV8YGvjMwn
+GWni0VR34BMM7mWvDUzGxEBAJpsvXzuNyDJBDJGhCreK69pFRuLZ5En4BTai+Fu
Oc0F
=Z4+0
-----END PGP SIGNATURE-----

--23hhozo72xquqq7g--
