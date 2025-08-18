Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7982E22AF
	for <regressions@lists.linux.dev>; Mon, 18 Aug 2025 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518596; cv=none; b=hiqXqrPsRVCr37tc2uy2TvyNO8HVVzZsYu1C9FXWSuU4Vwtm6rnJlYEe28sNWR3fGRHEWv6W59giP4Xz0I7pt93zuidsaT8Xe2nXttpXS+Plaxw2Fu7j74VyZmdV8+HSq6bsT9GoYNdKAw3kzKflVTwOve2q13+jKocxGnOUYaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518596; c=relaxed/simple;
	bh=MaYubBCQWAasqPoZ4eaRm9SHFdkSTSmzvdSy+5/YQH8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rYTN3vRGoaOm9fIV+VOPjdT2QedEQVA+vsMg7h0pYbB5r6kzpdqYEnr7ZRLnVcEWsmyUgPxUJT+kD/sEhwGPuMkqLUQ1c3nJubEH08hl0ex3uuRDyaVIj9uhu9Jy+U96PnGdgSwseLgXGGudM2bn72FZlhCteilKz58H/SxsfaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPNfd+EJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPNfd+EJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso32526805e9.3
        for <regressions@lists.linux.dev>; Mon, 18 Aug 2025 05:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755518593; x=1756123393; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MaYubBCQWAasqPoZ4eaRm9SHFdkSTSmzvdSy+5/YQH8=;
        b=hPNfd+EJMT10r/bbLyKt+yjO4FTqHnHb1jO0UMjpBojKKjj6yd5t+Kp/mkp6SWALGU
         wsfxTP4YUvfx8qTJtbabpuX+uX9Vo2EDyxOKUk0EmVWcaCIyxHjDFJMeHU2HLxhp4MDI
         lPsg36rUnj2Q69rW4L10jxvnygyG2UWPxp9eVakHPiYbxcSrbSSH5kZO0lMaTxcJ+QoU
         XO0DMpDod16X26UZ4nXYZ12WbPWHko+Ieyyp25DsRkifFIOFpVhwbjRE8ibCz4+FVeGM
         PQPjRZ90wLb+3nQ3EPzFaiSHl2nqJIAkry7tI6FeThy7kQ65h/jXWYhkT66u73qL621b
         be5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755518593; x=1756123393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaYubBCQWAasqPoZ4eaRm9SHFdkSTSmzvdSy+5/YQH8=;
        b=vb0apVDOS2fG4VJNbtwX6bdRpJahY7bRVirxf+NxuY4WpR/wAsAZ8A94mj13iGwhU4
         xD9Ulw+MD1GugRtF1FR+eXryPMbUfu5c0zUpRrmaM7fBTe0JfxYTJEX3p0OVHBtDRbbp
         UM2RMDgPnjRcfXiw5xnCKUj8N1DnugjyNKw6U2VpHw3cCrk6QyKVgHR6BDlWs6Eibn8w
         bm06Orsi1WTfzcEPMgjtgtTNbwuWMQeKj/HhW3/mz4stbjxcNSBGGUFvvqTiWYf818wh
         ihGGFRswrbdyMD3tVBd+YmzlJnTzu0XMkObpRkwyDmV+YrRFVvg5FqZWW89mx8Z45a5e
         yzsw==
X-Gm-Message-State: AOJu0Yyy38E2TJ+Mx0cvzkkauJxW3lEcPKSJZ2fv7+DzaxB9zdV9k5lR
	ouvVQDcmQZv7KrrfZ5ZmM7e4GIxgw4EyKTW3nl+vhTvIBcyGovA8IEXEwuvmNQ2HVzeijLJI9Q7
	vnvrjMV/v9LPNYgCxDRky89gznNhlPVngKaY8DG6VKcyI
X-Gm-Gg: ASbGncugP43zR9ypylRq/oed9E6hCL/Sty0d5o+llbDYd2ltArpnsWjnwdtFzXwc4rY
	K6xSUVwTg4xeZotej+kCXSWmH0KJ58G1x1W/L4Mu/+dRDujvnjuRjNNqqD1+Ahx0vDSKB9s0Apc
	LPYfAJ2FKagw/veR99MbbLNzUoFuKIthqLK4VwxYT+RjFmz2ef/69nRry5achwwWdO48hiYT1ze
	Gi8jp1x
X-Google-Smtp-Source: AGHT+IGYdWvI+uTxadLH2zeve19zPjNVFGol6N6HNqJSEG9k0vrbJWrMjWvGouPVZgo5uS9k9jzvf0LtOtoJhDJFCJo=
X-Received: by 2002:a05:600c:1914:b0:458:bc3f:6a77 with SMTP id
 5b1f17b1804b1-45a273becf0mr67451675e9.2.1755518592212; Mon, 18 Aug 2025
 05:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?5Za15YWs5a2Q?= <miaogongzi0227@gmail.com>
Date: Mon, 18 Aug 2025 20:03:00 +0800
X-Gm-Features: Ac12FXz9THHGrPuKRAARYC_e0dKHuCmvZKAlgezYau7bZxiA0mLaNZgOd4kku_I
Message-ID: <CACBcRw+Fu1B+fXEFvhfsZFtPqa5G=AYSW0K3L2RBWh8YfkgUhg@mail.gmail.com>
Subject: [REGRESSION] IPv6 RA default router advertisement fails after kernel
 6.12.42 updates
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

While testing Linux kernel 6.12.42 on OpenWrt, we observed a
regression in IPv6 Router Advertisement (RA) handling for the default
router.

Affected commits

The following commits appear related and may have introduced the issue:

ipv6: fix possible infinite loop in fib6_info_uses_dev()=EF=BC=9A
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dv6.12.42&id=3Ddb65739d406c72776fbdbbc334be827ef05880d2

ipv6: prevent infinite loop in rt6_nlmsg_size()=EF=BC=9A
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dv6.12.42&id=3Dcd8d8bbd9ced4cc5d06d858f67d4aa87745e8f38

ipv6: annotate data-races around rt->fib6_nsiblings=EF=BC=9A
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dv6.12.42&id=3D0c58f74f8aa991c2a63bb58ff743e1ff3d584b62

Problem description=EF=BC=9A

In Linux kernel 6.12.42, IPv6 FIB multipath and concurrent access
handling was made stricter (READ_ONCE / WRITE_ONCE + RCU retry).

The RA =E2=80=9CAutomatic=E2=80=9D mode relies on checking whether a local =
default route exists.

With the stricter FIB handling, this check can fail in multipath scenarios.

As a result, RA does not advertise a default route, and IPv6 clients
on LAN fail to receive the default gateway.

Steps to reproduce

Run OpenWrt with kernel 6.12.42 on a router with br-lan bridge.

Configure IPv6 RA in Automatic default router mode.

Observe that no default route is advertised to clients (though
prefixes may still be delivered).

Expected behavior

Router Advertisement should continue to advertise the default route as
in kernel 6.12.41 and earlier.

Client IPv6 connectivity should not break.

Actual behavior

RA fails to advertise a default route in Automatic mode.

Clients do not install a default IPv6 route =E2=86=92 connectivity fails.

Temporary workaround

Change RA default router mode from Automatic =E2=86=92 Always / Use availab=
le
prefixes in OpenWrt.

This bypasses the dependency on local default route check and restores
correct RA behavior.

Additional notes

This appears to be an unintended side effect of the stricter FIB
handling changes introduced in 6.12.42. Please advise if this has
already been reported or if I should prepare a minimal reproducer
outside OpenWrt.

Thanks,
[GitHub: mgz0227]
