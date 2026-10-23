Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757800;
	b=HOphKx0yoqJN1JpGoIWzv+n6kzvW7l7p232syizdcXrsOoJ5PlVDJ0Urgxb8BhvlgVIl
	 z4rrO3rejLU8DfdQ5HuDpnlJU0XnbRn35jTob0qnf4ZjvFxd+0s7yOdt/t0bsnqq5aawD
	 83rQGxGF4YCQ7r4QXV/laMMH4tHkBoXNb8aAKAi0BL2Cno1E5+P33MHIm4VFLxhkpEf+K
	 PGvjkCNZgL5oYhnwyVwv8PrSWS7p+2vzkGS+uR2FnH3yS9fVdmftC+eII2edyipbEBzsi
	 yybqxSisfEuKt0cyd74jZHhST2u4JkkIvoE9k6SR/IzlcqLL+fF9sfspYVTDTxkCNvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pH7C+Ic+skXIiL+8yDLrJvoIJ/Xi8EZtJUFQlV0QBE0=;
	b=p3ACAwFg5X7dqhF/QqXpVzTecKuiXFRmAQ1OgDDBqzc++nKH5CVhc+MK3PWUopURafiG
	 Iv9YRHDUj9Nw+ZqL3qHhOEaXCncwBpR+I0iBfXH2QTb3DlWX6Lg9oOdn8FrCf89X9fy9v
	 aQrSTjXQaa+vTkH+w/P2KozJ6GJc1EE2/vDqP7DzzjfybpAY6tqvmhfu+dO/GVz8CQPrD
	 v3jxJopRCDBMLLCGRaXyOx9Hn+JhT1gqmVRaXjmFwTG5NALLj76ydjymVXLLulZSsK/AD
	 ms/nfDvxNjHMjG1KvfzJ9fHd97gCF3BUd/f/oZCvCQW7nVKeQseDRaWDZ1PY+TVXW6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JzHjc2o8;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEACB606A31E
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 12:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEACB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JzHjc2o8
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c3fd91337baso110106266b.3
        for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 05:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792757798; x=1793362598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pH7C+Ic+skXIiL+8yDLrJvoIJ/Xi8EZtJUFQlV0QBE0=;
        b=JzHjc2o86WayNhImyukjY+So1Op99SqfPLviECqwUOO1K/3YRc2NnZ7T6RuTIwqtsL
         kSl6BatB3BTH8jde2Ku75M45ibrZAnyh3C9xnwJ9h4bd0Mqhp1Vy2zF/tvo4SfpIXnA4
         BgbgX0MVwE2RDRxWgeLCwWyzJJfhLi4zHdN1PeaQ+/B8JkZ9RV1T53tGaumBfrHcysS7
         Cr/VCWCPAo2zSSjyK8o4FF6Db/muGRXjJvu7BM1zz+xOTisGCKbdPShMpj5XK4ecp99j
         QkoviV1iwnutxPeT7Zge21GxHTFtgEG856Ej2oeidHpRCEzEdIy94mH5m8m8VkBlIezx
         fOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757798; x=1793362598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pH7C+Ic+skXIiL+8yDLrJvoIJ/Xi8EZtJUFQlV0QBE0=;
        b=e1lDDE6NgEsphJyL7lZShxBaI8VfjxMBsOkvxInNbjZP9LR5U+zL5lE67efs4SvJ4n
         Q5+5piXpJywbM5zO7Bv9k/v1bEeyrpUc7vErL2+CMUnFzS2eWL0P4rr4danuaElbSj4G
         Hc+2mw+XeYtnrikPLdR4efiEohsGx0pXPVNMl9/g213M+b9Z+7JzeGFEPNweg/XVyZk7
         q19rtBxo93aHWlUKvUtxvmq6LVkXhsW6vtVlGu/q1jhrXCO8l4W4v+lSIUCErcl6IZ5J
         9XD5FogHA3r1YKFe4WwoF6lykqafsRyU33LOL2M6ZWPQ5zABavw3BQvGMcAijoCOt8Ga
         Qgiw==
