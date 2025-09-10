Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4381F31A070
	for <regressions@lists.linux.dev>; Wed, 10 Sep 2025 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502569; cv=none; b=F448zTzkpnau0Kp9O8lpFDre356L3wYZwnKoPxHNQ0DdaPNfrQ6zNi6APAIstKB/+6nG2XMPR6Qn1GTIkzKwqEoLRuRphP5ie4PxbL8+18RF7LK2AYcBD3DSHD0pEEfFpTjf9kpXQs19PAVdb9498//TObHvUuCxuMAPpaQ/GM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502569; c=relaxed/simple;
	bh=BQ2XtYRwei+F/8LMUKBdKEm+z8pxUaNiGAkH40rNEKc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aZvocAPfDXgTzJEaNUUtgARKlpQEKhzH/Fyo5fp+1Zeya+UCegMHuH8B54YlE92ksoxPZ3+NBVXtUooNztUgNJueN3re7KxNPoDrA49hXdZzEMtEWM6HipiCckyQnyXQihVeLfZAs0kCfxfx7QuMGrzW7pn9OQHPmriqCQxHCTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HPrk7u7Z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HPrk7u7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757502566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EEfKAAgF77B0N35cHlVCZR8H3qoPVBq2FQNy2mJIamk=;
	b=HPrk7u7ZaSZTh4jOKCdVu2CnJAdddbfTonlDn9pyM4WMafX7E5oEWXm8mqB6tzoMd7gyuO
	aMaN1cJ1xNMdsleooq3+qUUKACcPwc5fTaiGYcJ5FEbGVPplqOa/3tDv3sTlm5//S6SIiO
	9T17r9ff6wJ37rCrBAMoevDMWYWH74c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-qAv_nB54MJipL-tm2M_zgw-1; Wed, 10 Sep 2025 07:09:24 -0400
X-MC-Unique: qAv_nB54MJipL-tm2M_zgw-1
X-Mimecast-MFC-AGG-ID: qAv_nB54MJipL-tm2M_zgw_1757502564
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3dacc10dd30so4857104f8f.0
        for <regressions@lists.linux.dev>; Wed, 10 Sep 2025 04:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757502563; x=1758107363;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEfKAAgF77B0N35cHlVCZR8H3qoPVBq2FQNy2mJIamk=;
        b=chP1q20cHEUQHQofzi1HDSWs9GpTD3zlOws7wO6pN3hupY6qROlZHb6dvfeRKJcFmE
         UtAgyReUmGjTUcWSsIxiyWV4exArFESdREQePSJiBtZQRtGti81II0NOh6hcgaqkIdVq
         n9Ex3p3xBc0NCG1Zj7H43X5YKxh0oaDFaAk9/GCMmgsaskhPYiZlbyDB0cheTujM2DWC
         P4MmOxFTs/qAz3iaj3whWXjzVzKno8DOvIIlNfFZSCYb3esYCSnr3PFHoz3956hql5dA
         FmMrmRQ7SMcyvZVvz6PYA/uMNMARhK9vYS2GymRuih9P0L/0ueE08wvOy8LU0qU11iO+
         5PmA==
X-Forwarded-Encrypted: i=1; AJvYcCXoBTSpssGzFnfFdz14ODkDlHnvi0SRd1M+RIwE/HS1XUONW29aDbbT4L59qC9ldJkUkC28XKc7NSvf7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJZWKjeF5d5kUelZendy6g3S11Guk9SqixKc4EAUhqYiuBsJWd
	pL5D112Ua2j7DgXSHnSZ1YRBG5lXQsl2CMjz3dqLn8oW9gc9A2CHHhoP9HI5hiy8YTpiQbxcMPu
	dds+Xp/xtF/QAhBAIqRu9S/J8hLQB5z7a/rV/t5wtmvuvgBFIE10zBNS3nRyrdv78
