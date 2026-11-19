Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795087318;
	b=pWz1DT4t63QGVZT6qufMy29ZWHecSb9dySi/2FtIWYyS/TZoK6yCp82sFrYAe/A/ej4W
	 UJe16yPU/jweYhF+iTYRq+350Qs9s8k9EWRuSf+0tBZKn5im6FhF1OAlSFCs1XHwHRXb6
	 J7aQjG3seFnxPEF6UutSUoA/w+U/Fc23k7ZcSaexU1sgpoWLMAHg3eIAHWXMyKZZfF5j9
	 OQ0iPGYueIT9vt5bMVlZHOTMH60KbYKuR8drFJ0H3xT8wneA625MjwqsFU5VsgPLTYdVK
	 C+xg20xQLDndbO96AIxUSv96Vd0Ca80zX6jt1zdhKsCTBFcnwA2CvEmowX2eFnswPxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
	b=RKRH2PrX5iJnpyrlU/Mjnv9Y396l6lV+qdUMC/7mL9PP9RR13Rkv3wACq7bYdqibk4N5
	 2WyE/8FNNhjiFX+v+H4pjQok3fjfllS3tAWJ/tIeTSlO3HhPdR++/9hUvA2/rXi6YICNe
	 oDzWStIz7pd+AyaHaLRd4FXcYklO+I7QfyRcJ277fQ5sunYFmf7LQ3fgnBBohYIX+Xzoc
	 JSDb5rwtt502m8IicBXKuMMkbudlN8iAQpR4gGuJpnXKYU/sSbhugW143FuWUdsNzVptv
	 bbYY9bP+bK8phJAyGthZA7ztaR9Y5yD4QGqkFxsRXC7kB/1XlgfR+8xZtiWUTq9BsSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wetterwald.eu;
	spf=pass smtp.mailfrom=wetterwald.eu;
	dkim=pass header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=WJlQEzhW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EAA606A326
	for <regressions@lists.linux.dev>; Thu, 19 Nov 2026 11:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92EAA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=WJlQEzhW
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c1479a959aso1662472e87.2
        for <regressions@lists.linux.dev>; Thu, 19 Nov 2026 03:21:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795087315; cv=none;
        d=google.com; s=arc-20260327;
        b=otmEaTPwuIGpFmuPft6m79mUulyR1UjXQ6eJ700kZN9ybBjHa76EQE0skk7bPn8i+8
         APNFFMAv9R3+bIItkpFf5ueG6w3pQvF65Cs9WoV4xARDIt4zD8zIDMfd8Ah0hFRNfD7j
         jLixlvnygt0g7dIPg1OpMIvFd30cEhherdPDhy7MqzEphYHXLs0Afx6iKg47r6ummtXP
         blm4uyBPbW6YTiE+Vsqqx+3BcbbZyM7hbTnEMEe3vlLgxKb2noa3FSIT4G5512Rohk9n
         aFSxEIpBa66NQ5Qt/ITnYgOvA93aP7PP0nwj76jxo1TeZPlQt7/QuyCrEmzv/mJj7x2l
         TVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
        fh=zz1bPJSw7BIBamH1CVwRGHf3slKCtUjEozPMh9forwk=;
        b=Yv0KSALXT1jO8Ki3yRx6eAYhulFQxMJ0DE1ea7Udp9NCv0+ThsvkmRKH433/N5Hpap
         KyRfWV68jS9e0tqGPxNvgNqZzHdGpDI/m85ve3u1KO83uYSQNTFj8yE0cXIJ95vwAjkc
         2vk6ztKCgbNnYRUM2kda0uE/wKRDggCUKE273jJCTBHIJka1PXrg6jBUhaM7R95MhVvY
         YaNIi2VwxR6MqzydhNPGRbJDdiPS9r9nceJAci5i/GIAD9oHccV3Fhs/5W+uDLBfXLJW
         qs8J5Mmd0DW1UIyFV0QH81AJTmvKdC5fG+40aLBVKtY4/QZL79e4n58e8+VjwWZ8Zv8x
         xFeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1795087315; x=1795692115; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
        b=WJlQEzhWDWjkKQvcAIWEfypB3q0ahB01O5UAgH/lzfdrREM9GNe+ydJe6jMecITkmC
         wQLBwC9M3zxjNQXBJjDrEZogjIVVe/HcmzuSevqPqxdjjs/sscc7RMY2IPvdJtbsshFl
         34XfLt+PywiR+fdjwvQul8gAs0Z8RQvdL5uB7Rrbuz0l4tYP/rZcCJnpEujIwYO9CLcx
         atJCRq5SMmDqLvuBh6Hw54fOUvXvBoYdiy0Ggb6aFPBo53flY4Jg9m5V0rGnliHjwXno
         r6gBWZcBvub2l1wTCV34SQJYQPdoz/Ih5AuGX9E1FLAWrbi1y6kQ8VlHgcjIJMLD80Cm
         Ldpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087315; x=1795692115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
        b=Gw234uAvo7YOBKjYzpHYsj55C1lMe28bskuHVNUtIpMuxGQjwCv3N2s2lNarfC69Ge
         QqnnpEGfAR3O7IPcqlU/hzkc41+KHpjPtSr/T/ULzrGZ6q7qf1JBlsqQ1wNUizhvyKGz
         83qGUP5BfcoPkKMLJ7rk+YCI4D8sf4y1qdfa75UXnrX61pBPwjCNXT1ICfHHrlPM5h8I
         30D+Tbvt6LzKmgL5DXbAlNlnxn/Xn6i5bXzGC1XwpFFKQyJU/Qzsl85oaamQ3DFgaJ4L
         GL/7So8D397eb/tDNvm37e5HJ1UuJqE//FkZyCAgBbcRkq1wbXdSiWXowMmYUGtjf/k+
         SHwA==
