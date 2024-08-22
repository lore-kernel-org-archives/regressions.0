Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8F81CB328
	for <regressions@lists.linux.dev>; Thu, 22 Aug 2024 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724333562; cv=none; b=Ope+NdBv32WqZVPh1iGiHOQIm7hMYgiZBaNImA5Y1PjLDYUyt2zrnRIvbNIKIwKb+tvkwyTDu8AUO5Yn/BaUPO+kGdJSnOjTmt03RW2ZKcsM1Tz+b418Ci4tSklHXKev3pC79jIlDjjBhnw1IS8FgNQw50QQMtWB0GLL2xHBqXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724333562; c=relaxed/simple;
	bh=Lf9V6fCYIzF7uJsd37I3JGDUO0MwQp04hM5OFcip8cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6PbgNbUotG9g3SlEEG0KusxWfzVt2uqw6ROsdc7tEbVXTiT/oogyHbZubTDK1JD4yEM34ZsVID9YYKiMqUmUCPGelE8aoFP/SD3RhkJPLI2bWLClYbykqO9dAX36OGovke5+QGug/KKANOmr6j6kAquVVQk3P/DjNWIplQuk88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=RgBssCIv; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="RgBssCIv"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-533488ffb03so1111990e87.3
        for <regressions@lists.linux.dev>; Thu, 22 Aug 2024 06:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1724333559; x=1724938359; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dgJuqwjtLsqyzeFlzrgcjfBD8cjaZKtP6bxn0dldtik=;
        b=RgBssCIvmPRsu2QCrZtaoUmSNwq3SpQmMfh1rQvhCAnkXyvo8lBVlwh2tTFAaF3rc8
         Zg30jlopFbwnTy0zSPfNfKA+/m0b8JIaR/QPylUuhQi80Jx34LZoA0U7O4MXKZnlEQwQ
         G25Z9fymwI0OLFF1cv7F17XaoAl+h1gT8QrEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724333559; x=1724938359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgJuqwjtLsqyzeFlzrgcjfBD8cjaZKtP6bxn0dldtik=;
        b=Zfq2HHR/aAkPW/576Q8F593OAMLbywzw6ZI46kPysSaKGIIBlwbnhAwEPKCohRD+/c
         ko/MnJRzlVLlm7AmKTuPKy1vWsBaHkeWLaLjFKD3noQgVqxZP4wC5u1wuO6ni/d1UADr
         SypEkfZuEKh8rCkjVPqORn1Krdxw6p0wArXHRM3MPRCCpNDeGf3u/EzwoGfGmzoepwjZ
         CDimRl/P3cymNMpdK6pPgaaWCUa7a/heatYt4Dwt124vy67L0CadjHFDTaxy7srQc7QU
         pCgqNnV9q0FBMksocK7PLcoepROhfK02UrLSv9LmoxcTsrXlQUJt1bc5hivh0MVmOU+c
         0T1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcV3ZsVfA/VyuGQCQjJjFma3NZWc1VULxmbrPtGemRoIndecr4fCWTWptUjEoPR8B9PztL+GDN2E3TJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGlPWzvKjVN9TfsnIK01jtcvt3qm/0m/Goa1UZNel8QQsEyZw+
	9/I8exwddWdzDy+iWuF6tx1KcTFpz8NOFHa6KqOWVz3SLq5xQSdPwSBks5gy8cBYW9S0UCkVvh3
	c0YMkmeGGjR/OegpxHPHQlquD0ZsUJZNMK9HESg==
X-Google-Smtp-Source: AGHT+IFxNxuP3oMGnbzWP9FzrEwwGRUp3/JCB+vBes1tnAcy1svABdOqo5NFhOzDuT85yBCt8YtTorS/phZDihyIgSA=
X-Received: by 2002:a05:6512:b16:b0:52b:c27c:ea1f with SMTP id
 2adb3069b0e04-5334fd59032mr1323306e87.55.1724333558605; Thu, 22 Aug 2024
 06:32:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <792a3f54b1d528c2b056ae3c4ebaefe46bca8ef9.camel@bitron.ch>
 <ZrY97Pq9xM-fFhU2@casper.infradead.org> <5b54cb7e5bfdd5439c3a431d4f86ad20c9b22e76.camel@bitron.ch>
 <ZreDcghI8t_1iXzQ@casper.infradead.org> <CAJfpegvVc_bZbL1bjcEbEh4+WU=XVS94NMyBPKbcHzAzyxM6_Q@mail.gmail.com>
 <ea297a16508dbf8ecfa4417cc88eef95b5d697e8.camel@bitron.ch> <CAJfpegsvQLtxk-2zEqa_ZsY5J_sLd0m4XhWXn1nVoLoSs8tjrw@mail.gmail.com>
