Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DB815CD41
	for <regressions@lists.linux.dev>; Fri, 24 Jan 2025 20:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737750810; cv=none; b=G5ttvWt71cuVXMBQKKKFIuDhPP2ez86GiO9Ir/zBwp27Vq24mqR+ZXU1LJXDplJwcx19cUWq1eSSwgIhQMo2twVKwtttL7MQGPaoRkHCcrxz1uo0C6R7p9twoc5cJh7xUjrTH3Qa0PWiAmDLgrzOn7fC8o4ngyhgG3o84RdY6tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737750810; c=relaxed/simple;
	bh=s93EMZD4m3gkZOXEJ3DW4gx8xDCIov5mMjLNEBYfBFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B53d/bzRZk+lCgkg2qh8dDBEPCUmufMauOF/kKwKf7yEZBS5mgK0eFI++A3KZbKbrvgNMaWIiJrMXERlk2ljYP5/ErvfvKSeU/R6ORfw6l1kbjs7vmBieuPZUjPCku72GCNMQoJz5nhGFWa1EAYKo5yVwPBVaH0r53IDfJKbcUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QK3xzCGJ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QK3xzCGJ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5da12292b67so4096843a12.3
        for <regressions@lists.linux.dev>; Fri, 24 Jan 2025 12:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737750807; x=1738355607; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=msOjWPCAw9ERGmFTcL2VnbWPOioG/2+WNCrXcGF3mYg=;
        b=QK3xzCGJUzGRv+qusCK47Bv6aQflCoBg6y51H7VCMZ3mx8Di7f+QFi6E+PzdrdI32W
         c5QrZpUhxOxh9jA6PGhCjt3XB8dWtFMRp31CLeYk06egyzFwyld9EldA+c8g1hFMj2S0
         tDvfycL+6xsivl4dV91XjVsDJpqknk+ors23ucD3t4hJF1qh8dGXjp504NmWakIF4Dxu
         JSWwCWNEN4VH31j8xGbxqwN9fsQjur0iftGuInUVej+mFaFzWuVsUefKL3eCkoY0sOE4
         67qMeMqx43UUrdTUOfggd/muwYWGmtbDw1viMW4uvGJLGPU/ZOIUvIPvvqBcvaTZzz6A
         tRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737750807; x=1738355607;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=msOjWPCAw9ERGmFTcL2VnbWPOioG/2+WNCrXcGF3mYg=;
        b=Lia+2PFXrcpx6xN88MjCbdxJz0XEICNSllxUmYo5gleJjlX9rcxfupQ2L7E5lvU96r
         9txIoLqqmspT9TNQC6vZYqwBZKabRRAv6Bgm+BUmCfiUP7y+w8wShohRccYHX4fw904q
         9eT+dUTWANGUnPzNbL1pXe7qpF9VmzV/DAsRmKZvYtEtm7ao5q8SbDCbGTX+BZubVBMS
         nGQjnPZIKfrEaDV3hBaTY7U95ZMlKPt4QquTWWHOK+aQSFsSj5z+/8UyH1acZMrgUeF6
         k/jco4NswUdLQhsASuwSsr5vFxYZdhs80zL2khKdG8Qc51S/2G2pxJDL6NQVKiJPsKYl
         xkkw==
X-Forwarded-Encrypted: i=1; AJvYcCU5rqNKtoBr5sfSkQl0ZWSP5qFWQ1W/bPiaI53nIn1EWvtdjlv8sCpPUDgj4y/dN342tclEYEsHJ2DBWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXeSQF0yeSJlDv2WOwtcWuLZ/rdrk/84IFlar6YqmDxH2FffLR
	T65ZBFXM0jYSIFWCBRPYjbXl0eg/SLZ604VBvbJljegBPG5sdwsu
X-Gm-Gg: ASbGncu+YXcEKcXkCgKQU8R4ouhDzUvthLJDwfOtImXFFhgqaY80Gc4A5WtpwU4/Wj7
	wuV6+2ns/Nof3GYzN6MdTziIpfmBxzutuTqoJ7ziXEDqezDHt7BM1gsdb3/s5ZCoj1smLaViTGT
	4YYqAS82VGW8t2R/en1l35VtM2cKUf3LdC6btexCtXcJ6bG0MMX48yNBLkNKu2dP4V9Gx+Rdt6n
	QbEb9++M1avqrF1nZOWTsEXiThIi66DXjZqoI6JzUynf7BiDzLsBKvjINeG2xdgasLwpgFtfBeo
	9HZnWjSyLhtsxHr02ggmVxi4WHsvKtm/MfCtzA==
