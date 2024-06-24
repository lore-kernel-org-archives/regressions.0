Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1E22E62F
	for <regressions@lists.linux.dev>; Mon, 24 Jun 2024 12:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231529; cv=none; b=tU/IQr7yUCBVC6/qSL2CAzSDoIo/ZL5fqvu9aoIDgtuKMJPfRnna1jtPYp06qgu6roWkgYJjqhi4MIrOEwjX5ugs8zJn6AUei9eHgptPydWGTIuDX3niYdZJhEmrYqWlPyjYjvKXpVP+mOArKiU8B+yMQTowzd60U9OemL6Q/fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231529; c=relaxed/simple;
	bh=Q2jwPxeSpOSVN20g5wzq07/iFIp8leiAtqDeGO2zsWg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qcqpheh0LRPvc0u6GBwZ2e5HpQ2nzZtMlKILn36GGQviciYEVdP0OAZtGyXt2mJISbSIiPrrj9xjiJ1Pns8vMO3RPcHttC2UkvvQKYq35/VYR687ACYs+x8kjCJ3cE9rySIIBO/Yqvp23B7r8ti4biAZNcr9+OC1P1yCAR3xkss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kR3Kkqll; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kR3Kkqll"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ce6a9fd5cso792745e87.3
        for <regressions@lists.linux.dev>; Mon, 24 Jun 2024 05:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719231526; x=1719836326; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pI+IBO8mbNLx4EB6hYvwY+pSQvTtQIyHsgLM0FFnMHc=;
        b=kR3KkqllilWs/3RlyQLWyJRZ9OBtdSb3barD3NUmcdQFubtug9QKOS7UjsYhbGqtJ2
         LtBcgbkaHswyq9Xm7iG0Jc0h0+4XLxZZ+2g8+U4J8YU02guqCFUKbs7esWQ1xNZKc1af
         MjgRxTGyyPpc0CEguZXIGGv292X9o/8qy+PWeoOS3/Flx6FUCsUHzbDjEJ534xb5l5cQ
         0fiQyLFvvKF3Am0+DBvJbq5UKUbXFhBXCMRpXVT0QBJRx3B0iq4/85iJu3pR1PXAI51B
         zuSxM+cjiMvO2c5Rb+njVHa1eTIPK7oFQ3Un4lomtpFGUC/tR3MuStKM7dq4iHffSOxa
         PsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719231526; x=1719836326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pI+IBO8mbNLx4EB6hYvwY+pSQvTtQIyHsgLM0FFnMHc=;
        b=IKbjT7skYaqP5jlcjiPMJ3fYZL75yLvjIUYgmiF5kG3MHfyj9/fViqQ9fp3ONwfWVF
         sfwQ5U0WHY+X7CHU0lLIxFkJpTPEjnZE1oApHjtlS3IDvIJ5GbdxB1uJuZ22xYelaT5l
         /07p53UFhC3DPJEHsYZlUQhK3kdp/jaKFcVxIwB/ohpWYev7IRFE0PJWFgS3WjM5HoaI
         98i4UTX2bnpIDkL3QQbFSNJxZxXt5ekJnFkruFO3MhbZDyGX+fY8UHNg2Ihx/p5lDL4L
         RUtveVxuHXIGICjOaJZJIGqzRj6vj3KG+m7W49q4MKKWLnkhubvO7aY5ygAtx21GnQBF
         fNDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU4Ru4TTC0UYVS9U0uN/RWrZ7ZDvhx3cMYOYuXoKxFmyXvCBVtecl/8xUjrBEWim5a8iH9aOBDoui7g2qj49osrPnZZ2ML2ysU7UQ=
X-Gm-Message-State: AOJu0YyNn4k8KxTlNEloCGd+3pRHfKboAMloeE6g9FaavSFuW6eMNPai
	wAAOvuumURoKVfE52IqW7C0hSeGiduCOsnAqssfjztSYlVqnPji6
X-Google-Smtp-Source: AGHT+IGOhdNKCJLKfAuk/c+639B/KspuwzTM0seZDswX1n8I2/wI73HfO1Ej7KKMpMuoOrjlYz8GWA==
X-Received: by 2002:a05:6512:3450:b0:52c:dea8:7ca0 with SMTP id 2adb3069b0e04-52ce185cf71mr2383149e87.55.1719231525645;
        Mon, 24 Jun 2024 05:18:45 -0700 (PDT)
Received: from pc636 (host-90-233-219-252.mobileonline.telia.com. [90.233.219.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd64390d6sm981488e87.238.2024.06.24.05.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 05:18:45 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 24 Jun 2024 14:18:43 +0200
To: Hailong Liu <hailong.liu@oppo.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Baoquan He <bhe@redhat.com>,
	Nick Bowler <nbowler@draconx.ca>, linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-mm@kvack.org, sparclinux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: PROBLEM: kernel crashes when running xfsdump since ~6.4
Message-ID: <ZnlkIy4XuzGBKinQ@pc636>
References: <75e17b57-1178-4288-b792-4ae68b19915e@draconx.ca>
 <00d74f24-c49c-460e-871c-d5af64701306@draconx.ca>
 <20240621033005.6mccm7waduelb4m5@oppo.com>
 <ZnUmpMbCBFWnvaEz@MiWiFi-R3L-srv>
 <ZnVLbCCkvhf5GaTf@pc636>
 <20240621111545.awvgrap2nscgehxv@oppo.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621111545.awvgrap2nscgehxv@oppo.com>

> 
> IMO, I thought we can fix this by following.
> It doesn't initialize unused variables and utilize the percpu xarray. If I said
> anything wrong, please do let me know. I can learn a lot from you all :).
> 
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 11fe5ea208aa..f9f981674b2d 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4480,17 +4480,21 @@ void __init vmalloc_init(void)
>          */
>         vmap_area_cachep = KMEM_CACHE(vmap_area, SLAB_PANIC);
> 
> -       for_each_possible_cpu(i) {
> +       for (i = 0; i < nr_cpu_ids; i++) {
>                 struct vmap_block_queue *vbq;
>                 struct vfree_deferred *p;
> 
>                 vbq = &per_cpu(vmap_block_queue, i);
> +               xa_init(&vbq->vmap_blocks);
> +
> +               if (!cpu_possible(i))
Why do you need such check?

Thanks!

--
Uladzislau Rezki
