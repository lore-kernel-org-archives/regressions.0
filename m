Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C3D2D04A
	for <regressions@lists.linux.dev>; Wed, 28 Feb 2024 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709109169; cv=none; b=f4qsjZPB6yATNzwQuPpTGaQiBRAsxARBEknex6CpzKiISvnoPk9F95gR3YuALZNuKjmmO+lGzRypr/i0/i9Gn/YMqdaPbm19I/+3RelDf9AHHWfFCi3pDWAOBIXdtrs2um1tUURFNRtkVKUFGDYU9TJ6ZN3c0epmVX5WNeU1G+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709109169; c=relaxed/simple;
	bh=t40K0JM0NMfK3mCMUC77qdJh8lHBWSded2PQLMcMHuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T39lvtBSXvfQ/ywjsOU3BUBsUVkQBSvW8pGgVEYCtIqg9X/qETz2XsooiHc9nQilZYAAP5sYslTGsMvDb+fVdo/y+7jJ1Hw1ftGcQbFudmnBnlNWUt+B1zha+sf3ZWlXPcW7L4bPRXgngL1J+EVa+UD3z38D8cbXlUZVnjBc0gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKnltFli; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKnltFli"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-29a6dcfdd30so3703671a91.0
        for <regressions@lists.linux.dev>; Wed, 28 Feb 2024 00:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709109167; x=1709713967; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t40K0JM0NMfK3mCMUC77qdJh8lHBWSded2PQLMcMHuM=;
        b=eKnltFlip5hNJP/HFL6qGkvAZwsZMmy7LxRCWTHt6LYswY7kIHcyf4v3r5KHm245kk
         XTlnE7sBEhUAEQGizKcomtV0mp/YbZLdw56D1A7hdgeZt9KQTrCW7h9Lv+WZmcC/gzMD
         /06fMfPDhyWbnF9KqmDLeII+DxQ82qurdrh987b1HoWw0GJzl7DB3EqgX4iPWC/EPrqQ
         YP4/licuVJktw+yezHJ2/rTT645txLpEdP3fur7Z7+Xb/acINq7EBjueG+1HhOBfpACA
         S6AxFql7ePio/QWk4uubb+7V/pxRznMI930dhFbp9uM7Gvhr3KNRFTd2FNZaQBumAB86
         QLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709109167; x=1709713967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t40K0JM0NMfK3mCMUC77qdJh8lHBWSded2PQLMcMHuM=;
        b=UHhC6m5kSy0q+a94FyrOmjFtlCiwCx/uf1TQ32onfUDiAjXLl4cfGW+LgH8xvq3h0i
         zZtyx6WFQ8zXtRxgAAKaUQG7N7AcVyCyoMHT254ZB9riZF9OD/UZZZp2/csDtHEegfU7
         QBFnwPOnkWJrKnePiq31S2U4ClzFf4szGElxm9wGmHAT3leYSdER3nueGsbhMBJZihxE
         WaxSbdYC6X+EmD8QXU21+mfeGfs2quWNaMl0v/fz3txM2yqmAQ7XGfjN8SV6pNacSwMT
         rm8EACPGUZh3YSp4j7xp/jRLjausg7+pc+AGWRKjYdktZWs0p0JBz3LupJluH2hhOJ+1
         K0Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUYZSiH6Y5PK1Qc/h8tyv8qzc26nwUb+oURpu6YWx4uV0G+tRwIBCRcVIiG0NfGTRDIpDMgttCc38XNKgizXUi5dEx6laaWVUgXYn0=
X-Gm-Message-State: AOJu0Yzl0nuI4CsS72Su5BcTfsowlRz8Y1zDTv/URGx3/Aa3qugd6hvQ
	w4GjjMcIYtAV5JD1dPLw9irTDZrIh7pm4p8q2gbBglvwS4tFWTzl
X-Google-Smtp-Source: AGHT+IEPBy5Yel+v4FYYx1dJ/kW3sj9XgdN6GjR1Lqmv35o9Q62to13V/d1NNwcnNw4qpmaVH/AN5A==
X-Received: by 2002:a17:90a:88c:b0:299:3f10:20ba with SMTP id v12-20020a17090a088c00b002993f1020bamr10292017pjc.27.1709109167564;
        Wed, 28 Feb 2024 00:32:47 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id sy12-20020a17090b2d0c00b00296f4fc7e60sm962560pjb.12.2024.02.28.00.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 00:32:47 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id D8B75187DBEB7; Wed, 28 Feb 2024 15:32:41 +0700 (WIB)
