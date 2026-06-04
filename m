Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED1F3CFF49
	for <regressions@lists.linux.dev>; Thu,  4 Jun 2026 07:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780557500; cv=pass; b=Hk2aWdTpGD8FhQHOhxxQMBqRNv6wG7LBxayrrLrJwqQe/w6AygXJWFIvTxIdTU0IY8snv57SaPpAj4AIgPu98Aqe492S7o0U7ar0rqqeFX5gQGxkAj0DaYZ9WSVJQhu1yjFZXbmp18iQC/dR/CZX922vpHEKaJvg3B5OBVgPGC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780557500; c=relaxed/simple;
	bh=tPnMC/0vlcveygoI0ctCY0usOzZIfjE5HemkDY+WbYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgWTjXIXbfW3MtFQGCMIH8oHYHbYSAYseXcrhlHqmGLGlDBRANzV60XbiSZxn6Qvxdv82Yc1kuXT+K102ArijGrt7DkcpM5+PPcqkxK0ZlxAWl1veszkXaX8+RNQ1Vyq80KhyqYGGsmtZouJhe6RANmJwI92rhOQX8MkilEney8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=RXQYlLAG; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="RXQYlLAG"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51776b4de37so3269591cf.1
        for <regressions@lists.linux.dev>; Thu, 04 Jun 2026 00:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780557498; cv=none;
        d=google.com; s=arc-20240605;
        b=bt55CBv2w0f2vNQug8ztsa7/hw95+oPQfyRNsRBcv5/oAQJH+fazTG1OFpdHCexT/i
         kJBWXlNkP7zIk9s9OABdu5/qTmyTIWZJImvRTX/JCAZbZ8DkTqZz2Fm9SEqgsOcMYKHQ
         XD5WPxNWe3Fbj2KrQ7yyXCJT55AQdDZQFcIWoajlbl3FC201HfkZUxoUbo1wp9rkXdVM
         9m0thtMYLDuBeS3FusaDTRBceszFEaG1HEli5Va/+SKgsy7YfXZPe62OHbCvPwPFloIv
         glQSJ0SVYo0tBTzTH8nuETQB/LiCLD4d0Cxvp44/t8YSxJrHL86nFRbvzf5x9FeX6+WA
         LTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AH/4FtqZ/8PDfc4b1rIfyYEACsJ0YQwcfNPJKh4jHhA=;
        fh=USgfA30gptmyMvC3Pait8gbelGaI4ZYR4nTAIZXIeeY=;
        b=VGCB2Jd/DvaHzofr5t3Zy+IDKTw9xQrRwRLXJ3R/JLNZgAcaNQLXVru4VXNN7MRo1f
         k6ymNavI/D266OabamOZl/xa8V2reD+V5zG6xqR89ZTexXbIv5/1pmG422gb0ae/PLKk
         siJpkmwTAd0MJgfZ5kY/Tr/aEp6xpGDrEgOdZVbEaA95MzGeQ+UkTq3/4mTgHx1cNKFB
         TJmlISBbrkBY54PkyPpkQC98D6fVXw6tY8w3jGresVqyfjPDsZrb0bOZ0Yyu0fP9e9KD
         CDjL1VKMt0P3uxF5Wokj28eI2CMDFER3kJiK8My2HNq9K0k8bbeP9GoabUDtuHxrFFaN
         s4wQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780557498; x=1781162298; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AH/4FtqZ/8PDfc4b1rIfyYEACsJ0YQwcfNPJKh4jHhA=;
        b=RXQYlLAG8NlAF+6Fx/YohTiCspExlucMxhcPnpFvqS0NENnCeHdSm0sWRXivYQ/y+8
         1sBT7RzOxRyeFIS5/zDiwL3D6MdG99itxF6oMYTp79hN+SfKIk115hUzxD6lHtYMPlr3
         +ZBs8ktVUKrbobt19PEJgYKGi9C6azhkvvDUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780557498; x=1781162298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AH/4FtqZ/8PDfc4b1rIfyYEACsJ0YQwcfNPJKh4jHhA=;
        b=X+SkAX1AnAnjx6flZ3NpTB405fASI+mNsu+ztH5qnvUCWjxJrysSuKh+G5krg1nOwQ
         nN5bUo+QjFfKYcUmreDaDMCBBO5vvH4IHHJlEMD2qfBAdw6aRjcOw4o2grtvXMeOvZ0R
         9Kuogsz7fbQPNC6wggEfKn4w04+ZR9wIKK99p4eRjY1qe3GupLOTihiXG+yYZaLReU14
         IjKBWalOlbXF2rdWlROTMAJywom+9mizL+uXqkJTt5JarLmw4oll1TeZz/8J3rrhRI5i
         IhozGaCRiQAjZ/b/EsHlTWw1ras7oi3x7+5rFZRN3to3519qpNwSjMVzgIT+Z4AVgru9
         YOVw==
