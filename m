Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAD9353A85
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787480826; cv=none; b=VAoHGo7kJYRGhgj2Remmk8NsRRhyaEwEC5WX1kIW0mL+U0+1DFzdE0RpCDMEfkpdufA8+DoA/DLhNe3bC9BKqgeNj1gP2Y6QXZT5jdJcApAE+9wGl7yXW+T+28zqBd8fbb/pWDvob6CPuKvzH2dGS/ETqUIbmN9uYLDAREv4IGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787480826; c=relaxed/simple;
	bh=XQdx5W/KCcgN6coDvdZhtNK+7RP0BBrtIDdFFiVYw7I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Q9v0KbeO0f3p2dYIJPIMTKz7Cv0g+/2ci4yFv1oqHLhzDackDunXb821WRTO88OvIt7EbwenrkVDxlcoSkfzv9vnUvYuaSV9uzkRRKrWk4miNujM7PVXNmBNKMaydcMteg3IUgaeqPZaSUlHSgkiN2PR5CdPSgGcc987xsNhf/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQtvg3tn; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQtvg3tn"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c197e7e4e94so447302566b.2
        for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 03:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787480823; x=1788085623; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XQdx5W/KCcgN6coDvdZhtNK+7RP0BBrtIDdFFiVYw7I=;
        b=pQtvg3tn55FNLUrMC1dgbgnH+A4LROi0Q0MYEvLxhGer+2/TZL0vBnprfBdKUD5cKH
         0TTft0Cgl3wTBncvP+mRW6nln5LsKRuzQD3ebs2F37mxc4Jgo5Frkg+rVM2Xx3ckSrQi
         yMmwhfapfurkhFR/To6Z41XeQeoIJLS0jJFiDwwpF8ghPdfyvJhO9FfiSehGVV3bexCC
         7W4+qZm1USi26OtTAIzAoKeWfP63FeuGC6ZahZT7EDfjuVUKQr2I0naw/PvilqMt4FXw
         hMGbfkJmCdfu0pN6z7E9nxGu3CgSS0b3DGSEoXRqx6kmkskRLLR1A6qgMDV3YIsIrd13
         /mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787480823; x=1788085623;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQdx5W/KCcgN6coDvdZhtNK+7RP0BBrtIDdFFiVYw7I=;
        b=JWHIXKc3re7++Z4lTt3GzUdqPeTYHO99Eff9ERhN+R84FvWwxLakcu/wC8yKhz0who
         GFR5RptgMsZ/R3IHRiJjfww3xotP8tXS/RnxbAqdt5wzVMtw+dFW7pQvht8EoBidzdu7
         yxniPHfCQHybWGWM4aAQDe1h3fngNXsJsJ2l+28xuoRX5tA54bVtXcIg2+Y94h07te/j
         UnAzd68q73zY6jtm5wZbU5bmvO2z6LiUeqau9SgDrQAXGk61ZJiEGTSjwu7N/UZPaiZU
         0/U/FZ8O0QukqS860/562UM0cEFVqnVYKfwEb/WA8FIYXw+gpUbKdeTWZtF4gV7mqDPB
         TKlA==
X-Forwarded-Encrypted: i=1; AHgh+RoQBAcYSaDHofocJmKsVasZcyR5ZhsSEtn+3rQBKZ1rgK8mhB5q6csCJkEe8eUmfAKj5MuHdbOOdGggZA==@lists.linux.dev
X-Gm-Message-State: AFuF++kNIrbn6+MF6yTPbA3Cnt5lBe/qTlhJn/dfOFxgLeFF8j7qSXrr
	xtadNojLTy4kSmW0/IQ+FMJM1/3WpYxuHZXfK7COP1ZFje4ensJx8/ZS
X-Gm-Gg: AR+sD10Wfa7wcjgE1z/4F2Z1ZdVEfq8mjtX4HdDudOt4ZKUnUNh4hR0wPsIPDINwUsi
	Mr0dlI3v/uTXAu904kDcDS6nrhQxRKdFUUXymeYfUFV8tqFHz+2ffxkCSDckiVgP3UFSCgwDmoU
	li5KDEr8ThVlHmIDj3m9gtJ4IBZUXCohscft37WySGTMXyB0gWuGwiVP65k3SlaksE7NP/wFMHx
	vXBB7C/DeZxcuYi93U1It1v8/0a4iyNzgi7o4UahKyjR5xRQUgBlEmrTU5CPZPo1MwcHrods5dL
	UxoRnMEPk7JgkDVrUVHguqQLFmHDtD6MlxEzeF9x8NPQoxWyaTf6fbfpmVJTnolG1QvRhfpWJux
	zULMJ7yhdNold3BjAV4IjfxHGxpUxjpx7JvcEVgF9hokXGmf3t1gg86hnWb28fBYPGOcdcVnR6J
	y/nXi7v6TOMEvZkMvjcbSywAjRz1YQ6pMQRGlGFB/NG8lgrTjIAw9EgiQf+0g3Gh543wQDIWQnz
	R2tzOQuwX5VkNwcLk8yFnLoDAyOHYB5z/Gq7TMOEYx/Jgnq1dtCDayUy2Aq4pq8Yk1Ofk2DmqSh
	Qk9Se0w6u0egAg==
X-Received: by 2002:a17:906:9f8e:b0:c12:6d25:2c7a with SMTP id a640c23a62f3a-c2492621d0fmr1178244766b.17.1787480823260;
        Sun, 23 Aug 2026 03:27:03 -0700 (PDT)
Received: from localhost (d163-170.icpnet.pl. [109.173.163.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm730670466b.17.2026.08.23.03.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 03:27:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Aug 2026 12:27:01 +0200
Message-Id: <DKW92HEH75C6.24ZHHWR1XJ46C@gmail.com>
Subject: Re: [RFC PATCH 0/2] Bluetooth: detect broken extended scan instead
 of guessing by chip id
From: "Kamil Serwus" <kserwus@gmail.com>
To: "Thorsten Leemhuis" <regressions@leemhuis.info>, "Kamil Serwus"
 <kserwus@gmail.com>, <linux-bluetooth@vger.kernel.org>
Cc: "Alexej Sidorenko" <alexej@sidorenko.cz>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "Marcel Holtmann" <marcel@holtmann.org>,
 <regressions@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260822141115.58815-1-kserwus@gmail.com>
 <68dc7fba-ddda-4505-bdaf-4bb7af2df44e@leemhuis.info>
In-Reply-To: <68dc7fba-ddda-4505-bdaf-4bb7af2df44e@leemhuis.info>

Hi Thorsten,

> Would you maybe be willing to submit a revert?

Yes, sending it now with Cc: stable so it can reach 7.1.y and 6.18.y.

It does put Alexej's dongle (0bda:a728) back to logging repeated -EBUSY
on extended scan - noisy, but usable, unlike the current state on mine.
The RFC series stays on the list for the proper fix; Alexej, testing it
would still be welcome.

Kamil