X-Forwarded-Encrypted: i=1; AL+hErH0aIjLvxDIybaOvf+FX0ssnRePHsGJLgoW7dW7vme3Jv5er/JaIUu6449zsdPs73TudNrhvRZCmJOfCg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8D4MtH6pOw9SiGjPaB9HcURavXyREuzQNlqiTmEf0tYnLupoqM
	iArEwHHd9hWkENikXuA35KSVcG+CPvCEnCKCvYPdd1vK8QUwieNyEJ+djqx6cf9CTnxjAyTm22e
	t6U73hs6tDYamSO6OEMkJLrkZhcUzR42CMoZt+lHylg==
X-Gm-Gg: AYBFou2VmGKdaSYR2jDUKwteqpU0n9lkSURWi0smMntOcJMj44I3h48m+/shqzmHDqT
	mjUrI9SUhYWHTQsNAw1LL2jBb641wtp6AeC86cufyQtrpyAOsCwfAHswYWrRuxDCGfppbMNcUoy
	nCglK4h0NzJ2RNIZWV4aSNQ0SO1SRtm28UzU3ch4hB3qgXjAm+yowMC9YYn/C1rhXiK0/WK2wjk
	pCEls2iGPH7CpNQUjlPk7AOFDWj87hkO2bi5v9Ol3sdg+i2wYxRHXwhb8dRwccRGOo/1MqjNksJ
	TZVqt1aqMbCCoqkyEfpoMtapNaGX3fToZTEw6fuiaruXNI0lueMoTZioqEwpFUcUEPIzFK3hme0
	3buHFqC2MQrkXAtnFsuTl7jj5Z9WXNWapKOcC5GRdDckDB+YVE0slAwKyvR2G//n57/kn
X-Received: by 2002:a05:6512:3ca9:b0:5c1:4f88:9af6 with SMTP id
 2adb3069b0e04-5c1aa2b7f68mr1862082e87.54.1795087315464; Thu, 19 Nov 2026
 03:21:55 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu> <2026102218-vowel-plutonium-629e@gregkh>
 <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
 <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com> <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
In-Reply-To: <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Thu, 19 Nov 2026 12:21:43 +0100
X-Gm-Features: AclHuK_QkZ_OGawTlhhrvP9kkbP7VHlaRBS7KCVvE8WdQdIzwGrIlALNsg0Zi28
Message-ID: <CAFERDQ15_=_8a+0nYqE9ef_W8NWVnhys+mSRbkXtKtymDixvMg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Gaston Gonzalez <gascoar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 4:25=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> Sorry for the lag Martin, I will be taking those patches from now on.
> --
> Florian
>

Thanks Florian!
Thank you Jai and Gaston for the review and the tests.

Regards,
Martin
