Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C572FFDFC
	for <regressions@lists.linux.dev>; Wed, 12 Aug 2026 07:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519431; cv=pass; b=XRgtjzkzj+Vw3eP44tSQtENjbW1lef7G4DQOew4HWqd5Z+b2sd9i/l328jjiKN8srekoV66/LTDiPyX2XNgTJqzJp3l/e4pZXWdenYHdc7g0IO0vQZI+dBS6ZsGxu4YN1ksvPiXgCdRQ0G7wpkc8YpOkfzzr5xUz/6/lex2QbVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519431; c=relaxed/simple;
	bh=lPE2CLxAbZbntiAzIEzsCiAb8fZRvxGUGyest/89SrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKSDLG/YmDN52Mf+BWK3EySdiX8iw1OTmi5O5bj8e28fQVR1LZk1iKkddnuzOWmhUmCbh752bBI+2amn2i6YkMZVNmmWPnfhdAiRr73ZAS2mCHU14cGowRZW/dI+fgzrea4PkRds22mziRs5h84KhaevmBd8WNXtiPu0EVvWX2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UStUYuhw; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UStUYuhw"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7eb61bbeb25so583446a34.1
        for <regressions@lists.linux.dev>; Wed, 12 Aug 2026 00:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786519429; cv=none;
        d=google.com; s=arc-20260327;
        b=mLF5OThCUI0fOACrF8/sCtZrYh7PU9yRF6OcD4DaIAcbouuRZnp/u0PgiOOnsNeJQG
         9t2C+zT5kyQkGn+AGTGF/fhO8kPSPZrLKvr0LjNWQc+eLmZ8BQXWZu7LOQ9NDgxK5dJS
         JRnG4Z6J2L9eRzHwaxvGV0r/38JT1y6s1M+5c7Hc02e8o39855Wb8pwIy05PT6PAJz4E
         +3tXlC4z5DTHy68lljU553dL0q93C++htDNs/Ir6jW1O1AEGJkwMh4lHc48soVs1yQAa
         g6yMmPM0mX4FrVfrSz+XDnw2mZJN11PhAEZcMR27wQcYhjJyvRlc8M1wqsPJkRrCJsgx
         bgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lPE2CLxAbZbntiAzIEzsCiAb8fZRvxGUGyest/89SrU=;
        fh=FFpPSLVu3mz5Rc946f7j5JLly+o59+NerHxnq6GWl9U=;
        b=dgwkh6ORDQYQBQW29yJTPudV489Wk6Jfa6lQzHIOKL22tv5M5FYQmq6vwwxQRg4HeW
         Aw6jCvEDH/eKOkbNG1y+LGhT2kgMukfD+FXrrHfxs3eUHCFLbJCObY3QacEXNVAHUCPG
         9x6QRGJbbM440y/wm72abPfFOIwOM5FGkE2V4Qnhut96TLAY8afE65S0UHqI6ZGmecdn
         3c5VBsBbqAg5gA89aZZ0XSB4A5BOuYO/AQ3UPiDjU3suTqn2c60d3Bq0o757IC8ZKE4s
         urMaM8PTVh2N+w+jAf8+od7eNHof+YKaigrJelnVZPdKXvdG7lTvxnz296N65BdQaJx1
         Jgsg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786519429; x=1787124229; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lPE2CLxAbZbntiAzIEzsCiAb8fZRvxGUGyest/89SrU=;
        b=UStUYuhwVjqyIVU6Vv9pI6KhcyyKZjWgwD2qnBMyrSvtaig8Hk+v15YeM1KKWcbqzF
         7jRpY/2fSH/haPkp/y3B/t/OfyllBDWrK/SPqazgUQSHVXZYETI/gkwkyTFkbzIUhIsO
         0RqSPtE1NBzxoye/mPoWWMH6W/ZOSd3Z8TLqj3CssF0xJ2J0EPnhrbowMObATnQWiFcQ
         PbNnI4GcVe0aalMsoyjdrXxy6TRGvPKYYbpJy6uPxbBPlmXI95vhuuYprYG6YfFMcGJh
         J6oP2GtDSi4SbUIvYYWG70hexMtspPwDl6UX/epSBeuT++9IxkwFDZjaUJrBrjnCJb0W
         lRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786519429; x=1787124229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lPE2CLxAbZbntiAzIEzsCiAb8fZRvxGUGyest/89SrU=;
        b=tVpWSbzRqu/oQC19xj8Xe4uqW7vytapV+0zRc96RSoTsbL1lAiPWMdZiSlbhfi9cgr
         Pk/jI+5eUaGXepsgH/RsyApQbs492pumL3YgFssD6c8+x/+N376WPyae2pbcqweh9H+Q
         Vd6cSlQpWIUkkhCr1JrVUcRxHpCTpV2TD24WNu4xVdL+fjPC3qgcd/ReyibrBfav6gds
         TM1avz3A2DdmalLiuIAz21SUZ6lQ5vLAa4t7RBeHpGC0ZLiEmGLz7Vvt6d3XdstHv4Ki
         NC/te0sBYkNjYJH00cF38yep13aA0GCwKhA/wMFGqksMHGFU4nzTr76Y235ujQtrwVUc
         yVaA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9Hb70fsrp6/y3AujvhBSy8gNSw3hCNsU6BKJt+dDVV8GmHU9G9dr+G+IExW09yx+P8nxRCF8qwpnUoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2eG6XatorkTy3VWZJd1TZZRhJjVV0/KXHXyb50okrfSUkq68c
	AzNnb7/LB66I1kwpy/0I7g4oC8zoPWAVEIPro+8TxORAk27wFj4ML4LD83PuKE/RFZywmRYQ276
	DAccsAsIPaSCbqx+0NgLYayAq2e8rdic=