Date: Wed, 28 Feb 2024 15:32:41 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Abdul Anshad Azeez <abdul-anshad.azeez@broadcom.com>,
	edumazet@google.com, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, corbet@lwn.net, dsahern@kernel.org,
	Linux Networking <netdev@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Boon Ang <boon.ang@broadcom.com>,
	John Savanyo <john.savanyo@broadcom.com>,
	Peter Jonasson <peter.jonasson@broadcom.com>,
	Rajender M <rajender.m@broadcom.com>
Subject: Re: Network performance regression in Linux kernel 6.6 for small
 socket size test cases
Message-ID: <Zd7vqSnT6ocYLuZ4@archie.me>
References: <CALkn8kLOozs5UO52SQa9PR-CiKx_mqW8VF9US94qN+ixyqnkdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aJ0FkAcvBcopWHIX"
Content-Disposition: inline
In-Reply-To: <CALkn8kLOozs5UO52SQa9PR-CiKx_mqW8VF9US94qN+ixyqnkdQ@mail.gmail.com>


--aJ0FkAcvBcopWHIX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[also Cc: regressions ML]

On Wed, Feb 28, 2024 at 12:13:27PM +0530, Abdul Anshad Azeez wrote:
> During performance regression workload execution of the Linux
> kernel we observed up to 30% performance decrease in a specific networking
> workload on the 6.6 kernel compared to 6.5 (details below). The regressio=
n is
> reproducible in both Linux VMs running on ESXi and bare metal Linux.
>=20
> Workload details:
>=20
> Benchmark - Netperf TCP_STREAM
> Socket buffer size - 8K
> Message size - 256B
> MTU - 1500B
> Socket option - TCP_NODELAY
> # of STREAMs - 32
> Direction - Uni-Directional Receive
> Duration - 60 Seconds
> NIC - Mellanox Technologies ConnectX-6 Dx EN 100G
> Server Config - Intel(R) Xeon(R) Gold 6348 CPU @ 2.60GHz & 512G Memory
>=20
> Bisect between 6.5 and 6.6 kernel concluded that this regression originat=
ed
> from the below commit:
>=20
> commit - dfa2f0483360d4d6f2324405464c9f281156bd87 (tcp: get rid of
> sysctl_tcp_adv_win_scale)
> Author - Eric Dumazet <edumazet@google.com>
> Link -
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D
> dfa2f0483360d4d6f2324405464c9f281156bd87
>=20
> Performance data for (Linux VM on ESXi):
> Test case - TCP_STREAM_RECV Throughput in Gbps
> (for different socket buffer sizes and with constant message size - 256B):
>=20
> Socket buffer size - [LK6.5 vs LK6.6]
> 8K - [8.4 vs 5.9 Gbps]
> 16K - [13.4 vs 10.6 Gbps]
> 32K - [19.1 vs 16.3 Gbps]
> 64K - [19.6 vs 19.7 Gbps]
> Autotune - [19.7 vs 19.6 Gbps]
>=20
> >From the above performance data, we can infer that:
> * Regression is specific to lower fixed socket buffer sizes (8K, 16K & 32=
K).
> * Increasing the socket buffer size gradually decreases the throughput im=
pact.
> * Performance is equal for higher fixed socket size (64K) and Autotune so=
cket
> tests.
>=20
> We would like to know if there are any opportunities for optimization in
> the test cases with small socket sizes.
>=20

Can you verify the regression on current mainline (v6.8-rc6)?

--=20
An old man doll... just what I always wanted! - Clara

--aJ0FkAcvBcopWHIX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZd7vpAAKCRD2uYlJVVFO
o3FWAQDe+PbGL4LW/N1x23XLUSDEsqAGX9WqhwvPNQEir1nE3gEAqt155Cln5op5
oMAlTfo6KFQ5Sl5qdUv70rbcuu4T+gs=
=88Qq
-----END PGP SIGNATURE-----

--aJ0FkAcvBcopWHIX--
