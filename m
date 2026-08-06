Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23037471CFD
	for <regressions@lists.linux.dev>; Thu,  6 Aug 2026 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017297; cv=pass; b=IFvCqsT7z5YJR7CaVNsy/QAFn4Q/l+iqXvMrB4ptIByqZahcfpr3dja8wO6w9q79epFgl9jcODVI+5dUo9WtaDDO47JKJZdJ1AIlMdE1aBeqNxS3rPAy4ts4y8gIEfp+A3tIaf4o7id+cZUCAp7Ve7wSSPqzmQgtml+4uIdEjGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017297; c=relaxed/simple;
	bh=R1a76pShyRpSs0tLIYL+mZr+MgkKX6Q/fW20vR3BpC8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=G4neRLn4IbG37mEDzfOe1FzKEr/8CIuoXllEnoKHuoJfuAAwa5vpzNxYx2KMCQ9O2k9huP+1Z5D4jX5FNILlmE8PVdwgm2/O1GUJ/cUnP7GLMR7Ois1Va1Fuybr3swPg9+lvB9U29+2dBtn9YV7hX+nhUmc0Hesslm8Dc6l9Tyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAl+/aY4; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAl+/aY4"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81ea0b7d137so18330947b3.2
        for <regressions@lists.linux.dev>; Thu, 06 Aug 2026 04:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786017295; cv=none;
        d=google.com; s=arc-20260327;
        b=GIjG4zUBKV5n6YoUXR/uxbofOXUufap2jd/Cu48454xYJuBHs/9mV3m1Rp7D7jFNny
         EfpQydvL/eAB9nVVf1yIVy8GmREf6lIs1XsXFKTRmkUVQRPEgRaKagx8Z2yM7zYK2DTH
         qUxJhfjqkZ1JX/Umf2nzLDfos3kpDGxddtJCweGFCANKUTxVmVpjQxGHNO06NwbvMLlD
         9Z7Rsqu5z4AazzAb0jNI05Nn2nZexxovQHXLMaOKTUpc97w96ig8T+Iv3wF48GxUM42f
         +Pl6mEGYGBvjeeKSGpYQgQmcqTTfinxQG0Ksv8Ev5ZoThg1Nkua9g/VXWyF4N6fq68Gl
         DHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=R1a76pShyRpSs0tLIYL+mZr+MgkKX6Q/fW20vR3BpC8=;
        fh=OWAw8onC+EhrRgylSl4+MWzE+Y4KXLmJdha07rEUP8U=;
        b=m+GtKJCBnFjxLrQlOSm5jMjz1Nvk4R2huZaen8cl/Igm1J7BfbEfJG7tXFm9Ow7YHq
         vQ+1BHXQe3H+w/OU98JS/mZzCunAW8EtRrBlJkyoOzI0zJa+meg6hs7LDx9YBDv+XZ4b
         1OgCq5vXavWrdS757d5vc+ivXBBD00hu5c177tuaZZ6pGUaIcR2stfyWMXUfUaMiuDbJ
         DRGzjq9pIvCD48igmjFRKm4Jajz9vPMcZa0ZSUr9g7xOX5lZV93qn2guQErrzUlouc8f
         jG8m05lokCmPFl2TyfIK3KA+FzPfZUBwipdeO1OVPw/eXtHSHF3ykjnbJEI15JQ1NWBT
         AZZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786017295; x=1786622095; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1a76pShyRpSs0tLIYL+mZr+MgkKX6Q/fW20vR3BpC8=;
        b=eAl+/aY4MNWB0LmRVm0ll2iVTh3n5jUetsCiVwLOIYS8cYebQ5GIoIbX5cyWi75tZJ
         QoReb6Oup8LcMnHiJ0Nm1fXpW0jUtWbQinRSDdHrhS+mir8hcL7kyykmtxt7xCIiv90k
         szVKf4W9jubf3GlByF0z5efJuiFER5JiaFvppcX7iG4fnc8VYpEYC9esyn5LGxIzZChy
         C2beynpMhyzfh7TOYv4kiuNdJW8e6zW9aBsYS+vWTMWnTBc0M6AZxnE9F6Lm+DuWGj9m
         JRa2vLbo2HypNkhacjOQSIUHRxupHL2wmEajkXW9aR7/0ulMAnEVMF52HoQEb6zDqyNE
         Wulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786017295; x=1786622095;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1a76pShyRpSs0tLIYL+mZr+MgkKX6Q/fW20vR3BpC8=;
        b=ERiA2cs6kb0LUXM2EWRNyJ1RkQWjGopajQD7T5zL/dUvV2hddN8RPiuYP8lb9tqyz5
         pSnG/2VLROMuwi5hZznWcRkRzhuzy2/y0G8SrOw4BP18JjJUQHORfqiDt48ugCcHQ1Iq
         0/MScaDq35DqPVdSJ4L0BYKEx4lDRmEwi4O3hcdORW7n1ICuCs/Yk2Yxapk2SlmIEt1n
         YFCLEhsksnMzbj6xeppLzLIvBqI5i5MYp0e+dWQvuoAJSAcpVKTnymcXwuEnE2Mh8X28
         gVicI/oYgTWiRZ/47nxUGa/1AOPEvbr4QO+gfwbA48wLqnCG63UsR2h2zOf6Nh8yG7tY
         5fIQ==