X-Forwarded-Encrypted: i=1; AKwUvByO037H8+N11lKYvM1WlLZzWYTbMiBZBufEyZuymK/EBgznCHLWRZRzYKh45tAjSXsE1QxvRM60H/JxKg==@lists.linux.dev
X-Gm-Message-State: AFq9FYK9RYi7c2Ihfo56cqDGESjd6J2ygGa07Kk+iodx/g697snWLeEM
	v1+uZ2pfYnMoGs7BPtR8RvwS92XxnD0peBJbmlJFJDnuGd5jI5JpeBoY
X-Gm-Gg: AYBFou31a4JYf4Ohil0ISybPa/cJXdppb+mDm50gr1lmx8aZ4FgQDY7E9X2kTsPg1T9
	cwsMeseSZDRGh1xtTxlr0M91F7sqbmFhyvPuw6lroFHCQ0m1nh4LzwW1ZuQmaOK+GcGGa8J6VLF
	zCOGE0vNgWcdS1IsdQZcepPNjZJ7yyC9XS9v0W5OFGNxf7NtA0EsnpT5GJHcHDGVwNDcq93pXcB
	BnQe6mc7dNQeuXckS3IT3U5wYdUvIFAMeVJBRGnUffFwoeUQsUz7llZPxMHuUeVjA2U3WCZbGkR
	kJ3yBk3CoSptydWMVrF2yzKYKcNF8sQDdt2cLQn1nLFwnsmWNl1SbNx5MupMFQ5v0Zuy+s4K68F
	3IFjfiKNIYNvWTZe62vvuCer91wtdzS2gRQCRCuD3HVDwC3bQziGqQDXdYJUP3dXZfvSJmg7z1H
	eUY/5zyo6IT3SjV+ctZ3s0s7kwj/w1y7MOOhwMHofneVch6cpfRbjEV/hlKJnzuBGGajC9KyS2d
	45UkG07qqHe1l6lF6X3YvpUopyZ7zL1/dQUWIp/QsZcufnhGQ==
X-Received: by 2002:a17:907:9309:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c46a92d5849mr287640866b.48.1792757797774;
        Fri, 23 Oct 2026 05:16:37 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:4f::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cf5540sm95824066b.78.2026.10.23.05.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:16:37 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Jinqian Yang <yangjinqian1@huawei.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Andrew Preece <apreece@meta.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] irqchip/gic-v3-its: Enable dynamic MSI-X allocation
Date: Fri, 23 Oct 2026 05:16:35 -0700
Message-ID: <20261023121635.2190639-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022193620.2152038-1-vlad.wing@gmail.com>
References: <20261022193620.2152038-1-vlad.wing@gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two updates on this report.

First, a correction: it is not specific to our debug config. Our
production config hits it as well, on every Grace + BCM57508 machine
we tried, at the same point in boot.

Second, the root cause is in bnxt_en, and this commit only exposes it.
When the channel count is raised, bnxt_check_rings() allocates the
extra MSI-X vectors before firmware has reserved them for the
function. On BCM57508, writes to MSI-X table entries beyond the
reserved IRQs don't stick, so the message written when the vectors
are activated is lost, and the entries stay zero after the
reservation.
x86 never notices because GENERIC_IRQ_RESERVATION_MODE makes the PCI
MSI domains MSI_FLAG_MUST_REACTIVATE and the message is written again
at request_irq() time. With this commit, arm64 GICv3 takes the same
dynamic path but writes the message only once, at allocation.

Instrumenting the driver showed it directly. After the channel count
went from 18 to 32, MSI-X entries 18-31 read back as all zero, while
the cached msi_msg and the ITS LPI mapping were correct. Exactly the
14 rings on those vectors lost their completions.

The fix is posted to netdev:

  https://lore.kernel.org/all/20261023121321.2127263-1-vlad.wing@gmail.com/

With it, the same machine runs cleanly through the channel change and
the ring resize. I don't think the ITS change needs to be reverted.

#regzbot monitor: https://lore.kernel.org/all/20261023121321.2127263-1-vlad.wing@gmail.com/

Thanks,
Vlad
