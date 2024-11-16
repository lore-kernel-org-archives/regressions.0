Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CEA161
	for <regressions@lists.linux.dev>; Sat, 16 Nov 2024 01:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731720703; cv=none; b=iUBG/BwtimVweKQalLziH/yYLjRITUTH/iO7lf9t42qrTup/V74WiAuZ7BW6LU7UlYeB3ObMkfzvz4Zf0bAakYZGnqg8hrj1/8Cber6Gra8HNaQz0vZ3dMz2ar0RqmDQsbSCs7zDxEvNUMj+xIobGJPdoE4aK3teVK34777139A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731720703; c=relaxed/simple;
	bh=UyhC43pZiyPSP9M0LAH70oO3s1X/Nxzx97WWOngNUN8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bX26rCjMyaECkxQINzB8c0vcp+fuXCOJO2HnaDWO18AVWSJgPpdIR5S2ebcEEagFY5Wk1d02u+QP5M8LC0FZ9T02ovMEf+d7Er2dF99r9cJlzP82K5tVI2b6Ai4zpJbY5Mr8QIwHMdWMcUHmcAsXmzplISARTUJ5qrcwYUY0my4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UqIdpR4z; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UqIdpR4z"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3e6104701ffso1445341b6e.0
        for <regressions@lists.linux.dev>; Fri, 15 Nov 2024 17:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731720701; x=1732325501; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5G9v5idvngpVVbVWYeTOgnhwaczVG7ZO7E+ci5v9gPk=;
        b=UqIdpR4zVGroVVFDJ0Le2zCkmR9hLVbxuwG2NnGtowZdH4Xva7sTkplcevCnSJJd98
         7ZmluGsjS7UiyfxB3rpbBvbJuXwByOVSGmu/GeHuAdklKEOJyXWFEzLseKiw8LnT17Wi
         bAJG5nxUB4nxE878wx0r4wImeJ+3R/0CC5x/4S9xiet2jqI3fI9VPX5y7J2C2xErEoaF
         8KE5t/VvwJQY1WM7Wnj98bZU661iaebtqq99XJhVW/sX+c36JwwI83cPBge5JERetzyi
         XIC8OL/UZNJUXgSEA7nnGwZx3d01it5Neb62Uy3pZWmY4wNyoIeTaFkxlOz8jq39nWQb
         egcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731720701; x=1732325501;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5G9v5idvngpVVbVWYeTOgnhwaczVG7ZO7E+ci5v9gPk=;
        b=LIT43YCfkq10okDxm5ZBIc0q55MyKgvvPB8JmXnsTW/Z2BaAn8jSvrrx9MU1C7xaWF
         D8zQeSB2VovynPJgODL0327ghgzhoqlm1UiQ5wwVb/R5SqD9Dl7eaWdmRq8m/S3SZwDY
         qiRhB36IsxGhePGnONZnOGNqC+kVPYlI6pQtG1uK8Vv73PtUuOI4kYyb72Hqc7BNkqxF
         D3iW5PuhW+HbZ3C6Oqx58zENqvfz9teSe3DZSwKAFj1xlDXWJvUmm3lMK8xVx93AJisB
         hAzVkGYl7qsy4IKqv4Gm6KXi8eXlJXNjrgYkfcpqHDSNnNrnLPE6JNHaKfcZhnF8ZF5d
         KikQ==
X-Forwarded-Encrypted: i=1; AJvYcCValTu3hvPHYyJpI4u8RL+jmszLd324DLcCHsOj6S+zhlUqHpJ+ZBoeeKX1K1aNK24GWk3EqJklbRUPZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzT5/PctTeJrE8thKZeI8Pk1v5VAHlW2Y2jnRlyi2qlOr3EFa5t
	IRUOrPQoyvBE1mZnC9mI6Krb13PtqCEPiaY5pa+ZDnVfFrmA5FEd36jNJOPpMg==
X-Google-Smtp-Source: AGHT+IEWc+wlunTzrsI5c65XXRyz//87jPEgvtqfK7vhTML3CHq0ByVXCrQTL8TaORbfZcuR68uHxw==
X-Received: by 2002:a05:6808:1b99:b0:3e5:e72e:17c8 with SMTP id 5614622812f47-3e7bc7d31e3mr5511067b6e.21.1731720701418;
        Fri, 15 Nov 2024 17:31:41 -0800 (PST)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5eeabdbdb0dsm1006415eaf.42.2024.11.15.17.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 17:31:40 -0800 (PST)
Date: Fri, 15 Nov 2024 17:31:38 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
To: Chuck Lever <chuck.lever@oracle.com>
cc: Jeongjun Park <aha310510@gmail.com>, akpm@linux-foundation.org, 
    stable@vger.kernel.org, regressions@lists.linux.dev, 
    linux-nfs@vger.kernel.org, hughd@google.com, yuzhao@google.com
Subject: Re: tmpfs hang after v6.12-rc6
In-Reply-To: <ZzeQ1m3xIjrbUMDv@tissot.1015granger.net>
Message-ID: <b40e7156-7500-5268-4c3d-c61a6382d1f0@google.com>
References: <ZzdxKF39VEmXSSyN@tissot.1015granger.net> <Zzd12OGPDnZTMZ6t@tissot.1015granger.net> <CAO9qdTGLn6QWJg71Ad2xcobiTHE5ovoUxSqvrDDrE_i1+uqUQw@mail.gmail.com> <Zzd5YaI99+hieQV+@tissot.1015granger.net> <CAO9qdTEaYa639ebHX8Qd0_FqOZUZLc_JvYNyxepUthGyDqw_Bw@mail.gmail.com>
 <ZzeQ1m3xIjrbUMDv@tissot.1015granger.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Nov 2024, Chuck Lever wrote:
> 
> As I said before, I've failed to find any file system getattr method
> that explicitly takes the inode's semaphore around a
> generic_fillattr() call. My understanding is that these methods
> assume that their caller handles appropriate serialization.
> Therefore, taking the inode semaphore at all in shmem_getattr()
> seems to me to be the wrong approach entirely.
> 
> The point of reverting immediately is that any fix can't possibly
> get the review and testing it deserves three days before v6.12
> becomes final. Also, it's not clear what the rush to fix the
> KCSAN splat is; according to the Fixes: tag, this issue has been
> present for years without causing overt problems. It doesn't feel
> like this change belongs in an -rc in the first place.
> 
> Please revert d949d1d14fa2, then let's discuss a proper fix in a
> separate thread. Thanks!

Thanks so much for reporting this issue, Chuck: just in time.

I agree abso-lutely with you: I was just preparing a revert,
when I saw that akpm is already on it: great, thanks Andrew.

I was not very keen to see that locking added, just to silence a syzbot
sanitizer splat: added where there has never been any practical problem
(and the result of any stat immediately stale anyway).  I was hoping we
might get a performance regression reported, but a hang serves better!

If there's a "data_race"-like annotation that can be added to silence
the sanitizer, okay.  But more locking?  I don't think so.

Hugh
