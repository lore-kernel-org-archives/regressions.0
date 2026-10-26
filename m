Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793056375;
	b=eBBgvZcmTlH+AEp4pN57kaVPPTbZ5vItwzSPCN5C0YkgbWgSnNPXs+UjlEcF1f2DnDcZ
	 dtvSQ8MOCuKYyOtiGJnAie3gP9uzfHcvYvWtTOMYSscpU4p9q+N5dTRJLcTuSwDmrhv2+
	 btYcJvFGLSFUHK4IpPKI7TK2OsBjBIBJtkaf8Q68yWYmPWzdjgcDCwpRaYAhis2Q/mL1z
	 ZPF0j7vMRT1rjZ9kN1LlZ7is9dT3B4TBU81PAAoklzUDA6py6ArbE4+fwUgiObu0weNnl
	 YoJ13oARDMyVs/V57S2SkWzRtqKAT5ydUDNH/30E/0q3iP+fqz9O0a8Spw88qbq0czQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TLn7TVaVukXMVmZsUzU1TI29I6h9VPQT25Hl23f6vc8=;
	b=upXObZoSbFXqDqx9+L2N/HzVM1x65lqR7EWan7PYW7rRmVIdZF5QpECoFHEFgdMx6BG9
	 B1O6+pSwSkYHVSf4+YbTadsWaw++isHJl0sQHmOejo5OCqt4Kv+ejntyC9wu3vJDlB0gz
	 hDq5GON1WLa8wXp0lnTXvAe58BMvpF8mmi49jMaDHs8lsN5HqtmAyehruNyeg3slw0Ni6
	 vDqqOzJu23ZYNcZqeTCmFjc+ZJj6EJPC0T6xfc7DvT/uoM5GpUxie4rnHzpA8/jSynANw
	 y9MClONjWa3AKAtaq5x6akkb5KhRVRtp0ITL1+rJGL4Phq1lbA7zZgwLL1+9Jns00CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k1tkj2zM;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B54606A31F
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 23:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4B54606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k1tkj2zM
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso35998235e9.3
        for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 16:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793056373; x=1793661173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLn7TVaVukXMVmZsUzU1TI29I6h9VPQT25Hl23f6vc8=;
        b=k1tkj2zMMPkpzeDWr7N2YjC4ubp9rWhKAFeg5891KotfpoLO4hAsJkMcZYB/5Dfyq0
         fjqLDIqLDn9EcVd2SrFuQPtw1Ulj/11Rj600zziIkdSubRVwzgcZg2d/FSU8zK5us2/9
         7AP62858RxX8zWF5uMPZCDbPDD/ZV9zQHy+l7UUcVdIVih0ydbA72HECJ120NRfPH+uY
         7MhjnBZgkXx2N+/RiU6YF1yS3BNMp+ZzMO33JYlwWUZCQgI0B8eYWugbmnL2K45zZVHV
         6roTwBSBz3/2QIwBhN1lZgRFJ0p20rlxalAXsQd0TbynmvcspjICtmAAFdeCrl3Gu1RM
         KKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793056373; x=1793661173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TLn7TVaVukXMVmZsUzU1TI29I6h9VPQT25Hl23f6vc8=;
        b=097Xx7zbWayrvtid/KJ2fQQkXZmbqcykXhTzFlLqF+c3dNaX12nYwzJZDi6mDdxmKI
         UMPoc/JWiIcsC8PP1/0Jwl7tHBOeE6zqMF3ut6ZuE+LObYA9d62jjDuQPNpmneRiVMYV
         LB1eGzo3hBlebxoL6wH4GoxNtSiU7ZzibvmkuyOyd/bqHeGJtVTlk14mDuBfU404Tx8X
         4q4+Jw/75dqGi6cUcxEUt23eseZLJfVq1kXRlThPjJnKkXUY5naKhKp+W+/uNjFkxiQ1
         JlUicL/n/DBP6w7MjzpB5msFYZGRkUmRvr8oSd3pJah+4gQlLfDsKOzmAKz/7Wdvc438
         TcOw==