X-Gm-Message-State: AOJu0YyVBx03DxOaZ+8nouWwsMxQNTI12PeWOfV8clXEATy8U7q76PJD
	QCAcp+7fIyCtHfi6DFha48SEervfD1aLXtKRPXMBzBRxyhIKM5lFOjFRr7d7Z3wU+ltXPRBsMab
	hFzQf34oWqyVYGYKC4EJq0urmhwglmZmiHsZjtkA=
X-Gm-Gg: AR+sD13rf0WIuDmpmRQYvfrALq8snAJ6RCzR57NtR/hFHhxcBRzIstQq989cBdVbfla
	swAgJE4bRQJE7PxucI/ZXKCmtBOej9A/NQ5vV/cGok9fZSPahWy9vkt40w54vExCKNOB2vlzESM
	tfNq6UpZcK4hhNPvtD01vwFYhokH/9FO+LDHV9K3vXjGMY09RxfFH1boVzJyhf82SseLhXceXOY
	d8MCLxmBDuam31GwO2pz4dUR9X3ceIkWu4AwfB9kzT4mIM4L1uIZsm8KzUJqGN49QBduThF1e57
	agTPVhdw+vDdBnusOVWh4GgbQXOUZ8RKw9BNWSBjWFWPPGDaDfVeNwZDr3QyoqrHWVSIiOt7tEA
	=
X-Received: by 2002:a05:690c:f14:b0:80f:9998:e614 with SMTP id
 00721157ae682-8202288040fmr80320427b3.28.1786017294938; Thu, 06 Aug 2026
 04:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: nomorsukses@gmail.com
From: "nomorsukses@gmail.com" <nomorsukses@gmail.com>
Date: Thu, 6 Aug 2026 18:54:18 +0700
X-Gm-Features: AUfX_mx0icv07njgIQKLGWn9W8s0rNdLlrMaEnUq6i0pZcpohwAhqp1x9AT3OCc
Message-ID: <CABHf4aQC__rWLKUJ5XgkCEdzC0dr1TGH1WP=UxOu3JmmU9VjLw@mail.gmail.com>
Subject: [REGRESSION] Dell Latitude 7390 Intel UHD Graphics 620 display
 becomes extremely dim after kernel 7.x upgrade
To: regressions@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to report a possible kernel regression affecting the
internal display brightness on my Dell Latitude 7390.

After upgrading from Linux kernel 6.14.x to Linux kernel 7.x, the
internal display becomes extremely dim immediately after boot.

Hardware:
Dell Latitude 7390
CPU: Intel Core i7-8650U
GPU: Intel UHD Graphics 620
Driver: i915

Working kernel:
6.14.0-29-generic

Problematic kernel:
7.x

The issue happens on Ubuntu 24.04.4 LTS and Linux Mint 22.2.

Booting back into kernel 6.14 restores normal brightness.

This appears to be a regression between kernel 6.14 and 7.x, possibly
related to Intel i915 backlight handling.

I can provide logs if needed.

Thank you.