X-Forwarded-Encrypted: i=1; AFNElJ/evbllqiqoj6WcNwAKkKlmzHTpzq0lKBB0kdt1IW0IZhz5ZiljsmuuPAlWjz1IHfwOsJK0s/WFUJlmGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvgNkD2kk7seJx0FKwFNgUOM7DDdVr+BoeEo4+lv76rHGPpQQd
	9Fcmj4ve2HGDQbFpZjSQed6mQ/B4lg/UarefAEyXpB+jiF88VfmRU5iIVW6CPmnO1PKKyda8GsJ
	KEyrX0Kzb1tQzLvGf0aIiSmwD3CtytvsHB/0Br749KQ==
X-Gm-Gg: Acq92OHljhlwNoJoVguq+Jv3ttX7lSo381V/7yJJxCiqRbcDWdD2n4KqPINKmLl2wJE
	p43vg6K2Y8+aP9/N+opT6HyplPY+gial5/URsSNXf5GIDfsQXXPhfNf26kQC3ESaI7AvCopCCcC
	3NX6XT7w8bK3gyvFVDDde5wmu3QdtEJZ9coLpBei4q18ErF7+wpOxBC5s0/eCzLew9h2d/FDwV8
	MK4PlWN3xZLp7UdklP/jtPMdbkfozYPULUGJXrFtT3ZwBxwXRL0wClQMVgJkKOO/AhFguBCOlLd
	SJsluTuyoayl2yai+RagdQi9v9yUB8vnvtmpNOGhotXjAY4=
X-Received: by 2002:ac8:580e:0:b0:516:de59:4c85 with SMTP id
 d75a77b69052e-517786948a3mr92857481cf.37.1780557497439; Thu, 04 Jun 2026
 00:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFbF8N7++zopZuEcsKRxBV_sgOGCbzCY0hOyMw1SiGAtuzGhyQ@mail.gmail.com>
 <CAJfpegsCJnMfn_BzzTK7m9ndCGVsnPit8ZsT0fzAhYoY+yOsKQ@mail.gmail.com> <178035740095.2923901.5908691318688917347@noble.neil.brown.name>
In-Reply-To: <178035740095.2923901.5908691318688917347@noble.neil.brown.name>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 4 Jun 2026 09:18:06 +0200
X-Gm-Features: AVHnY4KDFLlajvFCH3wTVGx_5fPbucIySve1QOGHJ35RS0MmXWDSF8kzFInRFYM
Message-ID: <CAJfpegswAZv8OmDAcK-5u8kssAF1vZKe4gdDB2XPErAnoGFSYg@mail.gmail.com>
Subject: Re: PROBLEM: FUSE_NOTIFY_INVAL_ENTRY leaves stale negative dentry
 after c9ba789dad15
To: NeilBrown <neil@brown.name>
Cc: =?UTF-8?B?0JDRgNGC0LXQvCDQm9Cw0LHQsNC30L7Qsg==?= <123321artyom@gmail.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 01:43, NeilBrown <neilb@ownmail.net> wrote:

> +               if (d_really_is_negative(child)) {
> +                       spin_lock(&child->d_lock);
> +                       if (d_really_is_negative(child)) {
> +                               fuse_dir_changed(parent);
> +                               if (!(flags & FUSE_EXPIRE_ONLY))
> +                                       __d_drop(entry);
> +                               fuse_invalidate_entry_cache(entry);
> +                               spin_unlock(&child->d_lock);
> +                               dput(child);
> +                               err = 0;
> +                               goto put_parent;
> +                       }
> +                       spin_unlock(&child->d_lock);
> +                       dput(child);
> +               } else {
> +                       entry = start_removing_dentry(dir, child);
> +                       dput(child);
> +                       if (IS_ERR(entry))
> +                               goto put_parent;

There are still races (move out from dir, unlink) that result in
EINVAL and ENOENT respectively, but AFAICS these cases need to be
retried instead of faling.  Rather convoluted.

Can you explain why exactly is this needed?

Thanks,
Miklos
