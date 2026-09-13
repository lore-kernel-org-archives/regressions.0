Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AC83314C3
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789314426; cv=pass; b=TCHURFzp5d+cS50JhUk6j/3EKFijcDWprdV4iIXEdBlUmX6pySZ5HZKkgtAnt/k4TS4aVaONyEoqm4Kt5mtQNisTdWRkoxjq6idnlNgFjrm1cFtqToUzvw6+1k2zEB6/OkIlZEIagfU4rccMO1s9emPcKVKEaZU3GWh/fmpSEH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789314426; c=relaxed/simple;
	bh=KFkEvrKDNmPhRyOa4UUB93A5JAqNiBMds7vZAclPLSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7KU+n3wS4x++ofxBUhl1z2UmwBdwq94kRBtlQ55RQ6kqlzLOVxPTPDudp4Kv42mPqLGE06ZdGuIMevmKA2RGOiTNI/Tl7Ux8seAE2zwWOGClH0y2+Gw4qjfaphUg1Chh16J+p0BNzVcYbhYLac9mruhYk1mjBBpraUjKSG5SnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQAAOqj4; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQAAOqj4"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso7410521fa.1
        for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 08:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789314423; cv=none;
        d=google.com; s=arc-20260327;
        b=MKx7LdI5IrJRHiZnrRf11Vut1ZZgEMdRn04vLq40kZTIiEZ+6UDDXKPsqNGUGhGQrp
         cuyO75jd5vOEQGY3sfKiTI/eSzgbv0Rv7T84yYvvwhobIUps2bu+PMd46Awmze3L+MGW
         zdbpgtUCaE0RzDUwf4qdEC9d9ju6Bo4q+2nZiHxKPcBR4EQV5WOK0v9Y/Gn9nFkdxWKJ
         N6DSXYQJ6r00YW6jv2NCFBVhpeijcmm5OTt2dqzYl83JU4FZRBIZGfDhob4NMvChgkGj
         606emKDPnduLbH2dpN8r9r/ulzC3+bbnzGr76j9Q62Il7LKV8GVY9mUL41T8CPSpe/n+
         ZZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KFkEvrKDNmPhRyOa4UUB93A5JAqNiBMds7vZAclPLSg=;
        fh=2DFVIbM0iQd6BcEp3moM7bZJCSRVUb2UPj64eOpBBIM=;
        b=lcQYvFYfe62jURYRrKJcW2PZREn/nxq0a+NdcfDZCfi27l6KvdpFGxeeXrpKjgEAed
         6QdLO/zLNy5E+a8YZP7ACR4V6Uf7Yi79s2VPV91aW00Oth7XRWnV+zVjHxUig6Jx2Azt
         +cYU0AOMGsescJjMdHbPxmWaiplE/bGRwxcErwIBwhzuQUjUB6WSi0rfHELB0MpIM5bi
         6o44pq5HVn3JfVL/EPG5QvCG9O5ba7CZtSIENghtUde7ydwjVh7atmfBpmuE3AkJ34c2
         d2rwDzVwvLP7MoHPZ7psE7P1q+GMMLLif3t2XmJuLiIULwvUpLHMini/uEQwK0BOMuNb
         oJBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789314423; x=1789919223; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KFkEvrKDNmPhRyOa4UUB93A5JAqNiBMds7vZAclPLSg=;
        b=UQAAOqj4Tv2foHFQLO/haUYNlMien6xTIWUSlHRh7KUONDcsR0MgJ43F18sPcnPnbx
         pg33lHav69AjJl1FFDCHAqhOZGzpjPg4NHAUbdEBJo19LC0lMCgnAwz2zPLOOcXR8Lko
         35iEYfaS2TeBEm8xXrAnwFXjhoyOhGGeqI7U3vuALRSmdlw/RIwkYTXQcZUWesXAr5be
         PM2KwXN6ToLI8EFK97OV3bevT0BvcIhCAILZgG7KwKNWYbbHdEJaSrd0aR5DYbfPPyqe
         xOHS3WxHaZ4V149eJGSzfnZk4IoKlY7mA4y1ZBjq/I78NsBtMGkgQzdBfbqEN8k4r6gY
         MrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789314423; x=1789919223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFkEvrKDNmPhRyOa4UUB93A5JAqNiBMds7vZAclPLSg=;
        b=AN4oADuTjr9SPYdq+NUpLMUs/vs8AkTbvfDbe3NRRj7/vxzA4PDvYj8l3dNBpPhmti
         D5lC/1Bdqr/8zVRygUTl6PvFwBAeJgLUhMBG5CjTKfPUPyoazzefawyXEY/jOEGX56IN
         q3kRAwRxvy/0khSjZbMZpT6jIrr3k/FuJQr3bisQJBNb4rMGpoCWCI9lYyOShs1sEzP/
         QYmTHT87wBKa898dU+NIMQg78W+dqQsvLRJp+pTwseB189LJn2zz40Jn50MB4Wn6zECF
         dqYCIg18tfH3C/nPgKfMT7ttUWjYpo2MYE7FqVmY6lobE+U1B96RwJMOWrO/+32QoqLS
         J9Fw==
