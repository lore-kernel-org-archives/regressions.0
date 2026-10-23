Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792777242;
	b=FyS6sn0pyfvT5aIVZTMUTkZrktTXBMnsUbRB8Wxucn4Oa9XtrqXgpWvCUDXIocaLm9md
	 3V2Rj4NgvipHyQzwBjg1mWhTdJeVmvaLFukND4/x/w8ZAPGSt9xHOS2Sk6cqL7lC2+HSG
	 q4D9ImVWY8HizV/6+a17TgIs4d5FWPnHnqSU0rkBd5Xwy3FXC/zPxX0rAW+QPzMDIaike
	 2I0jBvBQMqpKlIzcYXpXKQQONJ9ErKKleFSCiskHqgBHg/+CYxnP5H0s9yXtZXqVvYbfI
	 7WUvQBkItmi10wpWUdAZDqAe90i3J9BAKtRpCHzR4SX/bNLpPF2mot+QGxBbnTMkYmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FLYRLZKufzwkxxql5ZnFYPULE40YlPDTbaeTn0JxKhA=;
	b=VAqTXau/cX7awGa28XlLyzQlY4hI4PU+z/QP8WtmJsBRHazHIgSWSbsmrp9FKclNLz0S
	 /CjODuaxjVLUbUMRGQ0V+oKrl+4TTtdmvF+tzk51q7Jrn3ngoWT4yFXvJoufZEXST3BTe
	 7OQ5ebEXfkUSuTXGIOfN6OohjdGBRTqi9HSuG6UHKi43SiqwKnZMsJAEmYhHUduRBgvz8
	 mMwPzOg0/xYNNkWQT6HUuf8hVowfQ9r4lUZYFHeqoL+FAUp9VzGkoCqeygutDV0w+tm8X
	 SapJsYUz/xm7cknfFPGtiGaFjYq3v83TYDiLgrj9/b7kH4RM6YwUCk3HDlhhAiB2ENA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A2rNvtjX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AA3606A323
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 17:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0AA3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A2rNvtjX
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so7268921fa.1
        for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 10:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792777240; cv=none;
        d=google.com; s=arc-20260327;
        b=QrAcCs/eRVTVla2gzodoecb8cpHyn4nlVh7dH5bB9uhyHz7q2x8XO6lko0aWk8Vobp
         zBEdXtidcMcDX/az+2KD6V1UdC8XfI6s0gEyNNla1xjj5YZYbb7xeqD8pB16jeReWX70
         wDg/mULMOUNIZm6F8X2MZY+jUC9CA8KSSA5EiMclpXtwRa8BoAT1bqZQRKgsXY9cM/X3
         r8sgCLiwA0UP9aVz7c20pmwJJnX+5NyQQP9w0Ji8whuJ1Rz0+g8d3AZ3ReIQQz5Kf1oQ
         0rwT4ZZvNOeaAEXEpIR7+KM0VveqHqjxbGbfVdqSLVZBaRbN7V2hj3pB4M+63Wudl6kH
         X0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FLYRLZKufzwkxxql5ZnFYPULE40YlPDTbaeTn0JxKhA=;
        fh=jPDOJI+ZeJzsWprAYYF/DQtr7RaCmXISDa5AV8ifChk=;
        b=La/FJLuA7KiinNZvGmEBxcCZuxR7VjAnTkXrFPg60o15pjpvLqEeIYKmk2OiXso/Y0
         6n7Ohl9Blrh+yPGe/hd1sXlS0IVftGc1QUip3tLZyEL8RorL0wP9SxT/1uyKkBIzWnsJ
         8gGsxLt1qITEPKnuXc6SLs0uUb4AjanWtfbtPd2iIxOL/dZHwVBSRvr8Exh7i5Qyo5Ei
         b/KMZ4TxQcnaweviMozpPeP7ZntpG9vPkdw+ve7CcrckEbmK3LPASuamFAtiiiBRCrqn
         kCaRF14fe3Z6genna1HN71AAswx0VNyGdVQD4lqPUhMKJp3LeJhMOHmKFK2dF3PkiKih
         AWVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792777240; x=1793382040; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FLYRLZKufzwkxxql5ZnFYPULE40YlPDTbaeTn0JxKhA=;
        b=A2rNvtjXW+DPSkMrjY5eqfrWD5bqsKQ4TLxt6HvltWUSBjpcC0uWnhyn+LLgNIG5mo
         qWz1MapAQRj2h8X52DQSXyFK3wQmkUkPGiLx4amisdDWcuU1P9/kEh5P/90ljnFId2DI
         rvh2B2WfzlfADjRJKKG8FYu/Tnc8s/4lihIhpWQmmli9ZsWnfQWKWigxhRJlQ8D3y2H0
         bVye29twB+v/mskDsk3ZRvea/ogAGTnUKnY5FL/YEurciBdwpm/pIt2Jmc8Gy8KHuTYW
         087EEwQWKQDFrgoIxlybhoctq/Ah4AI9b+3PNZ82hIDozrWzQoarmIwMZIgUmJJNjEzA
         A4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777240; x=1793382040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLYRLZKufzwkxxql5ZnFYPULE40YlPDTbaeTn0JxKhA=;
        b=UTfqj8/UU+ELsGJ05ldyhpie2f0AGAkFqo+E0bHgyErBaotDRn4l/RXG5K8pRPi3/n
         d4wXUy+oLeHJ3FJI6tFg7eyFQWLd3eTNe9OebuJK0zfCfbp8rKnHHkL5Nw7WT6qfo0Sr
         NotU3IzQR+yZGh4z20xnlJAiZBE6vlXNRPXNAbvORrmmCo5TMp4ix8nwAaVZfrEMB7en
         A4Nucs0eBNK2EJeYCcrJiU611GnDwakdjDOs1yUgUyhrmF7TbO5cRjRYxeBpXyMdUby6
         O7pRuV22Q1sCms0mz+Rs9kZK/rS0xtWqtW0y/CiHAHBVI6j8q66LpZGETA7Uwq/zm3E8
         dmeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvPzOLH4P1qd2PMHkoe12Fl9VMO8hu9pKkLdw18t5dhEOro3Xi8G7IwoNDHKV6duggAfqQ9owesrTNRA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLjFR+53Ls0iaGZhgjr0QquCpcwtFHJc4FcQrgs1/HgBINoFzB9
	GKU6vTRJrBfx5K2EvEurDf9m2blL/BJE1bvvxQacmZrJG+tXrpPAjDsJCMM6LPwMxiSV6EI46+5
	DReX1nwT6XNM2a20ZcjOaFACqSu3/qpk=
