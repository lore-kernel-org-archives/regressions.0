Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0305B76033
	for <regressions@lists.linux.dev>; Mon, 15 Apr 2024 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713196294; cv=none; b=gg8i93z5eSoRrgV6YyCMfJFo6jJoPa77jO4PWlmkTZgS+56IuS2fN4R+RijpWRF7ew7OIW6NlRzVd2Y0o3u5l+ovJNmi/MXSfMRQUFjLmeb7DyNzSL+rELsWCCI8anMTwwazWVOinG2JBIe4tBVqIb4cyqmFs3Of2+zULvjGPlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713196294; c=relaxed/simple;
	bh=09xE/LFlf8yGYO0Vt3dT8wJS2zUG1ebrtZmNDTnLH1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WzyfR45+OVUPhCyuGj4AZpY6dg4pP0HkO7UheZdfI2Yfo9m0v3tQQRBnljk2HIl9f3rxekQdEmngc6MOaD8jpet79xLR1r0RF5e4TmkyISCDYi0P2VtdOBfgkcpAF4iJEzdhMp0qpPjkqMYStiiw03kpqbMRmmKVNxRCjHPylYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FPIj9rSZ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FPIj9rSZ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-518a56cdbcfso3311010e87.2
        for <regressions@lists.linux.dev>; Mon, 15 Apr 2024 08:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1713196291; x=1713801091; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SUbBz+0Pa/+6Pdxji7ckXlL4204e0k2uOmCa11XX1Xk=;
        b=FPIj9rSZgK0UlhFL89VDqpFwOPKa7Yjp0JQS5Bh0jcrefexF+K7zoMUM5JEV8VCyGf
         yHpeESuIOBpTfm9FYF9IqcfbFR4H+EFpvdZOlZSV+1CTjUhRbUOBAMCuzmYgQ7p3lcm0
         7o/GLHU7fhvzF8luAEVHtw0abwzu5sbs8z86Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713196291; x=1713801091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUbBz+0Pa/+6Pdxji7ckXlL4204e0k2uOmCa11XX1Xk=;
        b=jHshn7/vGnORCfuwIu7yq8cpMfPm1OVoG7sOsekv565LEckzEFmhnsuznQV/JJHcuR
         rLNqYNcXWhqJpk7EuY5zr+MoMizjib0kMjVhF39r/XQRMsXmtMkWo8fiJ0BJRnU6Nzy3
         4BGCUYp4jDBo9I2hdp/yj1gjPnNwDdY9doLcOQnvwOSTnYO605GGSswtVfoq3HmvPrMa
         C4WMz+UXg1bylP7RjQWwB7xAiUZF/9D2sj4wy/F3Im+BvUc0eXpi3dwbQiKlppBPT9fG
         yLw7QoLdk2sainNN8411iWfh9YKr5nxPcIN37kJdUbF4YL9Cwvgl+/CGbiNKXzJw7pj2
         eLgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfZmwgIA5f/p0J7aIblwVdB+ETLVCpKSqbia5C/zOfzCZne9pX3hsYFQlsvwaiec44yxuanj6A7AqoxFsk/Eqrcao0NnKaT3XPKOY=
X-Gm-Message-State: AOJu0YwD4j0tp+7wxkBujP/JEoKJD6FOQxS4b6kzBYxiuQ/PuDFCgiPx
	A33Id5H0BPRxLedJ7Ouwxo0XLlwA2ulIvWOQp923cHHoM6/n3ENl3s0Z5josJhSq2y780HZRgzR
	rbJLW+g==
X-Google-Smtp-Source: AGHT+IHZb9iNu1kfCZBXmTJ6swRN1ctgGlbwjcM9IRZNU6o7jEcKVO4CD89jJD8NxCL9280Iu1qGeA==
X-Received: by 2002:ac2:4e06:0:b0:518:e7ed:3c7c with SMTP id e6-20020ac24e06000000b00518e7ed3c7cmr2976888lfr.14.1713196290886;
        Mon, 15 Apr 2024 08:51:30 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id eq3-20020a056512488300b00518a64ad4ecsm721150lfb.48.2024.04.15.08.51.30
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 08:51:30 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-518e2283bd3so1925189e87.1
        for <regressions@lists.linux.dev>; Mon, 15 Apr 2024 08:51:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSTcIUoxYepFhW/nKr5OyVnviczGa1sKKNCvrqOMMudnb/7o91fuDNp9kUiHm26D/Z8L+FdyBDQEUjirk7n4IX7mo3eSZq++UWjhQ=
X-Received: by 2002:a05:6512:110d:b0:518:b409:ba09 with SMTP id
 l13-20020a056512110d00b00518b409ba09mr5784322lfg.19.1713196289845; Mon, 15
 Apr 2024 08:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZgFN8LMYPZzp6vLy@hovoldconsulting.com> <20240325-shrimps-ballverlust-dc44fa157138@brauner>
 <a417b52b-d1c0-4b7d-9d8f-f1b2cd5145f6@leemhuis.info> <b0fa3c40-443b-4b89-99e9-678cbb89a67e@paragon-software.com>
 <Zhz5S3TA-Nd_8LY8@hovoldconsulting.com> <Zhz_axTjkJ6Aqeys@hovoldconsulting.com>
 <8FE8DF1E-C216-4A56-A16E-450D2AED7F5E@tuxera.com> <Zh0SicjFHCkMaOc0@hovoldconsulting.com>
 <20240415-warzen-rundgang-ce78bedb5f19@brauner> <CAHk-=whPTEYv3F9tgvJf-OakOxyGw2jzRVD0BMkXmC5ANPj0YA@mail.gmail.com>
 <Zh1MCw7Q0VIKrrMi@hovoldconsulting.com>
In-Reply-To: <Zh1MCw7Q0VIKrrMi@hovoldconsulting.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Apr 2024 08:51:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=whN3V4Jzy+Mv8UZGTJ5VEk_ihCS8tu3VskW-HCfBg6r=g@mail.gmail.com>
Message-ID: <CAHk-=whN3V4Jzy+Mv8UZGTJ5VEk_ihCS8tu3VskW-HCfBg6r=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ntfs3: remove warning
To: Johan Hovold <johan@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Anton Altaparmakov <anton@tuxera.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>, 
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, 
	"linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Apr 2024 at 08:47, Johan Hovold <johan@kernel.org> wrote:
>
> I think the "ntfs" alias must always be mounted read-only because you
> can currently have an fstab entry which does not specify "ro" and this
> mount would suddenly become writeable when updating to 6.9 (possibly by
> a non-privileged user, etc).

Well, it would be fairly easy to do particularly if we just do it for
the old legacy case.

Of course, even the legacy case had that CONFIG_NTFS_RW option, so
people who depended on _that_ would want to be able to remount...

               Linus
