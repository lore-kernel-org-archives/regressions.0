Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D50136C0BC
	for <regressions@lists.linux.dev>; Sun,  8 Mar 2026 09:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772963875; cv=pass; b=dhVyFYkoJ8qteV/z+iH+Ay8kK0NWQbEVNHACPFuNJE+8ZHGnUqTv7VuoNaVrt7mX9eVAHGvAq/ClkL/2vpaMPeDbwqC9AE/Lt6I9VogPY6SwAYpnSyI8STO7t8Ba4vNUxTZRdhx+6vup/O91bauIZy7AaxV8fM0p4m/DHVvhejk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772963875; c=relaxed/simple;
	bh=Vvxd/ab6l+0dULFpMMR+i2N7Xct9SlvBw5IaFdtl7/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXC8/+V5E0Nn4UcGkx/X+ak8sR65yju6gOBdWGBDPSUUuuGSAJ9UYwDPS4DJ7aOaiE7th1eCE1jgkRjwRMi3GzyPn6WfN/71nBSUUs4nfmne5Da2G8hPNbytHFx0xFPELQXsO0/b8o5e38tT9CLtnHIKLe+mqQJ9Qop3O41sZnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2yrTBTI; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2yrTBTI"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-798617c0ad5so59200527b3.1
        for <regressions@lists.linux.dev>; Sun, 08 Mar 2026 01:57:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772963873; cv=none;
        d=google.com; s=arc-20240605;
        b=Uv636vP84DsTG52pr5VHj5eUHM3Fi3dRUp5wyGx5RNwczGR7V30uQf8TuQ7BB3FUDK
         CoIELLg1wat6mKTlPSPkzit02LsW0+P/LVCe2Tfb6wFFCiqpKItt/TR85GKIG0PtV46x
         11qeL5D+pozBGf9auUVerYNZxh8E3COPAlX06O0B8eWpH+qwKE5C4+jDPJha4EU1t/yr
         sgKmTNTLo3jURAf/8iWH2K7bWowmdf0+6B2mGz/NXDhnVVB8k0Dbyi7Fx78+lWg1Ddca
         xl3MFzOIeK91wrR/hVT3DXKXH88yF+wI98vv7bZj8lLo4bL69lzYAFFE4tCr135mvzeq
         gwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OHApVhRpgBms4jT3GrxYX42NYRA/ImfA8E/bLAmLCdA=;
        fh=h+JjZ+OYSYfoq+InP+qhlASAoJpl+mDwN2hhhYynYio=;
        b=jK5lAocqe86dMAg9vAjqVjCouz2keS/tiqALwJfzKH1lugxGst8BaNhGGLDXgoO1kT
         qX0lJIAk3pAUbLSgQpL4OCINlCekV6cBGal5K3hegYRIWwPwCdw6bVYYKE/+fhFhJtQi
         oszz63dkAmwyc7D1goHJ6c8Mn2PqHVIJ3lzOdMa+9oXCvZT/EVyKj00LS4/g7K8CJ423
         dzhBrJnG+Li5BAoe+67VqQFNNm03y6tETeEKxZx6Ml+3hmnBxUVYmgAQ8qjTvms/iR4a
         Bf7YWaEvdxooEiJvNbd6axU1QZQS9SZ5esWFyWqC5IXhHC5dWE9f+Ojdb+kjIzM4Wv3Q
         GtCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772963873; x=1773568673; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OHApVhRpgBms4jT3GrxYX42NYRA/ImfA8E/bLAmLCdA=;
        b=e2yrTBTIQcr1f6aevvIlSEotZfFSEQKTf6sQA3pvrFt2qUv/g050D3ApU6CXbJ1yIi
         bkDu3SNdinYIiAPyUabkcnKnrCN0Z0sV8plYaDnDWChZZ6BRd9TKE7hRMIrBl/CXB4+t
         MQVqbU4GawZpxtrB4D1e2s+rmja8M5uA6iYAnu64U9u0lw6IZorBahIjFL+kziEuHNEt
         EGPH2tokEoHWHxq45gMzUnxoADJlfRRYIrilbGzVFcr0BvvARiIDZUgWhSDTcNLWknb1
         9F64247YZrbK35jf5tg9EAKVJXLqQRX17wh2CuLoEGMSCQ+9SlYzLWZQ+N4lN4yO4zPh
         n1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772963873; x=1773568673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHApVhRpgBms4jT3GrxYX42NYRA/ImfA8E/bLAmLCdA=;
        b=EnQCjiKWwlP0A6EkMyXiBExiRfB2ws5JVSEcUDlsI6CaPb4v/gNT8//dfHP1TtbTWV
         /ZNpfiv6+W2LX07+/WXXQS9+MPviVfElf9CicQYPmogQPXfYKMgaoJHxxEqmlJpBdofI
         Fx5yympDixUI3T+pQaHN19DnJx+RtRQBGBht9cDAlUb8XszY83SG1GxaBNC287lyeeYo
         nPPuexpGMQZ/PfMaQ2nnAKp36LmxDtr/1fQsDjz7PhEEW42YwRNvlstC3GmkwLM5RAb+
         frrKVdxAE2jEu2e7nzO8W+uv3l5jaR8CGfWcbe+VkQQUtvBMtRDfYQ+EwACgGA35pJfq
         HDFg==