X-Gm-Gg: ASbGncu2Hlz8/KUdTgdOwb+RbTVBcu+rxFbx52mkdz8JB7JIxE5Ev/aD85OlPQb2ONr
	mTI/VCDUA+WmLs7Axz5kQSS2E161Cbop5dMtFunC9W4J5FwmWN8QRnqxjdPx2cY5tpvi80Ex7GZ
	czFnW4i3Qc07ndhlL7C0u6Q10Jyy7XONArh8jAKH2oc1P4oDvstsOGO9Mq9o9QX1cJdSwU3QwW0
	n4wdzf0L+EoYCBepTndGt0uUfWbfImmTMDNnuKZkL4Zl+UlAyo+YGYV1b2H9edfvCtNno8O9d2N
	JQN+22x3fxYeCnVUc/znf8fI1r2ztGsZUnGwzBfYs4kFR3uAi5T4YajADuDNIzySbLt6GDjEGzm
	vOiS+hjugLhvEEOMs2ttKMA==
X-Received: by 2002:a05:6000:2889:b0:3e5:50:e044 with SMTP id ffacd0b85a97d-3e643555859mr13543076f8f.45.1757502563465;
        Wed, 10 Sep 2025 04:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtsE6TP99LwCM9DefOr4NgVBIR7vSn0IU371t63+HnR3UaFYs5LDu32sAvz1H1Dto10pgN1g==
X-Received: by 2002:a05:6000:2889:b0:3e5:50:e044 with SMTP id ffacd0b85a97d-3e643555859mr13543046f8f.45.1757502563021;
        Wed, 10 Sep 2025 04:09:23 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df1ba282dsm26332925e9.5.2025.09.10.04.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 04:09:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Brett A C Sheffield <bacs@librecast.net>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, Helge
 Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones
 <lee@kernel.org>, Murad Masimov <m.masimov@mt-integration.ru>, Yongzhen
 Zhang <zhangyongzhen@kylinos.cn>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 1/1] Revert "fbdev: Disable sysfb device registration
 when removing conflicting FBs"
In-Reply-To: <aMFYeV4UdD7NnrSC@karahi.gladserv.com>
References: <20250910095124.6213-3-bacs@librecast.net>
 <20250910095124.6213-5-bacs@librecast.net>
 <87frcuegb7.fsf@minerva.mail-host-address-is-not-set>
 <aMFYeV4UdD7NnrSC@karahi.gladserv.com>
Date: Wed, 10 Sep 2025 13:09:20 +0200
Message-ID: <87cy7yef8f.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PNolrXR0yBYX9QF50dyMYhNTskZQhCrNXajS680Zf9o_1757502564
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Brett A C Sheffield <bacs@librecast.net> writes:

> On 2025-09-10 12:46, Javier Martinez Canillas wrote:
>> Brett A C Sheffield <bacs@librecast.net> writes:
>> 
>> Hello Brett,
>> 
>> > This reverts commit 13d28e0c79cbf69fc6f145767af66905586c1249.
>> >
>> > Commit ee7a69aa38d8 ("fbdev: Disable sysfb device registration when
>> > removing conflicting FBs") was backported to 5.15.y LTS. This causes a
>> > regression where all virtual consoles stop responding during boot at:
>> >
>> > "Populating /dev with existing devices through uevents ..."
>> >
>> > Reverting the commit fixes the regression.
>> >
>> > Signed-off-by: Brett A C Sheffield <bacs@librecast.net>
>> > ---
>> 
>> In the other email you said:
>> 
>> > Newer stable kernels with this
>> > patch (6.1.y, 6.6.y, 6.12,y, 6.15.y, 6.16.y) and mainline are unaffected.
>> 
>> But are you proposing to revert the mentioned commit in mainline too
>> or just in the 5.15.y LTS tree ?
>
> Only the 5.15.y tree. Sorry - that could have been clearer.  There's no
> regression anywhere else. Mainline and other stable kernels are all ok.
>

That's what I thought but just wanted to confirm that was the case. Thanks!

> Cheers,
>
>
> Brett
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

