Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6B81B415F
	for <regressions@lists.linux.dev>; Mon, 25 Nov 2024 17:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732555013; cv=none; b=Bxauuh/Zic1lorjTXTkJ2h8rUdwpDjbYJuJuVo9If7lr+4ZilJfufijtHEaJzHVMghveonehNc28WVBLij5CleE2I3eYT4Xyu8T9fbYyUpf5iioWB+BrWqpKCnoVi4gyr70Ho07M3Lo6/Q5a2WeVhfNUlTMMLHrQpCwW1c2h/TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732555013; c=relaxed/simple;
	bh=+4u48gpD1Jj6Cz+HFaPKL6LTmpdlPUj6k1KeEetzyOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbJxozWzFwX0sNj9yLPp3tGBa8flSDdRjD2G2qnzzCQWrLppXNrZcpmsPsKJ3cQUnwJ2tuzj6KsfGPtGE7OKpiXlcZpmEBvWSj7fbphPJxMFR12pmY4sLVhq6HK/HgFKlFlo4tUS77YFrzH9SP+9E0FO43tDeVzSCXq3YJqFA3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1qOPWJx; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1qOPWJx"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e2bd7d8aaf8so4377317276.3
        for <regressions@lists.linux.dev>; Mon, 25 Nov 2024 09:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732555010; x=1733159810; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ia/d0zzH9PgohmxMU9kgpub0xyeSlReyHlI7D5sBI8=;
        b=M1qOPWJxUAmgUdYTwsrf19q/KRvL/C5c8j+JQdKiCtGQ6fr6f8w5ONOugqFKGVfzwh
         LUn/gbincI5n0OEyiE/oi6IB0it4XuzZ5raEUVd2ILwscZYry+QolZFifmRxayNO2pXP
         sjjkk8db4+EmwiLVmSpPXWN3Up2i/iJa2cFqu+r7sIH0C2iXDRajdVl8EPiAN0UfrxkS
         ATHfceSFLejDK7VkigLM5bDzO4om7aJiLlqFmrcBANr83xbnN0NSuh7m39WcpgSBTavM
         uFCAzPnQoGUWabiMdcYDyqIdw5hVE+0o+3KzH9or8kAL1WmwQuzB5dHKAX7zedfGlMWb
         KTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732555010; x=1733159810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ia/d0zzH9PgohmxMU9kgpub0xyeSlReyHlI7D5sBI8=;
        b=WO9FJCbm23evj+yvQ29Wimq4/dzs4h/zcN32HliBHa2ujjzDRTK2hW1hiNtG774D34
         5kY/8QQ7uZXSInTCfg9MAW4G1sOlwQSXzSlhRGkbnP29shZs1Fuq9h3beD0zuJqPr6oC
         ln5QXh62aKlTKQAB7AlCwo4numyeSipCJLCUWuT291aL0s2mbnovVnKK0TPBjMqKjmwY
         M85bzbMeGR37Tuwd/TBI23T//4iVfrL9hbFrIYIEhq8xKasVjHPag/ivd6R9iqNuCZh5
         aenm9Fl3ILs1Ik8fRUJbYOIQG+cIuy+UrsCiMk/w49xDNpuW0JPl3cLDYxz+Jd2vvxDC
         oeTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnzqPfFJLhrv2ccdy0iG0KdniGR0c2la/0U6xeV3os+o2g06oW6Dj2CZZsBvUqYCkqHbZ0EY93eOpvIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpeFh72lJ/MnnKkEnX5LiIqXEvc6MhmymuCgo2S8+j9uxgmC+k
	pfMT/KGa121zQLVGjSM2Zv2n1LSPzJ1JZA620LMPWiWkLD5mzlbdhMepsl2LsHzMGlhPx3Xecd1
	3G35FOYyHpDqGevgPgMFd254McCY=
X-Gm-Gg: ASbGnctzkQYt/re3zh5g+s9q9mEcGXo7H7r5x+Aj7nTQdOy3+fz6Ox5YINkHYr1DK2c
	G2ObAJ6DdlKb5wcZdHhv46NWwZJjDUi4=
X-Google-Smtp-Source: AGHT+IFhHP9m3zecw8OEgG02F3A9OsXXGwtA63gEpzTtaUkQlDZ70T/ymKlRRC3X1ecvprD6C1YIqfbDKWDJyty0d2g=
X-Received: by 2002:a05:6902:33c6:b0:e38:f11c:f04e with SMTP id
 3f1490d57ef6-e38f8c27cf1mr9355829276.53.1732555010479; Mon, 25 Nov 2024
 09:16:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAP-bSRbCo7=wfUBZ8H7c3Q-7XSG+SB=R4MHHNNGPvBoinsVSZg@mail.gmail.com>
In-Reply-To: <CAP-bSRbCo7=wfUBZ8H7c3Q-7XSG+SB=R4MHHNNGPvBoinsVSZg@mail.gmail.com>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Mon, 25 Nov 2024 17:16:39 +0000
Message-ID: <CAP-bSRab1C-_aaATfrgWjt9w0fcYUCQCG7u+TCb1FSPSd6CEaA@mail.gmail.com>
Subject: Re: [REGRESSION] ioprio performance hangs, bisected
To: hch@lst.de
Cc: LKML <linux-kernel@vger.kernel.org>, axboe@kernel.dk, bvanassche@acm.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-block@vger.kernel.org, 
	semen.protsenko@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Nov 2024 at 15:44, Chris Bainbridge
<chris.bainbridge@gmail.com> wrote:
>
> The commit 6975c1a486a4 ("block: remove the ioprio field from struct
> request") appears to have introduced a performance regression. Test
> case is the script /etc/cron.daily/locate from package `locate` (which
> is from findutils locate on Debian). The script runs:

I did a bit of debugging.

The problem is the function req_get_ioprio. The commit changed:

 static inline unsigned short req_get_ioprio(struct request *req)
 {
-       return req->ioprio;
+       if (req->bio)
+               return req->bio->bi_ioprio;
+       return 0;
 }

So when req->bio is NULL this function now returns 0. But previously the values
of req->ioprio were sometimes non-zero. If I revert the commit and then
instrument req_get_ioprio to log where the new return value differs:

  static inline unsigned short req_get_ioprio(struct request *req)
 {
-       return req->ioprio;
+       if (req->bio)
+       {
+              if (req->bio->bi_ioprio != req->ioprio)
+                      printk("req->bio->bi_ioprio != req->ioprio\n");
+               return req->bio->bi_ioprio;
+       }
+       if (req->ioprio != 0)
+               printk("bad ioprio 0 != %u\n", (unsigned int)req->ioprio);
+       return 0;
 }

then log shows:

[   36.922906] bad ioprio 0 != 16387
[   36.923061] bad ioprio 0 != 16387
[   36.930186] bad ioprio 0 != 16387
[   36.930680] bad ioprio 0 != 16387
[   78.875421] bad ioprio 0 != 24583
[   79.228801] bad ioprio 0 != 24583
[   87.411118] bad ioprio 0 != 24583
[   97.419607] bad ioprio 0 != 24583
[   97.421059] bad ioprio 0 != 24583
[  107.210364] bad ioprio 0 != 24583
[  107.210775] bad ioprio 0 != 24583

So, the new function is returning 0 when it would've previously returned these
non-zero values, and returning zero breaks things.
