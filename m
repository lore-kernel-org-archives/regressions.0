Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795596859;
	b=x0mJ6k+kusJ/DDUU69dzbv9xUTwX36UsA0ACL4PhkCNfo8AbeP0tnsskzhxMheUEJc96
	 V+krStSjpEQJUzGXr+jyNzXHYFIpMOoSRiosmFMeT6/kaj+Z4zuCWFQdKi5rtRo62wC3T
	 fkiKfXcbsFRMFwwIjX/ZSW6MZVJr/3OTzNliHEYpBJzKLptCG6bDSV2NIjnizkyLbkbF9
	 NyMQdbN7yGyWgNQoQ0PJQuhWeEPvxVHOxrC53jSGf0ksWIHdphNpcKfErNuiImYKUC3BY
	 xtVnDHJoyjxE8aijXTcP4Gv6weDmEl32yy4wHTOukrkXe0M0uqQoJ0oy7Nq8ETk8abA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=PyNfHdqsKFfNkLXZbnASHjXvSaWoZIYOYFHe7lu1rkY=;
	b=4PIDTslLGO0WeRsTLjH/en9PhC2bMsatxFsSaDFWzxeOb2eP59PtX4DhnSlSh2sAr4/V
	 pe9ybzS3/mcA+JSJvXyWRZxwkfYrNV2n0I43kO7/phQe9CXHIW6Z503Kd+OSfi8z0IK7y
	 GS9ZWq1Qvuvz6hwfGTa0IEaCKZ4dA4anv6xTqP3T1W47132bf2l0rJPGbm13qbIqpwfib
	 0f10q10eTlcd7o37r/gj0AVW37ulErMGE+ojKGPb24mzMog7Wvvo2Gbdty3f1sG1DfZJW
	 fKV6McrMMcn6jXtHw68X+BIdHKUlCI8LFZyHrAT/whYl6A8w+hg3gNy9l1wBrGDkeOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZlwNkJ3+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C78606A329
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 08:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C78606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZlwNkJ3+
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso1837648a12.0
        for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 00:54:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795596859; cv=none;
        d=google.com; s=arc-20260327;
        b=olQS3oBZoNllnV9hxDM32OPhCI0iTjVY7lSRe5F+YQ4YhUojAmfs6QJdXeJr3cRhpx
         OSqRLP9KetSrtm6BknBmhO5UWd9WjVw4MBbawhcWM9XAyfpVAPkFlLMDQvSED6zYN8RT
         ZjDeutT5M6HtLB1+zMJN8rYV780qVB3S5DDUyNKh2LtSJEGFCtrMHcIsfVNk0tS55g4C
         YWbwR6hOI4MtoepSlBg5DMcLl7vd/yKppGjVZ7iY73SKCD3F3N3dcBJOBXtv05bW0Bo2
         GIQ9fCX3x7fvBFOA8HuwTDF/i4hBHxjTnAvP4fFTb2l10V7+1aPpgOL6Or6AwRtzimOO
         rrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=PyNfHdqsKFfNkLXZbnASHjXvSaWoZIYOYFHe7lu1rkY=;
        fh=FM1JayZdjRhyrLe+iOaG660vxPCT1Jz4unvepzNFN0I=;
        b=aEHjN74G7Ukvbr4pSXXPxDExle1z2kbNYIW0BHCN46iBOQUWx6hyG5VBaCb+IDUwPd
         ahfjfT+Jlfvoy6WuTVKKut+V082j6oQAR1eLYpp2oRUFgloDFRwdDjUPFbIU6RUAxDjW
         AVTKCl3QiQZE5vxCz21juNN9xnPBM5WjTe5GXxz+IZWICCfOl0ahOdBPuEPIJZF8l6KH
         6gy+5WR6xiq6DUwasgyRZEz410ywyStHM26Ih/53N8/EkgDXdA258CxfgGPuXaN2E1Ek
         14eE8rDKtraRH4LEHBA4fdBlTUx2dkHezjTO6HpxvrF96iofvByh94TdtqPvH82biZbW
         Fsrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596859; x=1796201659; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PyNfHdqsKFfNkLXZbnASHjXvSaWoZIYOYFHe7lu1rkY=;
        b=ZlwNkJ3+Fc0luW+NIJshzY8+c80GMJFO3toOKgVKMQZa3AjVnQoGyVouVHaAGG1wCA
         Y8IAVcJa+THuOS9Qhcj7kgEzHfgg0TAMrlDkdmyL1EycaX3XQz9NYcs5aWhKKzWI3BjG
         8kfNu5/GDK3l68Lz3Pkr/t9jagFSsnclLmN5gqMdEHnytNdxfdptpqm+3VwhZraycumM
         Hkz/VAvBoJtuI+Gn19wgbtpWiWwth/uchB8KEbRPUGwqfb1h2gg00TA9tP91xJNLOC1D
         6E/ZDStGN8fdORMrYQy/vxk0KMH9n+J9F/oMqtWOKB67ih5W75e2D7RrkvPBP2afZn7/
         GXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596859; x=1796201659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PyNfHdqsKFfNkLXZbnASHjXvSaWoZIYOYFHe7lu1rkY=;
        b=DqaOSUOg7Ceguhd+AKPuAIHVHVJZ+2URVuYwAyCSulylemOeqiYt+i+9oJYOaypprJ
         UtliLzGBCS/hw22EeIJ88sTaT/50m9NQ2gNhF16aX+2Xa+Ts8BxSbtQVEv3rR28D0Rgn
         vCnVCB4hVob6jWbSob/Mhw7kjkvRNkWrcqZ26CuJjiAHFsxURz8f8CEusQZupgtYPPKa
         y9tMIBJ6Vt6lW4pkK6BgvyaOvxjj7t13senfOrkaMWCggxqICj9qNYdhLilNQuZj0gJn
         b005i1ZgueDtwbXjbfKB/FBUbJxULs9KQ6CSmGARaiDIFMkR+THKurlFEUVUu1MV96kz
         RHCA==