X-Forwarded-Encrypted: i=1; AKwUvBxpTZ/sMvyxZ+bRkDvR2PQWUiX0pQmFn/0Ds2J2vy69sQapWAaIY0wN7AE85HXXBAixgm2n0AyOFmAquA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLGzE8Oa/c2u5VadnNCh0qmDOCKt6zS5+JZqL4owLkkKGzG72Td
	lpVnQiY3l7obfBgERGftH1n1pnZ8jPW3yU6W5Uke9my3nOYV4CD/cFjp
X-Gm-Gg: AYBFou34ZAekEkYspWfHzAtJgznuAqh1bTsJ/mZGBwwI2SdAQdQ+d60sZL05494dxnD
	rMVagwtIQ4vN7Y1psAAJ9PCkTq4Lfj75wpCorfo07As2nYWZE1Heq9arIBz1Kbi4kIy2EKOATbY
	D5/ktW6u2ntK2reCn9lOglOxZA+NZvUiBdjxucv7lT7ez6YMD31aYL8nYya8CFhaEKGMs2SYT+B
	Sh+V11UXXZD4COinfBAFc+SOnB+IR+2VBOz44lOJ1cqn3d9w+A30im/D8j+6RYPVy/dCwxx41vb
	jqW/TBqwVG/xjGi8CqeczADboYF9cHXMQvplYmNmUgErkdqIx9AXA8quWyt072SCCcV45Nme9ut
	JPx1xI7//8y+m8LSkImEGg5wpYlCDMzlniXlvbFSMdo8uFjVR8gskZvP8tKofVGTde4tkTWz9R5
	CZIFMIDI1LwJyFkmATqicNPqgpvxGliDgy1ojsA9dKbvUSg2aXhhu3yQxHeekkD2qqAvfvVF281
	2kkuYqHvY18+e2pyuHTNyhcClLdq3H3cnx8wxHl/Ka7pQuhZepJjMW0lsLudOIMzP1IbcQz0+A8
	sWABB1YdI5QvVrXAZELwNheHDhutx6TL344TiN1Bv0jFx/0ic4kjgn8YNcX+Uw==
X-Received: by 2002:a05:600c:840e:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a35acafc84mr143906785e9.10.1793056373131;
        Mon, 26 Oct 2026 16:12:53 -0700 (PDT)
Received: from iamyoubutArch.adf.bham.ac.uk (smal-20-b2-v4wan-173097-cust1152.vm20.cable.virginm.net. [77.97.36.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a574088sm212047515e9.9.2026.10.26.16.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:12:52 -0700 (PDT)
From: Filippo Falezza <effeffe99@gmail.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: Filippo Falezza <effeffe99@gmail.com>,
	mani@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: qrtr: announce local services again once our HELLO is sent
Date: Mon, 26 Oct 2026 23:12:36 +0000
Message-ID: <20261026231243.68801-1-effeffe99@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022163116.1042-1-26rote@gmail.com>
References: <20261022163116.1042-1-26rote@gmail.com>
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

Hello Joonhoe,

I ran into the same problem on a Motorola Moto G 5G Plus (SM7250),
which I'm bringing up on linux-next (next-20261021). Since the HELLO
gate went in, the name service's first announcement to the modem fails
with -EAGAIN on every boot, and so far I had been carrying a local
retry loop in ns.c to get rmtfs announced to it.

I dropped that loop, applied your v2 instead, and booted the phone
seven times in a row. The modem came up and registered on the network
on every boot, with rmtfs serving it, and the phone never reset.
"failed to announce new service" still shows up once for a remote
whose HELLO arrives before ours (one boot logged it for both the ADSP
and the modem, others once or not at all), and the modem carries on
normally afterwards, which matches the replay doing its job.

One thing I couldn't cover is a modem restart: on this phone it
resets the whole SoC with or without your patch, so that's a separate
problem here and says nothing about the patch.

I did the testing with the help of an AI coding assistant (Claude Code);
the results above are from the phone.

Tested-by: Filippo Falezza <effeffe99@gmail.com> # Motorola Moto G 5G Plus nairo (SM7250)

Thanks,
Filippo