X-Forwarded-Encrypted: i=1; AJvYcCXgHiCzYp6CX4dDzlzt1/ZKFd3X8PuQ5/LsMZ2BSTaLiy7DVsw329iyGUmNOLBjX4w+HDzw+ZXEE0PxyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVKBlDgSFCxSlvSObNwMABiPXQ0ACJFCJYOiZIZecPw4265kBd
	g1L2L6GeA0zDzZS+NBbPF3Gm6/n9Xrh/G/RlNFjkbovX/IwEMNZdCM+dx2U7cNODihNu9Lih207
	jyaDo8DlXt9+qanhaNQD0fXiiCH29Sp8=
X-Gm-Gg: ATEYQzxglmMIlGnAk4tEnnfeqkiFBDu3RQAuL/DXe8J1b0plN7QVn86GAw26yU8jY/Z
	TUgSZcDVWYLJXC1tSXiZgZcxz7nwthJcAjDu0Lq2n1qGN9viygM2FuWGTiJ1On2Y/x3FRP/O/PN
	m6NNF+UJ/pr8HwFgBT+rYNlcRnEFhxoke0MZ6BW+0CrkwaK6wst2wDByedkyiNlEeE3Q7HgYOdX
	AQ+yF6J2NPAauUDLKSCBYCoJC/4Mih08Ux9rYZpugcDTBCog4iXHZ2xObx+Yh7imzCeySzJcPod
	5MxSJKi0
X-Received: by 2002:a05:690c:60c1:b0:798:1219:c780 with SMTP id
 00721157ae682-798dd67d2e0mr71860667b3.26.1772963873226; Sun, 08 Mar 2026
 01:57:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+tjKGrmADg=oG9CT74_mgGNN3h17=LLmnv51K=MggAqo7q2Eg@mail.gmail.com>
 <2026030839-applied-prominent-b774@gregkh>
In-Reply-To: <2026030839-applied-prominent-b774@gregkh>
From: hgfdgjn <shichuanyim@gmail.com>
Date: Sun, 8 Mar 2026 17:56:44 +0800
X-Gm-Features: AaiRm51SQeSnd_04IO3aC60QnGAmb4XpulyijeEO_HuTpW5Xx2vxx8EEQKdyFwk
Message-ID: <CA+tjKGoWW70TRw6C+PMDbhpCh5P_jyJ9ciY3HckJystb+X26Mw@mail.gmail.com>
Subject: Re: [BUG] HDMI monitor shows no signal when the refresh rate is
 higher than the default 60Hz
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, rvojvodi@amd.com
Content-Type: text/plain; charset="UTF-8"

7.0-rc2 can also reproduce it; after locating the issue, it was
reproduced using the stable upstream master branch.


>
> On Sun, Mar 08, 2026 at 05:42:39PM +0800, hgfdgjn wrote:
> > Hi maintainers:
> >
> >   After updating to v6.19.6 on Arch Linux, if I set the refresh rate
> > higher than 60Hz, the monitor displays "No Signal".
> > I tried bisecting and found:
> > > # first bad commit: [3471b9a31ce352ffb343cf02a991261880aac3a7] drm/amd/display: Rework HDMI data channel reads
> >
> > This issue on my machine was caused by this change:
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> > b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> > index 267180e7bc48..5d2bcce2f669 100644
> > --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> > +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> > @@ -549,7 +549,8 @@ void write_scdc_data(struct ddc_service *ddc_service,
> >      /*Lower than 340 Scramble bit from SCDC caps*/
> >
> >      if (ddc_service->link->local_sink &&
> > -        ddc_service->link->local_sink->edid_caps.panel_patch.skip_scdc_overwrite)
> > +        (ddc_service->link->local_sink->edid_caps.panel_patch.skip_scdc_overwrite
> > ||
> > +        !ddc_service->link->local_sink->edid_caps.scdc_present))
> >          return;
> >
> >      link_query_ddc_data(ddc_service, slave_address, &offset,
> >
> >
> > It appears that scdc_present is always false on my device.
> > I reverted the change to write_scdc_data(), and the monitor works
> > normally at high refresh rates.
>
> Can you cc: the developers and maintainers of this change to let them
> know?  Otherwise they will not notice it.  Also, does 7.0-rc2 show this
> issue?
>
> thanks,
>
> greg k-h