X-Google-Smtp-Source: AGHT+IHvvXeAKfyUkxVzya16gkKrn7S0nF6i51r0gWyL32XeA+yVKQs3IGPSM4kG4Phzg3OG/7tWhQ==
X-Received: by 2002:a05:6402:50d4:b0:5d0:cfad:f71 with SMTP id 4fb4d7f45d1cf-5db7db2bea3mr72880269a12.32.1737750806940;
        Fri, 24 Jan 2025 12:33:26 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186191ebsm1593746a12.11.2025.01.24.12.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 12:33:25 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id E261CBE2EE7; Fri, 24 Jan 2025 21:33:24 +0100 (CET)
Date: Fri, 24 Jan 2025 21:33:24 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Xan Charbonnet <xan@charbonnet.com>, 1093243@bugs.debian.org,
	Jens Axboe <axboe@kernel.dk>, Bernhard Schmidt <berni@debian.org>,
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Bug#1093243: Upgrade to 6.1.123 kernel causes mariadb hangs
Message-ID: <Z5P5FNVjn9dq5AYL@eldamar.lan>
References: <173706089225.4380.9492796104667651797.reportbug@backup22.biblionix.com>
 <dde09d65-8912-47e4-a1bb-d198e0bf380b@charbonnet.com>
 <Z5KrQktoX4f2ysXI@eldamar.lan>
 <fa3b4143-f55d-4bd0-a87f-7014b0fad377@gmail.com>
 <Z5MkJ5sV-PK1m6_H@eldamar.lan>
 <a29ad9ab-15c2-4788-a839-009ca6fdd00f@gmail.com>
 <df3b4c93-ea70-4b66-9bb5-b5cf6193190e@charbonnet.com>
 <8af1733b-95a8-4ac9-b931-6a403f5b1652@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8af1733b-95a8-4ac9-b931-6a403f5b1652@gmail.com>

Hi Pavel,

On Fri, Jan 24, 2025 at 06:40:51PM +0000, Pavel Begunkov wrote:
> On 1/24/25 16:30, Xan Charbonnet wrote:
> > On 1/24/25 04:33, Pavel Begunkov wrote:
> > > Thanks for narrowing it down. Xan, can you try this change please?
> > > Waiters can miss wake ups without it, seems to match the description.
> > > 
> > > diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> > > index 9b58ba4616d40..e5a8ee944ef59 100644
> > > --- a/io_uring/io_uring.c
> > > +++ b/io_uring/io_uring.c
> > > @@ -592,8 +592,10 @@ static inline void __io_cq_unlock_post_flush(struct io_ring_ctx *ctx)
> > >        io_commit_cqring(ctx);
> > >        spin_unlock(&ctx->completion_lock);
> > >        io_commit_cqring_flush(ctx);
> > > -    if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN))
> > > +    if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN)) {
> > > +        smp_mb();
> > >            __io_cqring_wake(ctx);
> > > +    }
> > >    }
> > >    void io_cq_unlock_post(struct io_ring_ctx *ctx)
> > > 
> > 
> > 
> > Thanks Pavel!  Early results look very good for this change.  I'm now running 6.1.120 with your added smp_mb() call.  The backup process which had been quickly triggering the issue has been running longer than it ever did when it would ultimately fail.  So that's great!
> > 
> > One sour note: overnight, replication hung on this machine, which is another failure that started happening with the jump from 6.1.119 to 6.1.123.  The machine was running 6.1.124 with the __io_cq_unlock_post_flush function removed completely.  That's the kernel we had celebrated yesterday for running the backup process successfully.
> > 
> > So, we might have two separate issues to deal with, unfortunately.
> 
> Possible, but it could also be a side effect of reverting the patch.
> As usual, in most cases patches are ported either because they're
> fixing sth or other fixes depend on it, and it's not yet apparent
> to me what happened with this one.

I researched bit the lists, and there was the inclusion request on the
stable list itself. Looking into the io-uring list I found
https://lore.kernel.org/io-uring/CADZouDRFJ9jtXHqkX-PTKeT=GxSwdMC42zEsAKR34psuG9tUMQ@mail.gmail.com/
which I think was the trigger to later on include in fact the commit
in 6.1.120. 

This just to give some datapoints on from where the request comes
initialy and for which problem it got tackled.

The following is just to make the regzbot aware of the regression:

#regzbot introduced: 3ab9326f93ec4471cab6f2107ecdf0cf6a8615aa
#regzbot link: https://bugs.debian.org/1093243

Regards,
Salvatore