X-Forwarded-Encrypted: i=1; AKwUvBzcGIx1GMTCcBYN5pV393cU5UMktEyA2tAOpYBWZdS4LtbfudMAWDGyVe3DmxjIxSAmwbFBVBSSbFAUuA==@lists.linux.dev
X-Gm-Message-State: AFuF++k9WwMTUVy/uAwHMk3CEekbwa8zXo/26WlOrJVoyYGW0tAeEFdy
	kAf+8BbjA4H/OFmk6agH6VBa6PsBYl6EAvXQOb/ovOPsraJhihE48PDBD9KaNHvb8zjJNkNJX9a
	LLVtLgIZ13PeTynKZTP2AjtDyIbacikM=
X-Gm-Gg: AYBFou3x7rYcDZN0npPgkVbXmhE+Z27qp0WkHXqBJp+OnlPxzHIDYWTnfHmPL54o5LE
	EcMkMkxaWugKQZDpALpEQqHgJl0Uo1B1tMIUG2jkzItaiAln6P/1VsGvAUV+QSPrA+9R9tfKuj7
	GVwiGEWYjNf8J/JcfhylZOBvhNcH/LmMN35ni+hJJJaVj805Fl22oDHfhioWgUL2wrBSK6dVDGX
	CoBrvY3vqADqLjfmt8X/pVMUwrL3raTdHLq10+Bcr2d2YKrDK8jck6Rkw0hVLd3tn5UNQ9vbRAK
	61FRNci9ZceUThiiWEhnU1tqCkRB+uqieZW2XtTm5VqEW4hscptVzifgWADhYHUCZriKIcMhzWI
	W/hRbgubD7iZkFA==
X-Received: by 2002:a05:651c:154b:b0:3a3:7681:6d6b with SMTP id
 38308e7fff4ca-3a5b38161b0mr10553231fa.20.1789314422665; Sun, 13 Sep 2026
 08:47:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANGjgdn=H50AaA-+O_GA-hkE9UwLANmkjx1zRsKUzxF5za8VfQ@mail.gmail.com>
 <aqa7KgIJYGgf7INk@slm.duckdns.org>
In-Reply-To: <aqa7KgIJYGgf7INk@slm.duckdns.org>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Sun, 13 Sep 2026 23:46:50 +0800
X-Gm-Features: AcwNN1U3jyA-1tSNpP-D9guvtV6T3al2eJNkQEtzf0t-dPsWgp_KnaGhqsq7NoI
Message-ID: <CANGjgd=f9n7zEZS=xi71y_dY6Uk75_qgP9qVDkYBusNz9sp2sg@mail.gmail.com>
Subject: Re: [REGRESSION] kernfs: empty cgroup rmdir latency after
 delete-notification changes
To: Tejun Heo <tj@kernel.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jan Kara <jack@suse.cz>, driver-core@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

Thanks. I found this during research into kernel performance regressions,
using a microbenchmark of cgroup creation and removal. This was not
prompted by a production issue.

I reported it to document the added removal cost and ask whether some
of it could be reduced while preserving the fixes. I agree that the
roughly 3 us increase per removal does not, by itself, demonstrate a
significant impact on real workloads.

Thanks,
Chengfeng

Tejun Heo <tj@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=A5=E5=91=
=A8=E6=97=A5 23:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Hello,
>
> On Sun, Sep 13, 2026 at 10:43:04PM +0800, Chengfeng Lin wrote:
> > I found an increase in empty cgroup removal latency across 507d8ce13f5b
> > ("kernfs: Don't set_nlink for directories being removed") and eea5d2bb3=
4ba
> > ("kernfs: Send IN_DELETE_SELF and IN_IGNORED"). With sched_ext disabled=
,
> > rmdir() went from about 6.5 us to 9.6 us, an increase of 46-47%.
> > The result held in two independent runs.
>
> I don't want to make cgroup removal unnecessarily expensive but at the sa=
me
> time it's not an operation that I consider to be a hot path, so as long a=
s
> the operaiton can finish in a reasonable amount of time and single digit =
us
> definitely is, performance of rmdir usually isn't something which is high=
 in
> priority. Can you please detail why this matters for you?
>
> Thanks.
>
> --
> tejun