X-Gm-Gg: AYBFou3CrMeEHEx+Y+Lfe+1QEti3mTBKE4o5wnC4y0Bfwm6Q8jEpOry2RXGQrTJcv4k
	EfADcf2CECwUDkY899GY/tBQHSj0jsgs7rm9gmLZPrXMHLTWULVf4azdvc+ygLLznojAqMoed/A
	uj14wSLJu0m7U2CZJL82Dq3IX+Tx6caHyOwA928iWrmLv4QkLN4Ads8IervOJ5sl/1B4G/DpXxd
	y/ZnLVzt0y1ZiEABmkeKkJ3kgcd/A17aVZqWhR4iH6lnAxSOgGy9YhTOuuiRP68PQq2ZouUIHiM
	qqJOqmrZbOUi+J2j4A5gfHpvDH8WSg7FN19wjX2eub5JxlWgIxDRHwz+HUj8iTGFVzDuaNWUQIk
	hrI6qeDLryL1c+/VNQxu31aGTZ1XF8yADeT/B8nIo62vOaGZE7ubFuDC7hchT6IAdd2CdzSg/
X-Received: by 2002:a05:651c:a322:b0:3ab:4814:6129 with SMTP id
 38308e7fff4ca-3ac6fd1e249mr153411fa.18.1792777239960; Fri, 23 Oct 2026
 10:40:39 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAAzpgGfrHpQZQ8iaH5fqZHzk5tTx39+jGvGkVXxhYFkp-A_bQg@mail.gmail.com>
In-Reply-To: <CAAzpgGfrHpQZQ8iaH5fqZHzk5tTx39+jGvGkVXxhYFkp-A_bQg@mail.gmail.com>
From: =?UTF-8?B?TG/Dr2MgS0FTU0VM?= <loic.kassel@gmail.com>
Date: Fri, 23 Oct 2026 19:40:27 +0200
X-Gm-Features: AclHuK_FiLbhnIm98d_qlqiFw3snCFR2PzcRfrqgURbeufGtsH9VJyRHETTgFU4
Message-ID: <CAAzpgGeAaOjPdiVOmeY7xZqEymyh4BfhESwAvTzczvqj+YuNHw@mail.gmail.com>
Subject: Re: [REGRESSION] mac80211_hwsim: CCMP frames dropped on fast-xmit
 (WARNING in ccmp_encrypt_skb, net/mac80211/wpa.c:462)
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Sai Pratyusha Magam <sai.magam@oss.qualcomm.com>, Rohan Dutta <quic_drohan@quicinc.com>, 
	linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

A small update on this report: commit 6832075ed4ef ("wifi:
mac80211_hwsim: reserve headroom for software encryption") is now in
mainline. It touches the same check in ccmp_encrypt_skb(), so it might
fix this problem, at least partly. I'll test with 7.4-rc1 and report
back here.

Thanks,
Lo=C3=AFc Kassel