In-Reply-To: <CAJfpegsvQLtxk-2zEqa_ZsY5J_sLd0m4XhWXn1nVoLoSs8tjrw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 22 Aug 2024 15:32:26 +0200
Message-ID: <CAJfpegtNF4yCH_00xzBB1OnPBHk+EP0ojxDPp=qCFVKC=c14ag@mail.gmail.com>
Subject: Re: [REGRESSION] fuse: copy_file_range() fails with EIO
To: =?UTF-8?Q?J=C3=BCrg_Billeter?= <j@bitron.ch>
Cc: Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="0000000000003d0742062045b1fb"

--0000000000003d0742062045b1fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Aug 2024 at 15:14, Miklos Szeredi <miklos@szeredi.hu> wrote:

> > > What I don't understand is how this results in the -EIO that J=C3=BCr=
g
> > > reported.
> >
> > I'm not really familiar with this code but it seems `folio_end_read()`
> > uses xor to update the `PG_uptodate` flag. So if it was already set, it
> > will incorrectly clear the `PG_uptodate` set, which I guess triggers
> > the issue.

Untested patch attached.  Could you please try this?

Thanks,
Miklos

--0000000000003d0742062045b1fb
Content-Type: text/x-patch; charset="US-ASCII"; name="test.patch"
Content-Disposition: attachment; filename="test.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m05bnet90>
X-Attachment-Id: f_m05bnet90

ZGlmZiAtLWdpdCBhL2ZzL2Z1c2UvZGV2LmMgYi9mcy9mdXNlL2Rldi5jCmluZGV4IDFmMWQ4YTAy
M2QzNS4uN2NjNGY4YzliODk2IDEwMDY0NAotLS0gYS9mcy9mdXNlL2Rldi5jCisrKyBiL2ZzL2Z1
c2UvZGV2LmMKQEAgLTc4OSw3ICs3ODksNiBAQCBzdGF0aWMgaW50IGZ1c2VfY2hlY2tfZm9saW8o
c3RydWN0IGZvbGlvICpmb2xpbykKIAkgICAgKGZvbGlvLT5mbGFncyAmIFBBR0VfRkxBR1NfQ0hF
Q0tfQVRfUFJFUCAmCiAJICAgICB+KDEgPDwgUEdfbG9ja2VkIHwKIAkgICAgICAgMSA8PCBQR19y
ZWZlcmVuY2VkIHwKLQkgICAgICAgMSA8PCBQR191cHRvZGF0ZSB8CiAJICAgICAgIDEgPDwgUEdf
bHJ1IHwKIAkgICAgICAgMSA8PCBQR19hY3RpdmUgfAogCSAgICAgICAxIDw8IFBHX3dvcmtpbmdz
ZXQgfApAQCAtODM0LDkgKzgzMyw3IEBAIHN0YXRpYyBpbnQgZnVzZV90cnlfbW92ZV9wYWdlKHN0
cnVjdCBmdXNlX2NvcHlfc3RhdGUgKmNzLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VwKQogCiAJbmV3Zm9s
aW8gPSBwYWdlX2ZvbGlvKGJ1Zi0+cGFnZSk7CiAKLQlpZiAoIWZvbGlvX3Rlc3RfdXB0b2RhdGUo
bmV3Zm9saW8pKQotCQlmb2xpb19tYXJrX3VwdG9kYXRlKG5ld2ZvbGlvKTsKLQorCWZvbGlvX2Ns
ZWFyX3VwdG9kYXRlKG5ld2ZvbGlvKTsKIAlmb2xpb19jbGVhcl9tYXBwZWR0b2Rpc2sobmV3Zm9s
aW8pOwogCiAJaWYgKGZ1c2VfY2hlY2tfZm9saW8obmV3Zm9saW8pICE9IDApCg==
--0000000000003d0742062045b1fb--