X-Gm-Message-State: APuU4Z/fpNTgohG6cLkxRQAZ5gQa+2s5EYc1pixWA8yaMmS+3AJC0woX
	4XTVPys1MGxwrFUq4JbDOkMpgj41QBAR+bV/mZdzZ0B8WgrSs47tZZb5dqrbrein+NXgqEaT68U
	UsrGQ0lMW3SsL3vWsAV5FAYeWptiA7KM=
X-Gm-Gg: AZFdTZfSKcI9eYDzkjZCcHLrFVNBbAxc41ZJVbdtcF06CFHvhJvkPKzKMHrLRBTB87A
	8OfeRp/iygwJOSkNFPBJeuVL6Q1k7k4gwGoJZyq0FMsC5HBa343kuznjjfb5UGKc2guUpuw8GI+
	4Z5g9tbYf0gxf3KRQ9u/qx/42SfpMslYENWEPDZhjbAQ67qfACHrnEfAVRbo96aOheGzkInKNis
	XNYorAuHN9gLIxeTfIJHgTTQD+dZU1EzACsbviujOyiSONOPKdF2mKbSTpPmywKpUPGfOxekG/i
	PNLg4oFm+1KXVqiNej7lgfTQRRec6WpUkGeoQBXoVfrrAOFQnzuC8xFXqEn4wOtyraulyikpe9o
	UrIl73rjtdpntYI/1nU0tMSmhIsLaV3Anx5OV
X-Received: by 2002:a17:90b:2790:b0:3b3:b417:607e with SMTP id
 98e67ed59e1d1-3b41c95b3e3mr15533009a91.44.1795596858645; Wed, 25 Nov 2026
 00:54:18 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Seylon <seylon@gmail.com>
Date: Wed, 25 Nov 2026 10:54:07 +0200
X-Gm-Features: Aa3M54r-pHdY3xVMeBatr4tjAan3opxcyVcgExvTkqW83OhipLQOiS4a4n5bvbA
Message-ID: <CAP-Sd9_iAujzVgXyGV1bW1nzU8T0LjNnpDSMmSb0Xmk8jUdc3w@mail.gmail.com>
Subject: =?UTF-8?Q?=5BREGRESSION=5D_PCIe_ASPM_L1_disabled_on_AMD_root_port_?=
	=?UTF-8?Q?=2F_Intel_switch_=E2=80=93_Intel_Arc_A580_idle_power_increase?=
To: linux-pci@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to report a PCIe ASPM regression affecting an Intel Arc
A580 connected through an Intel PCIe switch on an AMD Ryzen 5 9600X
system.

Summary

On newer Proxmox VE kernels, ASPM L1 is disabled by default on two
upstream PCIe links. This causes the Arc A580's idle power consumption
to increase from approximately 5=E2=80=936 W to 40=E2=80=9345 W.

Manually enabling ASPM L1 on both links restores the expected idle
power consumption.

Regression range
-----------------------

The last known working kernel:
7.0.14-16-pve: ASPM L1 enabled by default; GPU idle power approximately 5=
=E2=80=936 W.

The first known affected kernel:
7.0.14-17-pve: ASPM L1 disabled by default; GPU idle power
approximately 40=E2=80=9345 W.

The issue has persisted in subsequent tested kernels:

7.0.14-20-pve
7.0.14-22-pve
7.0.14-30-pve
7.3.5-1-pve
7.3.6-1-pve

These are Proxmox VE kernel package versions. The issue has been
reproduced across multiple Proxmox kernel updates, but has not yet
been tested against a vanilla upstream kernel.

Hardware
CPU: AMD Ryzen 5 9600X
Motherboard: ASRock B850 Pro-A
GPU: Intel Arc A580
GPU driver: i915
PCIe topology:

00:01.1 =E2=80=93 AMD Raphael/Granite Ridge GPP root port

01:00.0 =E2=80=93 Intel PCIe switch upstream port (8086:4fa0)

02:01.0 =E2=80=93 downstream port leading to GPU

03:00.0 =E2=80=93 Intel Arc A580

Observations

On affected kernels, lspci -vv reports ASPM disabled on both upstream links=
:

00:01.1 =E2=80=93 AMD root port

01:00.0 =E2=80=93 Intel switch upstream port

Both links advertise ASPM L1 support in their PCIe capabilities.

Manually enabling L1 on both links using:

setpci -s 01:00.0 CAP_EXP+10.w=3D0002:0003
setpci -s 00:01.1 CAP_EXP+10.w=3D0002:0003

immediately reduces GPU idle power from approximately 40=E2=80=9345 W to 5=
=E2=80=936 W.

Reversing these settings causes power consumption to return to
approximately 40=E2=80=9345 W. Re-enabling L1 restores the lower power
consumption.

The workaround has also been tested during Jellyfin transcoding and
Immich thumbnail and machine-learning processing without apparent GPU
errors.

Questions

Could this behaviour be related to a change in PCIe ASPM handling
introduced between the working 7.0.14-16-pve and affected
7.0.14-17-pve kernels?

Should this be investigated in the PCI subsystem, or could there be an
interaction with the AMD root port and Intel PCIe switch?

I would appreciate any guidance on further debugging or information
that would help identify the change responsible.

Thank you.
Seylon