X-Gm-Gg: AR+sD11dyDYF9CyufFy/scKpaS4xKdkpGxfvj2/BFBJ2G1eLPioe9piC4jtfW3JTA/2
	LASOz9loG/KiReWeBdqu82i0tpOWxtL4J+SOh2jnvNgsyfcY1Fqr+X/hSyB820/jq6n5mNJNd9l
	HqL/vCRuGwp/XqJw6QqcwLVZUEUUnWrhnljtczCMar+BiZMQcDW1SMvpMhc6HjOd1qdB+q2CMrU
	UpLXQ/ldvgOS731gHx546JCRhnZFLf56272OGK25sgONgnstx55i6CgnQm/3d0dfbXZuhL+jPls
	wUWvXoM0+MQhVmwYsv8tm4PxiL2gDg84j0u16ANYvhhw0ToadKfkn4KjTStzjKuiT5SNv1GWjRJ
	QJlqGdvyXU193PNbjf4p1dEjEojH/JyUGfGy6
X-Received: by 2002:a05:6830:6a99:b0:7e9:d4b5:8004 with SMTP id
 46e09a7af769-7f3b7703ea6mr3313972a34.5.1786519428838; Wed, 12 Aug 2026
 00:23:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804120004.523934-1-mikhail.v.gavrilov@gmail.com>
 <18b018d0-7f7d-4975-b0b3-5e3c9f413698@leemhuis.info> <CABXGCsMhfR-fOwUgKuQrojM8jEpdco_m9aYA9ph_EOrCfaPxeA@mail.gmail.com>
 <b308aff2-422b-4ac1-84d8-f066aa17f5fe@green-communications.fr>
In-Reply-To: <b308aff2-422b-4ac1-84d8-f066aa17f5fe@green-communications.fr>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 12 Aug 2026 12:23:37 +0500
X-Gm-Features: AUfX_mxZLwD3AKWIfDqBi4-P_dTiG6Fu-Md1DdgkQNdMk5RKTm8G9CoEhj7fBUk
Message-ID: <CABXGCsNYLoE8OSxEbbYJPV34H=8s1QzLjvc2pjQSwiK2VjHdfA@mail.gmail.com>
Subject: Re: [PATCH wireless] Revert "wifi: mt76: Disable napi when removing device"
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, linux-wireless@vger.kernel.org, 
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Bert Karwatzki <spasswolf@web.de>, Devin Wittmayer <lucid_duck@justthetip.ca>, 
	Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 12:13=E2=80=AFPM Nicolas Cavallari
<nicolas.cavallari@green-communications.fr> wrote:
>
> Depending on the patchwork configuration, you might be able to change
> the status of your own patch if you register an account. I'm not sure if
> patchwork.kernel.org allows it, through.

Marked it Superseded, thanks - patchwork.kernel.org does let the
submitter change state on their own patches.

--=20
Thanks,
Mikhail Gavrilov.
