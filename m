Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770E912B17E
	for <regressions@lists.linux.dev>; Tue,  6 Feb 2024 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707224215; cv=none; b=or/4t2pHQfiR36ndRndhEFE7lnzd4L9WijWKd/CVXwbiHixWCBiO0cUx/QpPt0q7BhmFNYnAjTaOE+hzO1uQb+ECPi6A+v0nksdtg0EVUO0JUKY9Ads7naYspAX/CbxUBXIhlNSJg+UETdh6YpGer19RAyOl4RhEv1oSgtB1tFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707224215; c=relaxed/simple;
	bh=5nc+dSrwAnzE25GipJSV9pefmc4RGp+04RrqQWJYpRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5ixSRaSVpeNd1br0hk5AmPfGLkioChXvb20BoAZJPH1daNdLGdAUo1vhQBYQuGv238COJ0rJDwXnIueo6ghI9p5FzLjJDR6l8XAsV7z9H13erIHKGCY5vgsU4z1d4Iwu4q/oZcpPla1Z0q2zZaNcXsQs/jL6oAytQzGHfh8UOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kwdplssF; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kwdplssF"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4c020f519f7so802611e0c.0
        for <regressions@lists.linux.dev>; Tue, 06 Feb 2024 04:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707224212; x=1707829012; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AGJfUloIH7xui8NFEtstIa05IECpt+Jab8Vg6t76P4w=;
        b=kwdplssF4FHjX467DSzgO0GPsrNudJ8whdLeXrUYcDqUaSdp7NfYPl/gQHlCqfzryg
         wf2B9xqC2kMpUWNndrXhZpD1xcHSBOAYPBdm2W97CMS4rg+2y34gfIW7Qp3mX6jTBMVZ
         4ytICwpQza2tWSTVCD8lZWl2wq5DwJm0iergLaikBJDPMqh4sjdht2M4S80M/E/s0mRS
         TDgpBGWkBZCE42vT3pmwr9CQ07KHReK4DxWOLwsfq3AVwGkLlePq7C7xMRgnvmf4yCzF
         0AloQkcBRllKc6PvEYb4c2Q15EkihxdS7rASvUN+vuetNA4mot9PhQDvyFlUV362+gwQ
         j2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707224212; x=1707829012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGJfUloIH7xui8NFEtstIa05IECpt+Jab8Vg6t76P4w=;
        b=wWZgWLCp5RHVh2vLSI0SUT+WDAixEylRv0/l2SBAzDmVZS+k3cBmOQSrJ4A4cyZUrX
         UuT5nYppW3dlqhqGucBdSWyfwuesPuzE8eNE0Irnt92bqPto8IIUmIYKzSZ5tZJoBw00
         i/5EwWrRyewBRbg20O80uAUUeHWtzJpWKLGUfPQFGacV8d2Rq9BnY9rd6cFyMm6hwkfp
         a1FXEc+qkXRzWnjCFJbJPI+BGZAg2aTWSWbUR0OJfZ1sdx+dgifa2bfu8Sp7bdxgBqam
         iSa40XsPkPo7PhZy5JlpHk26jqqVke+A5ZS1cHeDoDrYKZ3qkvKso55u0bCg97prUmfC
         7sUA==
X-Gm-Message-State: AOJu0Yy7pWDvGFR0jUT9Jo0bgNfMogD5i1E2rC6pDdbnG80X9AG8toNy
	EbeBDw8usNCfOobRLWMpnr/w6joOGkSi+226vqZNg7a/rhr0vBOkX89MUf2/KJ8IzhwP2eq2bUo
	3JjA1Q9s8WrqQaxv0JVJfd7omF7bzNRnomMQhHg==
X-Google-Smtp-Source: AGHT+IFS1PZd7e63zNC9r8KPu6xCRNyWYmZqFgNbrdl0EFkTq/aO1Lm+I9bc80TlV88R1TjdJ7cY5RYVnQe3pc/jcBs=
X-Received: by 2002:a05:6102:303c:b0:46d:2f1e:3d15 with SMTP id
 v28-20020a056102303c00b0046d2f1e3d15mr2561235vsa.35.1707224212310; Tue, 06
 Feb 2024 04:56:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYttTwsbFuVq10igbSvP5xC6bf_XijM=mpUqrJV=uvUirQ@mail.gmail.com>
 <20240206101529.orwe3ofwwcaghqvz@quack3> <CA+G9fYup=QzTAhV2Bh_p8tujUGYNzGYKBHXkcW7jhhG6QFUo_g@mail.gmail.com>
 <20240206122857.svm2ptz2hsvk4sco@quack3>
In-Reply-To: <20240206122857.svm2ptz2hsvk4sco@quack3>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 6 Feb 2024 18:26:41 +0530
Message-ID: <CA+G9fYvKfeRHfY3d_Df+9V+4tE_ZcvMGVJ-acewmgfjxb1qtpg@mail.gmail.com>
Subject: Re: next: /dev/root: Can't open blockdev
To: Jan Kara <jack@suse.cz>
Cc: linux-block <linux-block@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, linux-fsdevel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 17:58, Jan Kara <jack@suse.cz> wrote:
>
> On Tue 06-02-24 15:53:34, Naresh Kamboju wrote:
> > On Tue, 6 Feb 2024 at 15:45, Jan Kara <jack@suse.cz> wrote:
> > >
> > > On Tue 06-02-24 14:41:17, Naresh Kamboju wrote:
> > > > All qemu's mount rootfs failed on Linux next-20230206 tag due to the following
> > > > kernel crash.
> > > >
> > > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > >
> > > > Crash log:
> > > > ---------
> > > > <3>[    3.257960] /dev/root: Can't open blockdev
> > > > <4>[    3.258940] VFS: Cannot open root device "/dev/sda" or
> > > > unknown-block(8,0): error -16
> > >
> > > Uhuh, -16 is EBUSY so it seems Christian's block device opening changes are
> > > suspect? Do you have some sample kconfig available somewhere?
> >
> > All build information is in this url,
> > https://storage.tuxsuite.com/public/linaro/lkft/builds/2byqguFVp7MYAEjKo6nJGba2FcP/
>
> Thanks! So for record the config has:
>
> CONFIG_BLK_DEV_WRITE_MOUNTED=y
>
> So we are not hitting any weird corner case with blocking writes to mounted
> filesystems. It must be something else.

As per Anders bisection results the first bad commit pointing to
   ba858e55b205 ("bdev: open block device as files")

- Naresh
