Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E21014B07D
	for <regressions@lists.linux.dev>; Tue, 25 Jun 2024 09:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719309342; cv=none; b=tY4ER8Z2UP/c+9esQIdhK5Dbbbo7LWj0DzEqfkp5BK3CHYZVbfbVqQ9DzLtZcPh5q5EpPs0AuZ41gemMvPC6jXBvxFewNtH+V+GQv41TIsWHnd3LDVYJtk30lirQ2Di7h4d5smnvCisaK4EBaRpcvfubN5gS5uVugbZfaTsNiWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719309342; c=relaxed/simple;
	bh=5GSjkAsYu/hzXKXjxyztHTxUXS3GjYOhaLYPSlTbE4M=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFOFruDLbNGyjzXDvIlGzoWxomG6uRF3WAHQ2X46pZJXZCw/B4LzCutTLWenJOtJG/LqPLVNe9bf3837jjFI4KQ6iEPwYzDjJyeCL9MFkBA6+sdvNd4WUW0e8+p3aPMGfYBMIDn5mheQ/t6NPD7IY7KHIySBD55448v8WOCGpso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chS7fJjs; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chS7fJjs"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52cd717ec07so4398162e87.0
        for <regressions@lists.linux.dev>; Tue, 25 Jun 2024 02:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719309339; x=1719914139; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gfQp3tHSHToj1eIsyyv3AOWK2ep4ErUvO8iv0wMJcac=;
        b=chS7fJjsf5wsmezvPtrbj28GiQt//b3erTGdWMw8m6g0sjlkEbidJQJbmCwjsmTNTF
         B+8j9uU0kNMiFZ/Gm9iuIQMN01N/K11wMZLAmuOWsNtpvfgudPuL9i65ICDnnll9f5Wz
         DgZLgkLPPw2856N56YOKJb7cHKeDBD6kWczCkry+3lyYGz16qDeJYaB3r6GCfE8La8lQ
         2iIWMaZh7yDfAdJ80tvAb8wONmhG4WDtmjB90s9lqh4zmDM7KeVS9k6UJh64z82r0UYL
         7cvryAgv0HzXYA6upLS58pex8xFdappTJSIEol3obpP69HA/oS9UFs7Cr5+E8qvxIVEi
         Wztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719309339; x=1719914139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfQp3tHSHToj1eIsyyv3AOWK2ep4ErUvO8iv0wMJcac=;
        b=Sf89jKKNo+8XdIJ2/l7+Ji92Hr3+h8fuPnPw4AL4J6YvsKcWFYasa1nfwUlOVTXKg2
         I6fR4zikonc2JZGqXtxFVAd9EOL6IWemXsHw4WMCt0vEuGzSlnLlSY+jBLSKrjR63Z9t
         iDeQ3mzob11QUDK1lQc1f235/5BdQKKqE8gell4leOkiCcygZUxVpoqRYNXmA9MsDL10
         84hkwerUdveKidFir0Qg8KrGrVPFtz2uthGor/8VGN6qzPOCUM6qXGmyGqOlmAa2Vi4Q
         REinkOZAkqV4DhpGm2oJj+rGjU/8WopxveXJMFOg3wkEfrpxHrZeBKfQgJHzDHMyUSXH
         RNPg==
X-Forwarded-Encrypted: i=1; AJvYcCXUL1vwjEPkR+HSwOWF4Vepw6LPcvSYL9wcPd5S7BiN02tdfRv57yVWqN5FPfLzh0HOWd6Y+8zFooaNZiq+H6yJDky4w+SZAmIEBFc=
X-Gm-Message-State: AOJu0YwtCkzf7F7rzOHHhFfHmUMNJp/Cy1SDuFzkO10kNl0wh4616H5K
	lJR6GLGLFHN6ZlEg9m9j9Vd1m19CRTHg9ksIgCG54TujKdWWbYtv
X-Google-Smtp-Source: AGHT+IFDyTMqAyCzv4pa7W+j1ChiYbIQFSUuiDfMgLet2zKOii0moGRZ7U4DIe72eYKnmsBvJ0cFFA==
X-Received: by 2002:ac2:5311:0:b0:52c:8479:21fb with SMTP id 2adb3069b0e04-52ce1835594mr3967757e87.27.1719309338345;
        Tue, 25 Jun 2024 02:55:38 -0700 (PDT)
Received: from pc636 (host-90-233-219-252.mobileonline.telia.com. [90.233.219.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce042dcd1sm761886e87.70.2024.06.25.02.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 02:55:37 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 25 Jun 2024 11:55:35 +0200
To: Hailong Liu <hailong.liu@oppo.com>, Baoquan He <bhe@redhat.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Baoquan He <bhe@redhat.com>,
	Nick Bowler <nbowler@draconx.ca>, linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-mm@kvack.org, sparclinux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: PROBLEM: kernel crashes when running xfsdump since ~6.4
Message-ID: <ZnqUF14C_2RH71wu@pc636>
References: <75e17b57-1178-4288-b792-4ae68b19915e@draconx.ca>
 <00d74f24-c49c-460e-871c-d5af64701306@draconx.ca>
 <20240621033005.6mccm7waduelb4m5@oppo.com>
 <ZnUmpMbCBFWnvaEz@MiWiFi-R3L-srv>
 <ZnVLbCCkvhf5GaTf@pc636>
 <20240621111545.awvgrap2nscgehxv@oppo.com>
 <ZnlkIy4XuzGBKinQ@pc636>
 <20240625092601.uo7266gp5joluyg5@oppo.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625092601.uo7266gp5joluyg5@oppo.com>

On Tue, Jun 25, 2024 at 05:26:01PM +0800, Hailong Liu wrote:
> On Mon, 24. Jun 14:18, Uladzislau Rezki wrote:
> > >
> > > IMO, I thought we can fix this by following.
> > > It doesn't initialize unused variables and utilize the percpu xarray. If I said
> > > anything wrong, please do let me know. I can learn a lot from you all :).
> > >
> > >
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 11fe5ea208aa..f9f981674b2d 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -4480,17 +4480,21 @@ void __init vmalloc_init(void)
> > >          */
> > >         vmap_area_cachep = KMEM_CACHE(vmap_area, SLAB_PANIC);
> > >
> > > -       for_each_possible_cpu(i) {
> > > +       for (i = 0; i < nr_cpu_ids; i++) {
> > >                 struct vmap_block_queue *vbq;
> > >                 struct vfree_deferred *p;
> > >
> > >                 vbq = &per_cpu(vmap_block_queue, i);
> > > +               xa_init(&vbq->vmap_blocks);
> > > +
> > > +               if (!cpu_possible(i))
> > Why do you need such check?
> IIUC, take this issue as example, cpumask is b101 and nr_cpu_id is
> 3, if i = 1, There is no need to initialize unused variables here;
> initializing the xarray for the hash index is sufficient.
>
But. It does not make much sense to skip initialization or keep it "half"
initialized. At least we can guarantee that all data structures are properly
setup.

One concern is what Baoquan raised about per-cpu variables. In your
scenario, b101, accessing to second per-cpu variable is not allowed.

So, we need properly check that concern.

--
Uladzislau Rezki
