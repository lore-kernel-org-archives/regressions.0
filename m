Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7FB1F4192
	for <regressions@lists.linux.dev>; Wed, 20 Aug 2025 23:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755731668; cv=none; b=VIkw1xxHoIMx5OvbK2f3ZyFD2ZJ4obN7YplzIaYv9lCfB1h9ERzzk1zMQDtjjDaFcrv7FPNAf9M1Bm9d4k/xDhzND/1U01/wnq2p1Pu+Jrs5aLo+l20pqjSCHYdbioU4beD1/dhEO4Q3TmvABjZX800GiiJlVcaX9rVShHIzUyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755731668; c=relaxed/simple;
	bh=PIL6xm/7vGenGtn3AXVWgyrRZCu371nEigq24oJZOkc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mt2kf8Bv6ynhV8eW8Wb2drQCjji6e99E9HUGJDrAHvGeO+R/jQhciSiuO3htVnc4N9y+GHeOH9utMZo0Fr0GgPeJvukwn4UsFO5q7Iw4fA++bZv+mGq1DxxIv1OKBPCZDtbZS3JlGTUpMYpxDwzgVcmtjaU/7bR5q8Zl7xBloNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIBb8QM6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIBb8QM6"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9edf504e6so279690f8f.3
        for <regressions@lists.linux.dev>; Wed, 20 Aug 2025 16:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755731665; x=1756336465; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PIL6xm/7vGenGtn3AXVWgyrRZCu371nEigq24oJZOkc=;
        b=HIBb8QM6rzoEAPjod816bOYIIExkz2HmO8WOzVE2xXRo++FWoUbD2tK+pk4o/dOnFZ
         RZc9UGd2+IEYkuinF0DHW81gHtYTwbBayPNITZj+mytBSN82yNUHwhitBVURvxZFTjgJ
         Wj8rtS6TxzXZfCrsKnUW/pmGhkIlU4aj8A/8BVYn+FTBZfSygn3gTeLTnxxVJx57LU9H
         F5N+vg4iNbKh75ZyDzhB0Yr2d1M1rsK62eUPxUUUt9RV/USfdBZ85c/If/pay4XA1wbh
         dzfpJujx9ZESGi3pWrwgu9aB0NhXPRBRgxk/KMqOCsFUYDxNJ6m2Kd6sfEdvRqTNN8PT
         Yzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755731665; x=1756336465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIL6xm/7vGenGtn3AXVWgyrRZCu371nEigq24oJZOkc=;
        b=GTpEhDOYx3V+xUml6Bnwpy4RSO4PyBS0+87DwtVttNDLuMERCxsc2D7M/2N6EphbvW
         3P2zhfEdJ/VHt4An9kVRrvBm1iFxNFH17x0brmdHEtUHOKr4rdZBT4e5niYDk6wTKDtL
         HCIYSLBZP/eStJMKWAI1FESPDFYMPFRr4Q8SZd6wANPk4I6djpnMoLkQD/YIjO9xYTnE
         +cd6AJ9XxydPJ+aqQFeNITNnby4gZUoVAe3wvGrCihaZ5GiVlQq5uo2+3tMgLaciJcyA
         VP08lvXO6PQPv+Kvu83Ea62pyBRvsHpiA3QfUpWuwp4KcX7v7DiuhuZzGVDZ8X8CDJCV
         lXOg==
X-Forwarded-Encrypted: i=1; AJvYcCWzjuZVEueeBUMnhy662eISzDpGvyIVpuTZIFkbt6WE2TH3YnC0HcizhNBUiPQHBR0TlUXt6hw6TpkLBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGnESg6T4I5z5VdHwuiZSb6qPK6Il2DHpACcUfWHBgm2ev/BQU
	NL3yXl+619xnSZPkbWsjW6/D20OL2ZrPZ8kFkf7guwaO8DbZWiXFryPxx1t7yT1KC6JNzuM7+Iq
	QfsN4U7hUslBUmLlOf8E8N6bSrslyoJ0=
X-Gm-Gg: ASbGncsq8C0Zar+WQNQQSklAQZc1lhL/7jNLWNQleZskqvPwyhcKbLJ9r6i6hX9KzZu
	+hiUcSMuQj40anD78LIgII/+MldK+OhmxfEF/ZxjBSh47E8z+NAAoEx40Hw1mW3vdjHSM7XF8O6
	8GbAUj3T/Ltn8BcqnO0RmqSRZViYZzLM0Aup9CZ4q/zd+s82ml4OcOAYUAC6xg4N5FbZRuWOghe
	1da2kmxYjvk2K5PapWbjHc=
X-Google-Smtp-Source: AGHT+IF7xL/J5qeGU7qUUnHMyy+vQH5Tt2oPV3P8wpyhba8q4+IEiSNutYzfYaQSwQ/uCj8lCOLnITp6KN356O7nlYQ=
X-Received: by 2002:a05:6000:2911:b0:3a5:8934:493a with SMTP id
 ffacd0b85a97d-3c49736a0f9mr356214f8f.44.1755731664163; Wed, 20 Aug 2025
 16:14:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?5Za15YWs5a2Q?= <miaogongzi0227@gmail.com>
Date: Thu, 21 Aug 2025 07:14:12 +0800
X-Gm-Features: Ac12FXx0gBLh0T8RlKB41soMuTeq_ifB1SJzNYMK84XGbBhFyPuTKVJTzH5GSIM
Message-ID: <CACBcRwK8wUbJ_S=z4QQg_CGfVWQaMd6HktdNCRkfG22Ypgg63w@mail.gmail.com>
Subject: [REGRESSION] IPv6 RA default router advertisement fails after kernel
 6.12.42 updates
To: stable@vger.kernel.org, netdev@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>, regressions@lists.linux.dev, 
	edumazet@google.com, kuba@kernel.org, sashal@kernel.org, 
	yoshfuji@linux-ipv6.org
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

Run OpenWrt with kernel 6.12.42 (or 6.12.43) on a router with br-lan bridge=
.

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
