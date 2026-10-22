Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669749;
	b=3Q3SzvcYGNHkywIRCfQWSwBWcj1NwVS/vxj3dadaNvAMwmpl0FbRJW/gXiNrU5ZvWHLq
	 F8rSR1s1dkhdIC12r81QYlOOMjKja081wTYXfETVX8BLSYAjKwzG2yePHcXtGc/gyP+Ql
	 0vFph79yRuFAHEeU6bzJ3DgK44qlxxk5FPyTeLFzfO3CdwTjsWXQLJDFRVzQrQnT4PWMe
	 6cY/5nUpnqDK4AOY5uUsUBWLKxrvHLujowtsNZCKb+p2NTTJwXCqeMxAncRNNTzWUuh+U
	 05C8y/5vf1WnruDHw5qqKn37DQFrFjNXAOKGUupfKYGw5ljjx4BjfmzI1p74IbK69FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669749;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D3pqen6XtofwE5K6hZVB/4ljEI0gtaGv/M0XzvrbPe4=;
	b=115cbgXW6HvbqZyPwZwXf7IJJJoUUyVhAMMnNuEXWtizUowqoBLMt0X6QBMFRAnXD2t/
	 tmUXCWozrX8eH4BWDFpHp9F1IJyvVOAKowaAbYFlXyjn6akeunffFSn02q94dzO8RK0Qv
	 Eg5GHRURUVLdZ0TzEpWikK6m9Xzz+tToWUJIOOC8depFzIDDoTUrJ40zdLtsRXkAbed3i
	 nmWdpkQiUHjq5AP8fxt3L3UPjDkJnZZlkgfPbLO44oNzkRmANWC2wrBzA48w0ZCnvdOt+
	 zSw7jI13ogHCV8vjw2E5Zh9zxlNhP0DcHXED2JgepUE3fqLIXO/qsULxtw41fOAA5JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QRSMXNLL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EBC606A31F
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 11:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QRSMXNLL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBA91F000C4
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 11:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792669748;
	bh=D3pqen6XtofwE5K6hZVB/4ljEI0gtaGv/M0XzvrbPe4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QRSMXNLLnqYfwvBj9SRe2RkGdQJc0AEECJGc/6lDCWM37e76OouJ6wmRbHY5XctRS
	 sh7DORNxi7DmMdlrIpcSg8Sn6mdUngCAN3/xwFgIuNC6CvLxgSH/7AkIBPzPUHc5u3
	 ihDE+W69NfqLGL1vOA3a1bHtP2GnHQInQM9KvLINPbau+FdFmIIS2pgIZvL4CZvuTs
	 wERe1WYxSiICjDX6JtXFOWsMLXKSl5GzHF4DMAhl0Pjh74S1wLYprUyhEpph0CVsQN
	 zA/sCIWa98tXlPBUJ9rfdd75yBodUhE0d+7P3/WGJLDrepdSkWjDPHiwZlOLgqN0Jn
	 BWrXiL7XTBK0Q==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c3fd91337baso252505766b.3
        for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 04:49:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz2MbSTMTd9lSOhSl1y39mU7OmFUjHhkTpui4X8QKE//unjS7y9/gg/CpSufeFnSKOyEkqkRupMZUsl1w==@lists.linux.dev
X-Gm-Message-State: AFq9FYITnOETvyVs/T7ceig05pPQ6VjAoTenk4ANfh8rCw+kVHSv+LFd
	R7nGi/nCOOAkFsxDT2oS44cRpfUv7a7b13ozAlRXYPXwY8TI/VqrQZ9G5a05baa1C3Fs2xm6sIc
	yOUA13hUQzDcARRwjewm+g/m59BtrAhc=
X-Received: by 2002:a17:907:6d12:b0:c31:8984:7fad with SMTP id
 a640c23a62f3a-c4679611ee4mr506777366b.15.1792669746875; Thu, 22 Oct 2026
 04:49:06 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021115400.30885-1-mike.michalo@gmail.com> <CAO+rqLj5rF8MGMTRSav1n43NqLbazwyuPsPKgiQT2qtP+EDxeQ@mail.gmail.com>
In-Reply-To: <CAO+rqLj5rF8MGMTRSav1n43NqLbazwyuPsPKgiQT2qtP+EDxeQ@mail.gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 22 Oct 2026 20:48:51 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-D=8fK8rT0aCrpPEe7ezQ7Q6qdOiAy_tSp6Yy0z4T8cQ@mail.gmail.com>
X-Gm-Features: AclHuK94t22vzU3h4aqXcwOpvZpOlnnNQW9zL_24PA0tOKWccvisgbBgdOZ6eMg
Message-ID: <CAKYAXd-D=8fK8rT0aCrpPEe7ezQ7Q6qdOiAy_tSp6Yy0z4T8cQ@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: restore Kerberos logins with released ksmbd-tools
To: mixalhs <mike.michalo@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:14=E2=80=AFPM mixalhs <mike.michalo@gmail.com> w=
rote:
>
> The ksmbd-tools side is up as
> https://github.com/cifsd-team/ksmbd-tools/pull/347
Okay, I will apply this.
Thanks!
>
> Michalis
