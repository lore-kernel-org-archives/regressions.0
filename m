Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA9A22BAAA
	for <regressions@lists.linux.dev>; Tue, 14 Jan 2025 06:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736835781; cv=none; b=sQYz7uHKwmnenwUoh0UKccsy+fJqWvzf3jF+OO1Fmka43ZCB4w6ula2yTc3rFlhT1yxPGhwGicR4rG0QLBwCchngYg2wv/keIaLA84dUpDtUA7P6pk+E8kw043XXEHx7kIYzJEgB4qkh/qm5B0J2PrDd5ZeWBIGlOlwvfMzHuOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736835781; c=relaxed/simple;
	bh=jVuIhZRUvgPZRSCuVQ6t/tU5d52q/hnSXQjFm8iDUIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLsSVbc+90Kl/xXzFmXrKjFVNTwJtpUv8jK13FjmkVelYi+et96IrcYMzXDqt0yfNyDud84+71ZURqAqZouN1ZDns+pTyB7RA0u8VBrTDLmjrFVKnFnLgwfgE2azDixQrmg04fAljE6o/dBNl4WehT0XAU066iotxAkop7B62kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBVUCu+1; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBVUCu+1"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f8befb03d0so515802eaf.1
        for <regressions@lists.linux.dev>; Mon, 13 Jan 2025 22:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736835779; x=1737440579; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVuIhZRUvgPZRSCuVQ6t/tU5d52q/hnSXQjFm8iDUIU=;
        b=fBVUCu+19RqmdKYWUm+69lNwoDHfjfTfZtMc+QL+PWD35ZsbYZXEv77Rfll+QvjMOw
         zQlI9xYzBbcUweOFkc0IxRbzm0/s5+AAObzIXI5LscO5ASL5j6wiGi6oMPCXtMbDjiCA
         Oef+eFU0ZAdhvlK6rjlOxfKgjoRdNGO3psEhny46iucxnAP+9nW0trpGrkQXViuhEwgJ
         MgE+7jyM4Yjgx0lGUDh3Q+MNXadxm9SPcdnot3znU8dkywmHgk+6oIX7Tj5lf4wyEwwi
         YpNvn+FJiN8bsMHgxdno9AQhtVtXKquUtnmTlgaskB/rLdPrp6ph+t7Q7k25Kvy1U13i
         yMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736835779; x=1737440579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVuIhZRUvgPZRSCuVQ6t/tU5d52q/hnSXQjFm8iDUIU=;
        b=GN7ltLgACIGNfVDkrjL47NdkfIuZmBen7D9QDi7QVEkpxAH8VBs43tzQ+Fa0hneprJ
         u1g9qX+BChMiUASewwobrklB4N5SfvCOuQs+TwQzTk624+4GMawa8M6Pbz69JQoaAzHu
         M4Nv5U4uV7hUh5gC32LBRMIk3HblgGoXoEWhbStVk1qkeRHp9g3eaOf4FSsatn9ruHNc
         l0Fm2EXdMabPDYkyYGVBt9nZy/YyDOkEzJYm654eHucVt371/EmIAagEcM08wHjXwg7u
         JQ8W/bzTjF2c9AQ50o45tzOUQshcg0uP6Xijy8pt6GrFJVU6vtYoZKJg+itBi2KHKc7o
         89fg==
X-Forwarded-Encrypted: i=1; AJvYcCWWyOV9dBATX7ow+kmoKb4GxLrFkhG3UyAwqe/TVVxcVvERj6Z46Maho0IBdxWzetdFoNawGl3DKYgaQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXdYgjZGe1Hfb8IGJVI/xbP1xlmKjDlS0K0vc0Uditw3m9pnbn
	DyadRIjj41NOjr++cpTn/aTleItQh81i8uMo4HfLOu6ya214F/0YK45WSVoVm1MCZA0KNFjNbju
	/ovcxbB7U+WVzR9ePQD5TeR5+fe4=
X-Gm-Gg: ASbGnctYRuT8GtxUfpCB1aoRV5XI0PLV+DevWyW1EVlqvQ8ps+VFj7CHnk5uD+esf6L
	sZt4niVi2fClyRTGDoBVeBKd8pDcHspdBHHYDvvqT
X-Google-Smtp-Source: AGHT+IGfwjdSn2wvrk/Kn99SIO9d89rRMrWGfTmIqA+a1OvCy95oe+MDxJlwx6rYYI3XBhfWwPUKgcPlma7D2Mh57yY=
X-Received: by 2002:a4a:d024:0:b0:5f7:3654:4595 with SMTP id
 006d021491bc7-5f7365448a1mr9262674eaf.5.1736835778552; Mon, 13 Jan 2025
 22:22:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMS-em+jU0M9TnoVwViUfDudv4juN9yccsh-p+kuAneBw@mail.gmail.com>
 <Z2I1HAKhKrCR51XO@fedora>
In-Reply-To: <Z2I1HAKhKrCR51XO@fedora>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 14 Jan 2025 11:22:47 +0500
X-Gm-Features: AbW1kvbG-gRPiizkMDvNUL8NfFTZ0lsrGVH1cK-7cHH13_zaYnOPeuTxEDq9p_A
Message-ID: <CABXGCsM87Ezc9Z6TAfGaMLZsdD63O2CUyhxThoUnLw7_NmZXxA@mail.gmail.com>
Subject: Re: 6.13/regression/bisected - after commit f1be1788a32e I see in the
 kernel log "possible circular locking dependency detected"
To: Ming Lei <ming.lei@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, axboe@kernel.dk, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-block@vger.kernel.org, 
	Damien Le Moal <dlemoal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 7:36=E2=80=AFAM Ming Lei <ming.lei@redhat.com> wrot=
e:
>
> This is another deadlock caused by dependency between q->limits_lock and
> q->q_usage_counter, same with the one under discussion:
>
> https://lore.kernel.org/linux-block/20241216080206.2850773-2-ming.lei@red=
hat.com/
>
> The dependency of queue_limits_start_update() over blk_mq_freeze_queue()
> should be cut.
>

I see that conversation ended without sending any patches.
https://lore.kernel.org/linux-block/23008fc2-6e83-4d83-8ea1-4a3f6c0e000c@li=
nux.ibm.com/

I am still experiencing this issue in 6.13-rc6

--=20
Best Regards,
Mike Gavrilov.
